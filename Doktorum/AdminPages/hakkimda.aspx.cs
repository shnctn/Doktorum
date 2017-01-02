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
    public partial class Hakkimda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                return;
            }
            VeriGetir();
        }
        private void VeriGetir()
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

            drBaslik.Items.Insert(0, new ListItem("Görüntülemek istediğiniz Cv seçiniz...", "0"));
        }
        protected void drBaslik_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int secilenid = Convert.ToInt32(drBaslik.SelectedValue.ToString());

            SqlConnection conn = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Hakkimda where ID=@id", conn);

            cmd.Parameters.AddWithValue("@id", secilenid);
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
    }
}
