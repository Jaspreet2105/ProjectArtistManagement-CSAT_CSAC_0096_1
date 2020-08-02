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
            if(!IsPostBack)
            {
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
    }
}