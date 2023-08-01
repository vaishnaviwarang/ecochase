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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("Select StateId, StateName from tableState", con);
                    con.Open();
                    DropDownListState.DataSource = cmd.ExecuteReader();
                    DropDownListState.DataTextField = "StateName";
                    DropDownListState.DataValueField = "StateId";
                    DropDownListState.DataBind();
                }
            }
            
        }

        protected void lblSubmit_Click(object sender, EventArgs e)
        {
            
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                try
                {
                    string query = "Insert into userSignUp values(@s_username,@s_fname,@s_lastname,@s_email,@s_ddlist,@s_password)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlParameter paramUsername = new SqlParameter("@s_username",txtUsername.Text);
                    cmd.Parameters.Add(paramUsername);
                    SqlParameter paramFirstname = new SqlParameter("@s_fname", txtFirstname.Text);
                    cmd.Parameters.Add(paramFirstname);
                    SqlParameter paramLastName = new SqlParameter("@s_lastname", txtLastname.Text);
                    cmd.Parameters.Add(paramLastName);
                    SqlParameter paramEmail = new SqlParameter("@s_email", txtEmail.Text);
                    cmd.Parameters.Add(paramEmail);
                    SqlParameter paramDdlist = new SqlParameter("@s_ddlist", DropDownListState.SelectedItem.Value);
                    cmd.Parameters.Add(paramDdlist);
                    SqlParameter paramPassword = new SqlParameter("@s_password", txtPassword.Text);
                    cmd.Parameters.Add(paramPassword);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/Login.aspx");
                }
                catch (SqlException ex)
                {
                    lblValidation.Text = "Username already exists.";
                }
                
            }
        }
    }
}