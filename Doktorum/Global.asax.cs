using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Doktorum
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(System.Web.Routing.RouteTable.Routes);  
        }

        private void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("Default", "Anasayfa", "~/Default.aspx");
            routes.MapPageRoute("About", "Hakkimda", "~/About.aspx");
            routes.MapPageRoute("Contact", "İletisim", "~/Contact.aspx");
            routes.MapPageRoute("MyOperations", "Ameliyatlarim", "~/MyOperations.aspx");
            routes.MapPageRoute("OperationsDetails", "Ameliyat_{Baslik}_{ID}", "~/OperationsDetails.aspx");
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            DataContext.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DataContext"].ConnectionString;
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}