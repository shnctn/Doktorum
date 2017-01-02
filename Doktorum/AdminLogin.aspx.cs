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
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GirisYap_Click(object sender, EventArgs e)
        {

            if (TextBox1.Text != "" & TextBox2.Text != "")
            {
                 SqlConnection baglanti = new SqlConnection(DataContext.ConnectionString);
                SqlCommand sorgu = new SqlCommand("SELECT * FROM Users WHERE UserName=@user AND Password=@pass", baglanti);

                sorgu.Parameters.Add("@user", SqlDbType.VarChar).Value = TextBox1.Text;
                sorgu.Parameters.Add("@pass", SqlDbType.VarChar).Value = TextBox2.Text;

                baglanti.Open();

                SqlDataReader oku = sorgu.ExecuteReader();
                // Eğer bir kayıt varsa
                if (oku.Read())
                {
                    // Okunan verileri Session(Oturum) değişkenlerinde saklayalım
                    Session["ID"] = oku["ID"].ToString();
                    Session["AdSoyad"] = oku["Adi"].ToString() + " " + oku["Soyadi"].ToString();
                    
                    // Giriş sayfasına yönlendir
                    Response.Redirect("~/AdminPages/AdminPage.aspx");
                }
                else // Kayıt yoksa
                {
                    labelSonuc.Text = "Kullanıcı Adı ve şifre Hatalıdır. Lütfen Kontrol Ediniz. !!!";
                    labelSonuc.ForeColor = System.Drawing.Color.Red;
                }
               sorgu.Dispose(); // Reader nesnesini kapat
                baglanti.Dispose(); // Bağlantı nesnesini kapat
            }


        }
    }
}