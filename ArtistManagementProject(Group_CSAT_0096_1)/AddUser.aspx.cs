using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtistManagementProject_Group_CSAT_0096_1_
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //int UserID = Convert.ToInt32(Request.Params.Get("UserID"));
                //SetUserData(UserID);
                dropdown_Department.DataSource = GetDepartmentData();
                dropdown_Department.DataTextField = "DName";
                dropdown_Department.DataValueField = "DeptId";
                dropdown_Department.DataBind();
                //dropdown_Department.SelectedValue = 
            }
        }
        private DataSet GetDepartmentData()
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //string query = "select * from Department";
            string query = "select 0 as DeptId, 'Select' as DName union select * from Department";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            adapter.Fill(ds);
            con.Close();
            return ds;
        }

        protected void btn_SaveClick(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (IsDuplicateEmail())
                {
                    lbl_EmailID.Text = "Email Already exists";
                    lbl_EmailID.Visible = true;
                }
                else
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string query = "INSERT INTO Users(EmailAddress,Password,ConfirmPassword,FirstName,LastName,DateOfBirth,RoleId,DeptId,PhoneNumber,Address,PostalCode)VALUES(@EmailAddress,@Password,@ConfirmPassword,@FirstName,@LastName,@DateOfBirth,@RoleId,@DepartmentID,@PhoneNumber,@Address,@PostalCode)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@EmailAddress", txt_Email.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txt_NewPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@ConfirmPassword", txt_NewConfirmPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@FirstName", txt_FirstName.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastName", txt_LastName.Text.Trim());
                    cmd.Parameters.AddWithValue("@DateOfBirth", txt_DOB.Value.Trim()); //having html date textbox
                    cmd.Parameters.AddWithValue("@RoleId", dropdown_AccessType.SelectedValue);
                    cmd.Parameters.AddWithValue("@DepartmentID", dropdown_Department.SelectedValue);
                    cmd.Parameters.AddWithValue("@PhoneNumber", txt_PhnNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txt_FullAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@PostalCode", txt_PostalCode.Text.Trim());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //Response.Write("<script>alert('User added Successfully. ');</script>");
                    Session["isUserAdded"] = true;
                    Response.Redirect("Users.aspx");
                }
            }
        }
        private bool IsDuplicateEmail()
        {
            //bool IsDuplicateEmail;
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //string query = "select * from Department";
            string query = "select count(1) from  Users where EmailAddress='" + txt_Email.Text.Trim() + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            int recordCount = Convert.ToInt32(cmd.ExecuteScalar());
            return recordCount > 0;
        }
    }
}