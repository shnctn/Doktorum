using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doktorum.AdminPages
{
    public partial class AmeliyatEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnKayit_Click(object sender, EventArgs e)
        {
            try
            {
                HttpPostedFile yuklenecekDosya = DosyaSec.PostedFile;
                if (yuklenecekDosya != null)
                {
                    FileInfo dosyaBilgisi = new FileInfo(yuklenecekDosya.FileName);
                    string klasor = "images/ameliyatlar/";
                    string yuklemeYeri = Server.MapPath("~/" + klasor + "/" + dosyaBilgisi.Name);
                    string veriyolu = "../" + klasor + "/" + dosyaBilgisi.Name;
                    DosyaSec.SaveAs(yuklemeYeri);

                    SqlAmeliyatlar.InsertParameters["Baslik"].DefaultValue = txtBaslik.Text;
                    SqlAmeliyatlar.InsertParameters["Aciklama"].DefaultValue = ckeditor.Text;
                    SqlAmeliyatlar.InsertParameters["Resim"].DefaultValue = veriyolu ;
                      SqlAmeliyatlar.Insert();

                    DataContext.MesajGoster(this, "Ameliyat Bilgileriniz yüklenmiştir...");
                    Temizlik();
                    
                }
            }
            catch (Exception ex)
            {
                DataContext.MesajGoster(this,ex.Message);
               
            }
        }
        private void Temizlik()
        {
            txtBaslik.Text = "";
            ckeditor.Text = "";
        }
    }
}