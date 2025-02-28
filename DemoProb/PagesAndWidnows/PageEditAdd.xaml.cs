using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Windows;

namespace DemoProb.PagesAndWidnows
{
    public partial class PageEditAdd : Window
    {
        private BazaDan.BazaDan bd = new BazaDan.BazaDan();
        private BazaDan.Partners currentPartner;

        public PageEditAdd(BazaDan.Partners partner = null)
        {
            InitializeComponent();
            this.DataContext = this;

            if (partner != null)
            {
                currentPartner = partner;
                FillPartnerData(partner);
            }
            else
            {
                LoadPartnerTypes();
            }
        }
        private void LoadPartnerTypes(int? selectedPartnerTypeId = null)
        {
            using (var db = new BazaDan.BazaDan())
            {
                var partnerTypes = db.PartnerType.ToList();
                PartnerTypeComboBox.ItemsSource = partnerTypes;
                PartnerTypeComboBox.DisplayMemberPath = "PartnerTypes";
                PartnerTypeComboBox.SelectedValuePath = "IDPartnerType";
            }
            this.Dispatcher.InvokeAsync(() =>
            {
                if (selectedPartnerTypeId.HasValue &&
                    PartnerTypeComboBox.Items.Cast<BazaDan.PartnerType>().Any(pt => pt.IDPartnerType == selectedPartnerTypeId))
                {
                    PartnerTypeComboBox.SelectedValue = selectedPartnerTypeId.Value;
                }
                else if (PartnerTypeComboBox.Items.Count > 0)
                {
                    PartnerTypeComboBox.SelectedIndex = 0;
                }
            }, System.Windows.Threading.DispatcherPriority.Background);
        }
        private void FillPartnerData(BazaDan.Partners partner)
        {
            PartnerNameTextBox.Text = partner.PartenerName;
            InnTextBox.Text = partner.INN;
            RateTextBox.Text = partner.Rate.ToString();
            AddressTextBox.Text = partner.YrAdressPartner;
            DirectorNameTextBox.Text = $"{partner.DirectorName} {partner.DirectorSecondName} {partner.DirectorLastName}";
            PhoneTextBox.Text = partner.Phone;
            EmailTextBox.Text = partner.Email;
            LoadPartnerTypes(partner.IDPartnerType);
        }
        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(PartnerNameTextBox.Text) ||
                    string.IsNullOrWhiteSpace(RateTextBox.Text) ||
                    string.IsNullOrWhiteSpace(AddressTextBox.Text) ||
                    string.IsNullOrWhiteSpace(DirectorNameTextBox.Text) ||
                    string.IsNullOrWhiteSpace(PhoneTextBox.Text) ||
                    string.IsNullOrWhiteSpace(EmailTextBox.Text) ||
                    PartnerTypeComboBox.SelectedValue == null)
                {
                    MessageBox.Show("Пожалуйста, заполните все поля.");
                    return;
                }
                var partnerName = PartnerNameTextBox.Text;
                var rate = int.Parse(RateTextBox.Text);
                var address = AddressTextBox.Text;
                var directorName = DirectorNameTextBox.Text.Split(' ');
                var phone = PhoneTextBox.Text;
                var email = EmailTextBox.Text;
                var inn = InnTextBox.Text;
                var selectedPartnerTypeId = (int)PartnerTypeComboBox.SelectedValue;
                using (var db = new BazaDan.BazaDan())
                {
                    var exists = db.PartnerType.Any(pt => pt.IDPartnerType == selectedPartnerTypeId);
                    if (!exists)
                    {
                        MessageBox.Show("Выбранный тип партнёра не существует в базе данных.");
                        return;
                    }
                    if (currentPartner == null)
                    {
                        var newPartner = new BazaDan.Partners
                        {
                            PartenerName = partnerName,
                            Rate = rate,
                            YrAdressPartner = address,
                            DirectorName = directorName[0],
                            DirectorSecondName = directorName.Length > 1 ? directorName[1] : string.Empty,
                            DirectorLastName = directorName.Length > 2 ? directorName[2] : string.Empty,
                            Phone = phone,
                            Email = email,
                            INN = inn,
                            IDPartnerType = selectedPartnerTypeId
                        };
                        db.Partners.Add(newPartner);
                    }
                    else
                    {
                        currentPartner = db.Partners.Find(currentPartner.IDPartners);
                        if (currentPartner != null)
                        {
                            currentPartner.INN = inn;
                            currentPartner.PartenerName = partnerName;
                            currentPartner.Rate = rate;
                            currentPartner.YrAdressPartner = address;
                            currentPartner.DirectorName = directorName[0];
                            currentPartner.DirectorSecondName = directorName.Length > 1 ? directorName[1] : string.Empty;
                            currentPartner.DirectorLastName = directorName.Length > 2 ? directorName[2] : string.Empty;
                            currentPartner.Phone = phone;
                            currentPartner.Email = email;
                            currentPartner.IDPartnerType = selectedPartnerTypeId;
                            db.Entry(currentPartner).State = EntityState.Modified;
                        }
                    }
                    db.SaveChanges();
                    MessageBox.Show("Данные успешно сохранены!");
                    this.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при сохранении данных: {ex.Message}");
            }
        }
    }
}
