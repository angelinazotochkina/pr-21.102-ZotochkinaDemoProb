using DemoProb.BazaDan;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DemoProb.PagesAndWidnows
{
    /// <summary>
    /// Логика взаимодействия для Partners.xaml
    /// </summary>
    public partial class Partners : Page
    {
    

        ObservableCollection<BazaDan.Partners> partners { get; set; } = new ObservableCollection<BazaDan.Partners>();
        ObservableCollection<BazaDan.PartnerType> partnersType { get; set; } = new ObservableCollection<PartnerType>();
        private BazaDan.BazaDan bd = new BazaDan.BazaDan();

        public Partners()
        {
            InitializeComponent();
           
            Load();
          
           
        }

        public void Load()
        {
            try
            {
                using (var db = new BazaDan.BazaDan())
                {
                    var data = from partner in db.Partners
                               join partnerType in db.PartnerType on partner.IDPartnerType equals partnerType.IDPartnerType
                               select new
                               {
                                   partner.IDPartners,
                                   partner.PartenerName,
                                   partnerType.PartnerTypes,
                                  partnerType.IDPartnerType,
                                   partner.DirectorSecondName,
                                   partner.YrAdressPartner,
                                   partner.Email,
                                   partner.INN,
                                   partner.DirectorName,
                                   partner.DirectorLastName,
                                   partner.Phone,
                                   partner.Rate,
                                   TotalSales = (int?)db.PartnerProduct
.Where(pp => pp.IDPartner == partner.IDPartners)
.Sum(pp => pp.KolvoProduct) ?? 0
                               };

                    partners = new ObservableCollection<BazaDan.Partners>();

                    foreach (var item in data)
                    {
                  
                        int discount = 0;
                        if (item.TotalSales <= 10000)
                            discount = 0;
                        else if (item.TotalSales <= 50000)
                            discount = 5;
                        else if (item.TotalSales <= 300000)
                            discount = 10;
                        else
                            discount = 15;
                        var partnerType = new BazaDan.PartnerType
                        {
                            IDPartnerType = item.IDPartnerType,
                            PartnerTypes = item.PartnerTypes
                        };

                        partners.Add(new BazaDan.Partners
                        {
                            IDPartners = item.IDPartners,
                            PartenerName = item.PartenerName,
                            PartnerType = partnerType,
                            YrAdressPartner = item.YrAdressPartner,
                            Email = item.Email,
                            INN=item.INN,
                            DirectorSecondName = item.DirectorSecondName,
                            DirectorName = item.DirectorName,
                            DirectorLastName = item.DirectorLastName,
                            Phone = item.Phone,
                            Rate = item.Rate,
                            Discount = discount
                        });
                    }

                    MessageBox.Show($"Загружено записей: {partners.Count}");
                }

                DGProduct.ItemsSource = partners;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки данных: {ex.Message}");
            }
        }












        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedPartner = DGProduct.SelectedItem as BazaDan.Partners;
            if (selectedPartner != null)
            {
                // Открыть форму редактирования выбранного партнера
                PageEditAdd editPage = new PageEditAdd(selectedPartner);
                editPage.ShowDialog();
                Load(); // Перезагружаем данные
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите партнера для редактирования.");
            }
        }



        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            PageEditAdd addPage = new PageEditAdd();
            addPage.ShowDialog();
            Load();  
        }

       




    }
}
