using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doktorum.AdminPages
{
    public partial class hakkimdaEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                HttpPostedFile yuklenecekDosya = DosyaSec.PostedFile;
                if (yuklenecekDosya != null)
                {
                    FileInfo dosyaBilgisi = new FileInfo(yuklenecekDosya.FileName);
                    string klasor = "images/hakkimda/";
                    string yuklemeYeri = Server.MapPath("~/" + klasor + "/" + dosyaBilgisi.Name);
                    string veriyolu = "../" + klasor + "/" + dosyaBilgisi.Name;
                    DosyaSec.SaveAs(yuklemeYeri);

                    SqlHakkimda.InsertParameters["Baslik"].DefaultValue = txtBaslik.Text;
                    SqlHakkimda.InsertParameters["Ad"].DefaultValue = txtAd.Text;
                    SqlHakkimda.InsertParameters["Soyad"].DefaultValue = txtSoyad.Text;
                    SqlHakkimda.InsertParameters["Aciklama"].DefaultValue = ckeditor1.Text;
                    SqlHakkimda.InsertParameters["Resim"].DefaultValue = veriyolu;
                    SqlHakkimda.InsertParameters["Yayinla"].DefaultValue = "true";
                    SqlHakkimda.Insert();

                    DataContext.MesajGoster(this, "Bilgileriniz basarıyla yüklenmiştir...");
                    temizlik();
                }
            }
            catch (Exception ex)
            {

                DataContext.MesajGoster(this, ex.Message);
            }

        }

        private void temizlik()
        {
            txtAd.Text = "";
            txtSoyad.Text = "";
            txtBaslik.Text = "";
            ckeditor1.Text = "";
        }
    }
}