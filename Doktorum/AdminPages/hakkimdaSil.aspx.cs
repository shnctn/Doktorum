using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doktorum.AdminPages
{
    public partial class hakkimdaSil : System.Web.UI.Page
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

            ddlSil.Items.Insert(0, new ListItem("Silmek istediğniz Cv seçiniz...", "0"));
        }

        protected void BtnSil_Click(object sender, EventArgs e)
        {
            int secilenid = Convert.ToInt32(ddlSil.SelectedValue.ToString());

            SqlConnection conn = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("delete from Hakkimda where ID=@id", conn);

            cmd.Parameters.AddWithValue("@id", secilenid);
            try
            {
                if (conn.State == ConnectionState.Closed) conn.Open();
                cmd.ExecuteNonQuery();
                DataContext.MesajGoster(this,"Bilgileriniz silindi.");
               
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
            YaziGetir();
        }

        
    }
}