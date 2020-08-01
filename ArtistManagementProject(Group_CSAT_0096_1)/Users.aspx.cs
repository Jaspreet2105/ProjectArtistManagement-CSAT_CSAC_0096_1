using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtistManagementProject_Group_CSAT_0096_1_
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("UserID", typeof(int));
                dt.Columns.Add("UserName", typeof(string));
                dt.Columns.Add("DeptType", typeof(string));
                dt.Rows.Add(123, "Test", "Artist");
                dt.Rows.Add(231, "ATest", "Artist");
                dt.Rows.Add(031, "Zest", "Manager");
                dt.Rows.Add(123, "Test", "Manager");
                dt.Rows.Add(231, "ATest", "Artist");
                dt.Rows.Add(031, "Zest", "Manager");
                dt.Rows.Add(123, "Test", "Artist");
                dt.Rows.Add(231, "ATest", "Manager");
                dt.Rows.Add(031, "Zest", "Manager");
                dt.Rows.Add(123, "Test", "Artist");
                dt.Rows.Add(231, "ATest", "Manager");
                dt.Rows.Add(031, "Zest", "Artist");

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
            }
        }
    }
}

       