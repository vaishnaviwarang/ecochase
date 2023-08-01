using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecochase
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null || Session["password"] != null)
            {
                panelAboutUs.Visible = true;
            }
            else
            {
                Response.Redirect("~/Error.aspx");
            }
        }
    }
}