using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace ecochase
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"] != null || Session["password"] != null)
            {
                if (Session["username"].ToString() == "admin" && Session["password"].ToString() == "Ecochase1483e")
                {
                    PanelAdmin.Visible = true;
                }
                else
                {
                    PanelUsers.Visible = true;
                    GetScore();
                    if (Session["flag"] != null)
                    {
                        if (Session["flag"].Equals("1"))
                        {
                            lblStatus.Text = "Your previous request for " + Session["pointss"] + " point(s) was accepted.";
                            lblStatus.ForeColor = System.Drawing.Color.Green;
                        }
                        else if (Session["flag"].Equals("0"))
                        {
                            lblStatus.Text = "Your previous request for " + Session["pointss"] + " point(s) was declined.";
                            lblStatus.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    if (!IsPostBack)
                    {
                        GetScore();
                    }
                }
            }
            else
            {
                Response.Redirect("~/Error.aspx");
            }

        }

        public void GetScore()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ecochaseGetScore", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paramUsername = new SqlParameter("@Username", Session["username"]);
                cmd.Parameters.Add(paramUsername);
                if((cmd.ExecuteScalar()).ToString() == "")
                {
                    lblTotalScore.Text = "0 Points";
                }
                else
                {
                    lblTotalScore.Text = (cmd.ExecuteScalar()).ToString() + " Point(s)";
                }

            }
        }

        
        protected void GridViewHome_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "addTask")
            {
                int indexVal = Convert.ToInt32(e.CommandArgument.ToString());
                string activityPointsNumber = GridViewHome.Rows[indexVal].Cells[1].Text;
                int activityIdNumber = ((int)indexVal + 1);
                lblUploadStatus.Text = "Upload a file to collect " + activityPointsNumber + " points <br/>";
                lblStatus.Text = "";
                Session["activityPointsNumber"] = activityPointsNumber;
                Session["activityIdNumber"] = activityIdNumber;
                submitBtn.Enabled = true;
            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(Session["activityIdNumber"]);
            int Points = Convert.ToInt32(Session["activityPointsNumber"]);

            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);

            if (Id >= 1 && Id <= 20)
            {
                lblStatus.Text = "";
                if (fileName != "")
                {
                    lblUploadStatus.Text = "";
                    if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" ||
                        fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".gif")
                    {
                        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            FileUpload1.SaveAs(Server.MapPath("~/UploadedImages/") + Path.GetFileName(FileUpload1.FileName));
                            string link = "UploadedImages/" + Path.GetFileName(FileUpload1.FileName);
                            con.Open();
                            SqlCommand cmd = new SqlCommand("ecochaseInsertIntoAdmin", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            SqlParameter paramUsername = new SqlParameter("@Username", Session["username"]);
                            cmd.Parameters.Add(paramUsername);
                            SqlParameter paramActivityId = new SqlParameter("@ActivityId", Id);
                            cmd.Parameters.Add(paramActivityId);
                            SqlParameter paramActivityPoints = new SqlParameter("@ActivityPoints", Points);
                            cmd.Parameters.Add(paramActivityPoints);
                            SqlParameter paramActivityDate = new SqlParameter("@ActivityDate", DateTime.Now.ToShortDateString());
                            cmd.Parameters.Add(paramActivityDate);
                            SqlParameter paramImageUrl = new SqlParameter("@ImagePath", link);
                            cmd.Parameters.Add(paramImageUrl);
                            cmd.ExecuteNonQuery();
                            GridViewAdmin.DataBind();
                            lblStatus.Text = "Image send to Administrator for validation. Select a new activity to complete.";
                            lblStatus.ForeColor = System.Drawing.Color.Green;
                            submitBtn.Enabled = false;
                        }
                    }
                    else
                    {
                        lblUploadStatus.Text = "Only (.jpg, .png, .gif & .bmp) images can be uploaded.";
                        lblUploadStatus.ForeColor = System.Drawing.Color.Red; 
                    }
                }
                else
                {
                    lblUploadStatus.Text = "Select an image to upload.";
                    lblUploadStatus.ForeColor = System.Drawing.Color.Red;
                }

            }
            else
            {
                lblUploadStatus.Text = "Select an activity first.";
                lblUploadStatus.ForeColor = System.Drawing.Color.Red;
            }
        }

        
        protected void GridViewAdmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmdDecline")
            {
                int indexVal = Convert.ToInt32(e.CommandArgument.ToString());
                string userId = GridViewAdmin.Rows[indexVal].Cells[0].Text;
                string useractId = GridViewAdmin.Rows[indexVal].Cells[3].Text;
                Session["pointss"] = useractId;
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("ecochaseDelete", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter paramId = new SqlParameter("@Id", userId);
                    cmd.Parameters.Add(paramId);
                    cmd.ExecuteNonQuery();
                    GridViewAdmin.DataBind();
                    Session["flag"] = "0";
                }
            }
            else if (e.CommandName == "cmdAccept")
            {
                int indexVal = Convert.ToInt32(e.CommandArgument.ToString());
                //Session["indexVal"] = indexVal.ToString();
                int Id = Convert.ToInt32(GridViewAdmin.Rows[indexVal].Cells[0].Text);
                string username = GridViewAdmin.Rows[indexVal].Cells[1].Text;
                int activityid = Convert.ToInt32(GridViewAdmin.Rows[indexVal].Cells[2].Text);
                int individualscore = Convert.ToInt32(GridViewAdmin.Rows[indexVal].Cells[3].Text);
                DateTime activitydate = Convert.ToDateTime(GridViewAdmin.Rows[indexVal].Cells[4].Text);
                Image img = (Image)GridViewAdmin.Rows[indexVal].Cells[5].Controls[0];

                string url = img.ImageUrl;

                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("ecochaseAcceptRequestF", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter paramId = new SqlParameter("@Id", Id);
                    cmd.Parameters.Add(paramId);
                    SqlParameter paramUsername = new SqlParameter("@Username", username);
                    cmd.Parameters.Add(paramUsername);
                    SqlParameter paramActivityId = new SqlParameter("@ActivityId", activityid);
                    cmd.Parameters.Add(paramActivityId);
                    SqlParameter paramActivityPoints = new SqlParameter("@ActivityPoints", individualscore);
                    cmd.Parameters.Add(paramActivityPoints);
                    SqlParameter paramActivityDate = new SqlParameter("@ActivityDate", activitydate);
                    cmd.Parameters.Add(paramActivityDate);
                    SqlParameter paramImageUrl = new SqlParameter("@ImagePath", url);
                    cmd.Parameters.Add(paramImageUrl);
                    cmd.ExecuteNonQuery();
                    GridViewAdmin.DataBind();
                    Session["flag"] = "1";
                    //GetScore();

                }

            }
        }
    }
}