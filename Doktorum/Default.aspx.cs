using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doktorum
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ResimGetir();
            YaziGetir();
        }

        private void ResimGetir()
        {
            SqlConnection conn = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Slider Order by ID desc", conn);

            try
            {
               
                SqlDataAdapter dat = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dat.Fill(dt);
                rptSlider.DataSource = dt;
                rptSlider.DataBind();

            }
            catch (Exception ex)
            {
                DataContext.MesajGoster((Page)HttpContext.Current.CurrentHandler, ex.Message);
            }
            finally
            {
                cmd.Dispose();
                conn.Dispose();
            }

        }

        private void YaziGetir()
        {
            SqlConnection conn = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("select top 9 * from Ameliyatlarim Order by ID desc", conn);

            

            try
            {

                SqlDataAdapter dat = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dat.Fill(dt);
                ListAmeliyat.DataSource = dt;
                ListAmeliyat.DataBind();

            }
            catch (Exception ex)
            {
                DataContext.MesajGoster((Page)HttpContext.Current.CurrentHandler, ex.Message);
            }
            finally
            {
                cmd.Dispose();
                conn.Dispose();
            }

        }
        public static string LinkDuzenle(string Metin)
        {
            string deger = Metin;
            deger = deger.Replace("'", "");
            deger = deger.Replace(" ", "_");
            deger = deger.Replace("<", "");
            deger = deger.Replace(">", "");
            deger = deger.Replace("&", "");
            deger = deger.Replace("[", "");
            deger = deger.Replace("]", "");
            deger = deger.Replace("ı", "i");
            deger = deger.Replace("ö", "o");
            deger = deger.Replace("ü", "u");
            deger = deger.Replace("ş", "s");
            deger = deger.Replace("ç", "c");
            deger = deger.Replace("ğ", "g");
            deger = deger.Replace("İ", "i");
            deger = deger.Replace("Ö", "o");
            deger = deger.Replace("Ü", "u");
            deger = deger.Replace("Ş", "s");
            deger = deger.Replace("Ç", "c");
            deger = deger.Replace("Ğ", "g");

            return deger;
        }
    }
}