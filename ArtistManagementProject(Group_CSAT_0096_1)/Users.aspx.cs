﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtistManagementProject_Group_CSAT_0096_1_
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            string UserID = Request.Params.Get("UserID") != null ? Convert.ToString(Request.Params.Get("UserID")) : "";
            if (!string.IsNullOrEmpty(UserID))
            {
                DeleteUser(UserID);
            }


            DataTable dt = new DataTable();
            dt = UsersData();

            //Building an HTML string.
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<div class='card-body'>");
            html.Append("<div class='table-responsive'>");
            html.Append("<table class='table table-bordered' width='100%' cellspacing='0' id='myTable' border = '1'>");

            //Building the Header row.
            html.Append("<thead>");
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");
            html.Append("</thead>");
            html.Append("<tbody>");
            //Building the Data rows.
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }
            html.Append("</tbody>");

            //Table end.
            html.Append("</table>");
            html.Append("</div>");
            html.Append("</div>");
            //html.Append("<script>");
            //html.Append("$(document).ready(function () {$('#myTable').DataTable();}); ");
            //html.Append("</script>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });

            if (Convert.ToBoolean(Session["isUserAdded"]))
            {
                StringBuilder userHTML = new StringBuilder();
                userHTML.Append("<script>alert('User added successfully')</script>");
                UserAdded.Controls.Add(new Literal { Text = userHTML.ToString() });
                Session["isUserAdded"] = false;
            }
            if (Convert.ToBoolean(Session["UserUpdated"]))
            {
                StringBuilder userHTML = new StringBuilder();
                userHTML.Append("<script>alert('User Updated successfully')</script>");
                UserAdded.Controls.Add(new Literal { Text = userHTML.ToString() });
                Session["UserUpdated"] = false;
            }
            if (Convert.ToBoolean(Session["UserDeleted"]))
            {
                StringBuilder userHTML = new StringBuilder();
                userHTML.Append("<script>alert('User(s) Deleted successfully')</script>");
                UserAdded.Controls.Add(new Literal { Text = userHTML.ToString() });
                Session["UserDeleted"] = false;
            }

        }

        private DataTable UsersData()
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            //Get all users data except the ADMIN and the user himself
            string query = "select USR.UserId as 'User ID', USR.FirstName as 'First Name',USR.LastName as 'Last Name', R.RoleName as 'Access Type', DEPT.DName as 'Department' from Users USR LEFT JOIN Department DEPT ON[USR].DeptId = DEPT.DeptId LEFT JOIN Roles R on R.RoleId = USR.RoleId"
                + " where USR.EmailAddress <> '" + Convert.ToString(Session["UserName"]) + "'  and  USR.RoleId <> 1";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            adapter.Fill(ds);
            con.Close();
            return ds.Tables[0];
        }
        [System.Web.Services.WebMethod]
        public void DeleteUser(string UserIDs)
        {
            // Call Database 
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string query = "delete from Users where UserId in (" + UserIDs + ")";
            SqlCommand cmd = new SqlCommand(query, con);
            int rowsEffected = cmd.ExecuteNonQuery();
            if (rowsEffected > 0)
                Session["UserDeleted"] = true;
            con.Close();
        }
    }
}

