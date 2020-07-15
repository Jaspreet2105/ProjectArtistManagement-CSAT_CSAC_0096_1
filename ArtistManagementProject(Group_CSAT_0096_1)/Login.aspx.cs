using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ArtistManagementProject_Group_CSAT_0096_1_
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_LogIn_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('testing');</script>");
            try {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string query = "SELECT * FROM users where UserId = '"+txt_UserId.Text.Trim()+"' AND Password='"+txt_Password.Text.Trim()+"'";
                SqlCommand cmd = new SqlCommand(query,con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                    }
                }
                else {

                    Response.Write("<script>alert('Invalid User');</script>");
                }
                



            }
            catch (Exception ex) {

                Response.Write("<script>alert('" + ex.Message + "')</script>");

            }
        }

        protected void btn_SignUp_Click(object sender, EventArgs e)
        {

        }
    }
}