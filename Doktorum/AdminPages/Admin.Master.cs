using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doktorum.AdminPages
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"]==null || Session["AdSoyad"] ==null )
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            else
            {
               lblSesion.Text=Session["AdSoyad"].ToString();
               lblsesion1.Text= Session["AdSoyad"].ToString();
            }
            


        }

        protected void linkCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/AdminLogin.aspx");
        }
    }
}