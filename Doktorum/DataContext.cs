using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doktorum
{
    public class DataContext
    {
        private static string _connectionString;

        public static string ConnectionString
        {
            get
            {
                return _connectionString;
            }

            set
            {
                _connectionString = value;
            }
        }


        public static void MesajGoster(Page targetpage, string message)
        {
            Literal ltr = new Literal();
            ltr.Text = "<script type=\"text/javascript\">alert('" + message + "')</script>";
            targetpage.Header.Controls.Add(ltr);
        }
    }
}