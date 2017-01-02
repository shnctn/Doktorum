using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doktorum.AdminPages
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                HttpPostedFile yuklenecekDosya = ResimSec.PostedFile;
                if (yuklenecekDosya != null)
                {
                    FileInfo dosyaBilgisi = new FileInfo(yuklenecekDosya.FileName);
                    string klasor = "images/800.400/";
                    string yuklemeYeri = Server.MapPath("~/" + klasor + "/" + dosyaBilgisi.Name);
                    string veriyolu = "../" + klasor + "/" + dosyaBilgisi.Name;
                    ResimSec.SaveAs(yuklemeYeri);

                    SqlSlider.InsertParameters["Slider"].DefaultValue = veriyolu;
                    SqlSlider.InsertParameters["Alt"].DefaultValue = txtAd.Text;
                    SqlSlider.Insert();

                    DataContext.MesajGoster(this,"Slider için resminiz yüklenmiştir...");
                    txtAd.Text = "";
                   
                }
            }
            catch (Exception ex)
            {

                DataContext.MesajGoster(this, ex.Message);
            }
          
           
        }
    }
}