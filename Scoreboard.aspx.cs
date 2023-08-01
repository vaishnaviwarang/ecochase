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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null || Session["password"] != null)
            {
                panelScoreboard.Visible = true;
                if (Session["username"].ToString() == "admin" && Session["password"].ToString() == "Ecochase1483e")
                {
                    btnGenerateReport.Visible = false;
                    hide12.Visible = false;
                }
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    string query = "SELECT TOP 5 userSignUp.userName AS Usernames, tableState.StateName AS States, SUM(userRecords.scores) AS TotalScores " +
                                        "FROM tableState " +
                                        "JOIN userSignUp ON tableState.StateId = userSignUp.StateId " +
                                        "JOIN userRecords ON userSignUp.userName = userRecords.usernames " +
                                        "GROUP BY userSignUp.userName, tableState.StateName " +
                                        "ORDER BY SUM(userRecords.scores) DESC ";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader rd = cmd.ExecuteReader();
                    GridViewTop5.DataSource = rd;
                    GridViewTop5.DataBind();
                    rd.Close();
                    string query2 = "SELECT usernames AS Usernames, SUM(scores) AS TotalScore FROM userRecords GROUP BY Usernames";
                    SqlCommand cmds = new SqlCommand(query2, con);
                    DataTable dt = new DataTable();
                    SqlDataAdapter rdr = new SqlDataAdapter(cmds);
                    rdr.Fill(dt);
                    GridViewUsers.DataSource = dt;
                    GridViewUsers.DataBind();

                    string queryx = "DELETE FROM ecochaseNewTableData";
                    SqlCommand cmdx = new SqlCommand(queryx, con);
                    cmdx.ExecuteNonQuery();
                    // Bulk Copy to SQL Server   
                    SqlBulkCopy bulkInsert = new SqlBulkCopy(CS);

                    bulkInsert.ColumnMappings.Add("Usernames", "Username");
                    bulkInsert.ColumnMappings.Add("TotalScore", "score");

                    bulkInsert.DestinationTableName = "ecochaseNewTableData";
                    bulkInsert.WriteToServer(dt);

                    //BulkCopy Code end
                }
                if (!IsPostBack)
                {
                    SetImagesSequence();
                }
            }
            else
            {
                Response.Redirect("~/Error.aspx");
            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GridViewReport.Visible = false;
            GridViewUsers.Visible = true;
            lblReportValidation.Text = "";
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                if (txtSearch.Text != "")
                {
                    string queryS = "SELECT Username, score FROM ecochaseNewTableData WHERE Username LIKE " + "@validUsername" + " + '%'";
                    SqlCommand cmd = new SqlCommand(queryS, con);
                    SqlParameter paramValidUsername = new SqlParameter("@validUsername", txtSearch.Text);
                    cmd.Parameters.Add(paramValidUsername);
                    SqlDataAdapter sqda = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    sqda.Fill(ds);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.Read())
                    {
                        GridViewUsers.DataSource = ds;
                        GridViewUsers.DataBind();
                    }
                    else
                    {
                        lblReportValidation.Text = "No Users to Show";
                        lblReportValidation.ForeColor = System.Drawing.Color.Red;
                    }

                }

            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SetImagesSequence();
        }

        private void SetImagesSequence()
        {
            if(ViewState["ImageDisplayed"] == null)
            {
                BannerPlaceholderImg.ImageUrl = "~/SlideshowImages/1.jpg";
                ViewState["ImageDisplayed"] = 1;
            }
            else
            {
                int i = Convert.ToInt32(ViewState["ImageDisplayed"]);
                if(i == 3)
                {
                    BannerPlaceholderImg.ImageUrl = "~/SlideshowImages/1.jpg";
                    ViewState["ImageDisplayed"] = 1;
                }
                else
                {
                    i++;
                    BannerPlaceholderImg.ImageUrl = "~/SlideshowImages/" + i.ToString() + ".jpg";
                    ViewState["ImageDisplayed"] = i;
                }
            }
        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            GridViewUsers.Visible=false;
            GridViewReport.Visible=true;
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "SELECT activityIds AS ActivityNumber, scores AS Points,convert(varchar(11), activityDates, 106) AS Date from userRecords " +
                    "WHERE usernames = '" + Session["username"] + "' AND activityDates BETWEEN '" + txtStartDate.Text +
                    "' AND '" + txtEndDate.Text + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sqda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sqda.Fill(ds);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    GridViewReport.DataSource = ds;
                    GridViewReport.DataBind();
                }
                else
                {
                    lblReportValidation.Text = "No records Found. Complete activities and Try again.";
                    lblReportValidation.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void GridViewUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewUsers.PageIndex = e.NewPageIndex;
            UsersBind();
        }
        private void UsersBind()
        {
            GridViewReport.Visible = false;
            GridViewUsers.Visible = true;
            lblReportValidation.Text = "";
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                if (txtSearch.Text != "")
                {
                    string queryS = "SELECT Username, score FROM ecochaseNewTableData WHERE Username LIKE " + "@validUsername" + " + '%'";
                    SqlCommand cmd = new SqlCommand(queryS, con);
                    SqlParameter paramValidUsername = new SqlParameter("@validUsername", txtSearch.Text);
                    cmd.Parameters.Add(paramValidUsername);
                    SqlDataAdapter sqda = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    sqda.Fill(ds);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.Read())
                    {
                        GridViewUsers.DataSource = ds;
                        GridViewUsers.DataBind();
                    }
                    else
                    {
                        lblReportValidation.Text = "No Users to Show";
                        lblReportValidation.ForeColor = System.Drawing.Color.Red;
                    }
                    
                }
                else
                {
                    string query2 = "SELECT usernames AS Usernames, SUM(scores) AS TotalScore FROM userRecords GROUP BY Usernames";
                    SqlCommand cmds = new SqlCommand(query2, con);
                    DataTable dt = new DataTable();
                    SqlDataAdapter rdr = new SqlDataAdapter(cmds);
                    rdr.Fill(dt);
                    GridViewUsers.DataSource = dt;
                    GridViewUsers.DataBind();
                }
            }
        }

        protected void GridViewReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewReport.PageIndex = e.NewPageIndex;
            UsersBind2();
        }
        private void UsersBind2()
        {
            GridViewUsers.Visible = false;
            GridViewReport.Visible = true;
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "SELECT activityIds AS ActivityNumber, scores AS Points,convert(varchar(11), activityDates, 106) AS Date from userRecords " +
                    "WHERE usernames = '" + Session["username"] + "' AND activityDates BETWEEN '" + txtStartDate.Text +
                    "' AND '" + txtEndDate.Text + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sqda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sqda.Fill(ds);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    GridViewReport.DataSource = ds;
                    GridViewReport.DataBind();
                }
                else
                {
                    lblReportValidation.Text = "No records Found. Complete activities and Try again.";
                    lblReportValidation.ForeColor = System.Drawing.Color.Red;
                }
            }
            //GridViewReport.DataBind();
        }
    }

}