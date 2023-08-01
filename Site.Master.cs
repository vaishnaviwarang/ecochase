using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecochase
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "admin" && Session["password"].ToString() == "Ecochase1483e")
            {
                hideEdit.Visible = false; 
            }

        }
    }
}