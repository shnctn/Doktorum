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
    public partial class AmeliyatDuzenle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                return;
            }
            YaziGetir();
        }
        private void YaziGetir()
        {
            SqlConnection conn = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Ameliyatlarim", conn);

            try
            {

                SqlDataAdapter dat = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dat.Fill(dt);
                drBaslik.DataTextField = "Baslik";
                drBaslik.DataValueField = "ID";
                drBaslik.DataSource = dt;
                drBaslik.DataBind();


                ddlSil.DataTextField = "Baslik";
                ddlSil.DataValueField = "ID";
                ddlSil.DataSource = dt;
                ddlSil.DataBind();

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
            drBaslik.Items.Insert(0, new ListItem("Düzenlemek istediginiz ameliyatı seçiniz...", "0"));
            ddlSil.Items.Insert(0, new ListItem("Silmek istediğniz ameliyatı seçiniz...", "0"));
        }

        protected void drBaslik_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Ameliyatlarim Where ID=@ID", conn);

            cmd.Parameters.AddWithValue("@ID", drBaslik.SelectedValue);
            try
            {

                if (conn.State == System.Data.ConnectionState.Closed) conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {

                    txtBaslik.Text = dr["Baslik"].ToString();
                    ckeditor1.Text = dr["Aciklama"].ToString();
                }


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
        protected void guncelle_Click(object sender, EventArgs e)
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

                    SqlConnection con = new SqlConnection(DataContext.ConnectionString);
                    SqlCommand cmd = new SqlCommand("update Ameliyatlarim set Baslik=@baslik,Aciklama=@aciklama,Resim=@resim where ID=@id", con);

                    cmd.Parameters.AddWithValue("@baslik", txtBaslik.Text);
                    cmd.Parameters.AddWithValue("@aciklama", ckeditor1.Text);
                    cmd.Parameters.AddWithValue("@resim",  veriyolu);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(drBaslik.SelectedValue));
                    if (con.State == ConnectionState.Closed) con.Open();
                    cmd.ExecuteNonQuery();

                    DataContext.MesajGoster(this, "Bilgileriniz Basarıyla Düzenlenmiştir...");
                    temizlik();
                    YaziGetir();

                }
            }
            catch (Exception ex)
            {

                DataContext.MesajGoster(this, ex.Message);
            }
        }
        private void temizlik()
        {
            txtBaslik.Text = "";
            ckeditor1.Text = "";
        }
        protected void BtnSil_Click(object sender, EventArgs e)
        {
            int secilenid = Convert.ToInt32(ddlSil.SelectedValue.ToString());

            SqlConnection conn = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("delete from Ameliyatlarim where ID=@id", conn);

            cmd.Parameters.AddWithValue("@id", secilenid);
            try
            {
                if (conn.State == ConnectionState.Closed) conn.Open();
                cmd.ExecuteNonQuery();
                DataContext.MesajGoster(this, "Ameliyat bilginiz başariyla Silinmistir...");
                YaziGetir();
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

       
    }
}