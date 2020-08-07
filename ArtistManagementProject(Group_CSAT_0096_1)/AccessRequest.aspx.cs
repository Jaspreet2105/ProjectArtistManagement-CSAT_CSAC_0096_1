using System;
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
    public partial class WebForm9 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // To get selected request ids 
            string RID = Request.Params.Get("RID") != null ? Convert.ToString(Request.Params.Get("RID")) : "";
            // To get type of  request Approved/Declined 
            string Type = Request.Params.Get("Type") != null ? Convert.ToString(Request.Params.Get("Type")) : "";
            if (!string.IsNullOrEmpty(RID) && !string.IsNullOrEmpty(Type))
            {
                UpdateRequest(Type, RID);
            }

            DataTable dt = new DataTable();
            dt = RequestData();

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
                
                if(!Convert.ToString(row["Request Status"]).Equals("Active"))
                {
                    html.Append("<tr class='ignore "+ Convert.ToString(row["Request Status"]) + " '>");
                }
                else
                {
                    html.Append("<tr>");
                }
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
        }
        /// <summary>
        /// This method is used to update the request status for given request ids
        /// </summary>
        /// <param name="Type"></param>
        /// <param name="RID"></param>
        public void UpdateRequest(string Type, string RID)
        {
            // Call Database 
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string query = "update AccessRequest set Rstatus ='"+Type+"' where Rid in ("+ RID + ")";
            SqlCommand cmd = new SqlCommand(query, con);
            int rowsEffected = cmd.ExecuteNonQuery();
            if(rowsEffected > 0 && Type.Equals("Approved"))// If admin approves the request, Need to update user role to manager
            {
                query = " update u "
                        + " set  RoleId = 2 " //RequestStatus = ar.Rstatus,
                        + " from users u "
                        + " inner join AccessRequest ar on ar.UserId = u.UserId "
                        + " where ar.Rid in (" + RID + ")";
                cmd = new SqlCommand(query, con);
                rowsEffected = cmd.ExecuteNonQuery();
            }
            con.Close();
        }
        private DataTable RequestData()
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string query = "select ar.Rid as 'Request ID', u.FirstName as 'First name', u.LastName as 'Last Name ', d.DName as 'Department', ar.Rstatus as 'Request Status'"
                            + " from accessrequest ar "
                            + " inner join users u on u.UserId = ar.UserId and u.RoleId <> 1 "
                            + " left join Department d on d.DeptId = u.DeptId ";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            adapter.Fill(ds);
            con.Close();
            return ds.Tables[0];
        }
    }
}