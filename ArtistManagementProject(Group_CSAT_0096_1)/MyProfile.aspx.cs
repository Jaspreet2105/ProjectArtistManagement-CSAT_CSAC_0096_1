using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ArtistManagementProject_Group_CSAT_0096_1_
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {

                getUserDetail();
            }
        }

        void getUserDetail()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string query = "SELECT * FROM Users where EmailAddress = @email";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@email", Session["EmailAddress"].ToString());

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);

                txt_FirstName.Text = dt.Rows[0]["FirstName"].ToString();
                txt_LastName.Text = dt.Rows[0]["LastName"].ToString();
                txt_DOB.Value= Convert.ToDateTime(dt.Rows[0]["DateOfBirth"]).ToString("yyyy-MM-dd");
                txt_Email.Text = dt.Rows[0]["EmailAddress"].ToString();
                txt_OldPassword.Text = dt.Rows[0]["Password"].ToString();
                

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}