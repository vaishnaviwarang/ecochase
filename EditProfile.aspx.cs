using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ecochase
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["username"] != null || Session["password"] != null)
                {
                    if (Session["username"].ToString() == "admin" && Session["password"].ToString() == "Ecochase1483e")
                    {
                        EditProfile.Visible = false;
                    }
                    else
                    {
                        EditProfile.Visible = true;
                        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            con.Open();
                            string query = "SELECT userName,firstName,lastName,emailId from userSignUp where userName ='" + Session["username"].ToString() + "'";
                            SqlCommand cmd = new SqlCommand(query, con);
                            SqlDataReader dr = cmd.ExecuteReader();
                            if (dr.Read())
                            {
                                txtUsername.Text = dr["userName"].ToString();
                                txtFirstName.Text = dr["firstName"].ToString();
                                txtLastName.Text = dr["lastName"].ToString();
                                txtEmail.Text = dr["emailId"].ToString();

                            }
                            dr.Close();
                        }
                    }
                }
                else
                {
                    Response.Redirect("~/Error.aspx");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                
                    SqlCommand cmd = new SqlCommand("ecochaseUpdate",con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter paramFirstName = new SqlParameter("@firstname",txtFirstName.Text);
                    cmd.Parameters.Add(paramFirstName);
                    SqlParameter paramLastName = new SqlParameter("@lastname", txtLastName.Text);
                    cmd.Parameters.Add(paramLastName);
                    SqlParameter paramEmail = new SqlParameter("@emailaddress", txtEmail.Text);
                    cmd.Parameters.Add(paramEmail);
                    SqlParameter paramUsername = new SqlParameter("@username", txtUsername.Text);
                    cmd.Parameters.Add(paramUsername);
                    cmd.ExecuteNonQuery();
                    lblValidate.Text = "Update changes successful!";
                    lblValidate.ForeColor = System.Drawing.Color.Green;
                
            }
        }
    }
}