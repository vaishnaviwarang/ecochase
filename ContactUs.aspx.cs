using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace ecochase
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    MailMessage mailmessage = new MailMessage();
                    mailmessage.From = new MailAddress(txtEmail.Text);
                    mailmessage.To.Add("vaishnaviawarang@gmail.com");
                    mailmessage.Subject = txtSubject.Text;

                    mailmessage.Body = "<b>Sender Name : </b>" + txtName.Text + "<br/>" +
                        "<b>Sender Email : </b>" + txtEmail.Text + "<br/>"
                        + "<b>Comments : </b>" + txtComments.Text;
                    mailmessage.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.EnableSsl = true;
                    smtp.Credentials = new System.Net.NetworkCredential("vaishnaviawarang@gmail.com", "ixmwwgaszrbpttkm");
                    smtp.Send(mailmessage);
                    lblStatus.Text = "Thankyou for contacting us.";
                    lblStatus.ForeColor = System.Drawing.Color.Blue;
                    txtName.Enabled = false;
                    txtEmail.Enabled = false;
                    txtComments.Enabled = false;
                    txtSubject.Enabled = false;
                    btnSubmit.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "There is an unknown problem. Please try later.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}