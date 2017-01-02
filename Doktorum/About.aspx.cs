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
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            YaziGetir();
        }
        private void YaziGetir()
        {
            SqlConnection conn = new SqlConnection(DataContext.ConnectionString);
            SqlCommand cmd = new SqlCommand("select top 1 * from Hakkimda Order by ID desc", conn);



            try
            {

                SqlDataAdapter dat = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dat.Fill(dt);
                rptHakkimda.DataSource = dt;
                rptHakkimda.DataBind();

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