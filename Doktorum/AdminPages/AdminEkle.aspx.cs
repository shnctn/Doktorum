using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doktorum.AdminPages
{
    public partial class AdminEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                SqlUyeler.InsertParameters["Adi"].DefaultValue = txtAd.Text;
                SqlUyeler.InsertParameters["Soyadi"].DefaultValue = txtsoyad.Text;
                SqlUyeler.InsertParameters["Email"].DefaultValue = txtEmail.Text;
                SqlUyeler.InsertParameters["UserName"].DefaultValue = txtUser.Text;
                SqlUyeler.InsertParameters["Password"].DefaultValue = txtSifre.Text;
                SqlUyeler.Insert();
                DataContext.MesajGoster(this, "Uyelik İşleminiz Gercekleştirildi.");
                temizlik();
            }
            catch (Exception ex)
            {
                DataContext.MesajGoster(this, ex.Message + ": Hata Mesajı.");
            }
           
        }
        private void temizlik()
        {
            txtAd.Text = "";
            txtEmail.Text = "";
            txtSifre.Text = "";
            txtsoyad.Text = "";
            txtUser.Text ="";
        }
    }
}