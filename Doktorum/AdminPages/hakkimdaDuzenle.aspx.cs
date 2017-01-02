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
    public partial class hakkimdaDuzenle : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("select * from Hakkimda", conn);

            try
            {

                SqlDataAdapter dat = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dat.Fill(dt);
                drBaslik.DataTextField = "Baslik";
                drBaslik.DataValueField = "ID";
                drBaslik.DataSource = dt;
                drBaslik.DataBind();

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

            drBaslik.Items.Insert(0, new ListItem("Güncelleme yapmak istediğniz Cv'yi seçiniz...", "0"));
        }
       
        protected void drBaslik_SelectedIndexChanged(object sender, EventArgs e)
        {

            int secilen = Convert.ToInt32(drBaslik.SelectedValue);
            SqlConnection conn = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Hakkimda Where ID=@ID", conn);

            cmd.Parameters.AddWithValue("@ID",secilen);
            try
            {

                if (conn.State == System.Data.ConnectionState.Closed) conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    
                    txtAd.Text = dr["Ad"].ToString();
                    txtSoyad.Text = dr["Soyad"].ToString();
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

                    SqlConnection con = new SqlConnection(DataContext.ConnectionString);
                    SqlCommand cmd = new SqlCommand("update Hakkimda set Ad = @ad, Soyad = @soyad, Aciklama = @aciklama, Resim = @resim where ID = @id and Baslik = @baslik", con);

                    cmd.Parameters.AddWithValue("@ad", txtAd.Text);
                    cmd.Parameters.AddWithValue("@soyad", txtSoyad.Text);
                    cmd.Parameters.AddWithValue("@aciklama", ckeditor1.Text);
                    cmd.Parameters.AddWithValue("@resim",veriyolu);
                    cmd.Parameters.AddWithValue("@id",Convert.ToInt32(drBaslik.SelectedValue));
                    cmd.Parameters.AddWithValue("@baslik", drBaslik.SelectedItem.ToString());

                                   
                        if (con.State == ConnectionState.Closed) con.Open();
                        cmd.ExecuteNonQuery();
                   
                    DataContext.MesajGoster(this, "Bilgileriniz Basarıyla Düzenlenmiştir...");
                    YaziGetir();
                }
            }
            catch (Exception ex)
            {

                DataContext.MesajGoster(this, ex.Message);
            }
        }

    }
}