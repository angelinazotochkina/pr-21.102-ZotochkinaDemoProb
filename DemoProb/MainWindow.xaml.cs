using System;
using System.Collections.Generic;
using System.Linq;
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
using DemoProb.PagesAndWidnows;

namespace DemoProb
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
             
            
        }

        private void Frame_Loaded(object sender, RoutedEventArgs e)
        {
            frm.NavigationService.Navigate(new Partners());
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (frm.NavigationService.CanGoBack)
            {
                frm.NavigationService.GoBack();  
            }
            else
            {
                MessageBox.Show("Вы не можете вернуться назад.");
            }
        }
    }
}
