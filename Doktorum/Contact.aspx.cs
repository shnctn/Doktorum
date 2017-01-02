using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doktorum
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMail_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage ePosta = new MailMessage();
                ePosta.From = new MailAddress("websitemmail0@gmail.com");
                ePosta.To.Add("anadolubeyincerrahi@gmail.com");
                ePosta.Subject = TextAd.Text + "__" + TextTelefon.Text + "__" + TextEPosta.Text;
                ePosta.Body = TextIcerik.Text;
              
                SmtpClient smtp = new SmtpClient();
                smtp.Credentials = new NetworkCredential("websitemmail0@gmail.com", "shnctn05");
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Host = "smtp.gmail.com";
                smtp.Send(ePosta);
                DataContext.MesajGoster(this, "Mailiniz basarıyla gönderildi.");
            }
            catch (Exception ex)
            {
                DataContext.MesajGoster(this,"Mail gönderirken hata olustu :" + ex.Message);
            }
        }
        
    }
}