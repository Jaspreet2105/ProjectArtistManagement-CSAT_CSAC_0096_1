using ArtistManagementProject_Group_CSAT_0096_1_.Helpers;
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
    public partial class WebForm8 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int UserID = Convert.ToInt32(Request.Params.Get("UserID"));
                bool isView = Request.Params.Get("isView") != null ? Convert.ToBoolean(Request.Params.Get("isView")) : false;
                SetUserData(UserID);
                Session["Type"] = "Edit";
                if (isView)
                    SetViewMode();
                //dropdown_Department.DataSource = GetDepartmentData();
                //dropdown_Department.DataTextField = "DName";
                //dropdown_Department.DataValueField = "DeptId";
                //dropdown_Department.DataBind();

            }
        }
        private void SetViewMode()
        {
            Session["Type"] = "View";
            txt_FirstName.ReadOnly = true;
            txt_LastName.ReadOnly = true;
            txt_DOB.Disabled = true;
            txt_PhnNo.ReadOnly = true;
            txt_FullAddress.ReadOnly = true;
            txt_Email.ReadOnly = true;
            txt_PostalCode.ReadOnly = true;
            dropdown_AccessType.Attributes.Add("disabled", "disabled");
            dropdown_Department.Attributes.Add("disabled", "disabled");
            txt_NewPassword.Visible = false;
            txt_NewConfirmPassword.Visible = false;
            btn_Update.Visible = false;
            //btn_Cancel.Visible = false;
            lbl_NewPassword.Visible = false;
            lbl_ConfirmPassword.Visible = false;
        }
        private void SetUserData(int UserID)
        {
            //string UserID = Request.Params.Get("UserID");
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //string query = "select * from Department";
            string query = "select  * from Users where UserId = " + UserID;
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            adapter.Fill(ds);
            con.Close();

            // Get DataRow of the user from 1st row of the  1st table from the Dataset
            DataRow data = ds.Tables[0].Rows[0];
            dropdown_Department.DataSource = GetDepartmentData();
            dropdown_Department.DataTextField = "DName";
            dropdown_Department.DataValueField = "DeptId";
            dropdown_Department.DataBind();
            if (data["DeptId"] != null && !string.IsNullOrEmpty(Convert.ToString(data["DeptId"])))
                dropdown_Department.SelectedValue = Convert.ToString(data["DeptId"]);


            //if (data["RoleId"] != null)
            dropdown_AccessType.SelectedValue = Convert.ToString(data["RoleId"]);
            dropdown_AccessType.DataBind();

            txt_FirstName.Text = Convert.ToString(data["FirstName"]);
            txt_LastName.Text = Convert.ToString(data["LastName"]);
            //txt_DOB.Value = Convert.ToDateTime(data["DateOfBirth"]).ToString("dd-mm-yyyy");
            txt_DOB.Value = Convert.ToDateTime(data["DateOfBirth"]).ToString("yyyy-MM-dd");
            txt_PhnNo.Text = Convert.ToString(data["PhoneNumber"]);
            txt_FullAddress.Text = Convert.ToString(data["Address"]);
            txt_Email.Text = Convert.ToString(data["EmailAddress"]);
            txt_PostalCode.Text = Convert.ToString(data["PostalCode"]);
            if (Session["role"].Equals("2"))
            {
                dropdown_AccessType.Attributes.Add("disabled", "disabled");
                dropdown_Department.Attributes.Add("disabled", "disabled");
            }

        }
        protected void btn_Update_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string firstName = txt_FirstName.Text;
                string lasttName = txt_LastName.Text;
                string DOB = txt_DOB.Value;
                string phoneNumber = txt_PhnNo.Text;
                string fullAddress = txt_FullAddress.Text;
                string emailAddress = txt_Email.Text;
                string postalCode = txt_PostalCode.Text;
                string newPassword = txt_NewPassword.Text;
                string newConfirmPassword = txt_NewConfirmPassword.Text;
                string departmentType = dropdown_Department.SelectedValue;
                string accessType = dropdown_AccessType.SelectedValue;
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string update = "update users  set "
                                //+"EmailAddress = '"+emailAddress+"'"
                                //+ "ConfirmPassword = '" + emailAddress + "'"
                                + " FirstName = '" + firstName + "' "
                                + " ,LastName = '" + lasttName + "' "
                                + " ,DateOfBirth = '" + DOB + "' "
                                + " ,PhoneNumber = '" + phoneNumber + "' "
                                + " ,Address = '" + fullAddress + "' "
                                + " ,PostalCode = '" + postalCode + "' ";
                if (Session["role"].Equals("1"))
                {
                    update += " ,RoleId = " + accessType
                              + " ,DeptId = " + departmentType;
                }
                if (!string.IsNullOrEmpty(newPassword))
                    update += " ,Password= '" + CommonHelpers.Encrypt(newPassword) + "' ";
                string where = " where EmailAddress = '" + emailAddress + "' ";
                string finalQuery = update + where;
                SqlCommand cmd = new SqlCommand(finalQuery, con);
                int records = cmd.ExecuteNonQuery();
                con.Close();
                Session["UserUpdated"] = true;
                Response.Redirect("Users.aspx");
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
    }
}