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
    public partial class OperationsDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!string.IsNullOrEmpty(Ayarlar.Temizle(RouteData.Values["ID"].ToString())))
            {
                ViewState["AmeliyatID"] = Convert.ToInt32(Ayarlar.Temizle(RouteData.Values["ID"].ToString()));
                YaziGetir(Convert.ToInt32(Ayarlar.Temizle(RouteData.Values["ID"].ToString())));
                yorumGetir(Convert.ToInt32(Ayarlar.Temizle(RouteData.Values["ID"].ToString())));
            }
        }
        private void YaziGetir(int AmeliyatID)
        {
            SqlConnection conn = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Ameliyatlarim where ID=@id ", conn);

            cmd.Parameters.AddWithValue("@id", AmeliyatID);

            try
            {

                SqlDataAdapter dat = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dat.Fill(dt);
                RptAcik.DataSource = dt;
                RptAcik.DataBind();

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
        protected void ButtonKaydet_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("insert into Yorumlar(AdSoyad,YorumIcerik,Email,AmeliyatID,Onaylandimi) values(@adsoyad,@icerik,@email,@ameliyatID,@onaylandimi)", con);

            cmd.Parameters.Add("@adsoyad", SqlDbType.NVarChar, 100).Value = Txtad.Text;
            cmd.Parameters.Add("@icerik", SqlDbType.NVarChar, 1000).Value = txtYorum.Text;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar, 150).Value = txtEmail.Text;
            cmd.Parameters.Add("@ameliyatID", SqlDbType.Int).Value = Convert.ToInt32(ViewState["AmeliyatID"]);
            cmd.Parameters.Add("@onaylandimi", SqlDbType.Bit).Value = true;


            int ess = 0;
            try
            {
                if (con.State == ConnectionState.Closed) con.Open();
                ess = cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                DataContext.MesajGoster(this, ex.Message);
            }
            finally
            {
                cmd.Dispose();
                con.Dispose();
            }

            if (ess > 0)
            {
               DataContext.MesajGoster(this, "Yorumunuz Kaydedildi.");
                yorumGetir(Convert.ToInt32(ViewState["AmeliyatID"]));
            }
        }

        private void yorumGetir(int AmeliyatID)
        {
            SqlConnection con = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("select Adsoyad,YorumIcerik,yorumTarihi from Yorumlar where Onaylandimi=@Onay and AmeliyatID=@ID ", con);

            cmd.Parameters.AddWithValue("@Onay", '1');
            cmd.Parameters.AddWithValue("@ID", AmeliyatID);
            try
            {
                if (con.State == ConnectionState.Closed) con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                rptYorum.DataSource = dr;
                rptYorum.DataBind();

            }
            catch (Exception ex)
            {
                DataContext.MesajGoster(this, ex.Message);
            }
            finally
            {
                cmd.Dispose();
                con.Dispose();
            }
        }
    }
}