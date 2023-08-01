using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ecochase
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("ecochaseLogin", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter paramUsername = new SqlParameter("@Username", txtUsername.Text);
                    cmd.Parameters.Add(paramUsername);
                    SqlParameter paramPassword = new SqlParameter("@Password", txtPassword.Text);
                    cmd.Parameters.Add(paramPassword);
                    con.Open();
                    int scalarValue = Convert.ToInt32(cmd.ExecuteScalar());
                    if (scalarValue > 0)
                    {
                        Session["username"] = txtUsername.Text;
                        Session["password"] = txtPassword.Text;
                        Response.Redirect("~/Home.aspx");
                    }
                    else
                    {
                        txtValidation.Text = "Invalid username or password";
                        txtValidation.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    txtValidation.Text = "Failed attempt to Login";
                    txtValidation.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}