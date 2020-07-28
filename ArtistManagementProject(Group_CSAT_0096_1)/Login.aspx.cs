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
                //TODO : Use parameterized query
                //SELECT * FROM users AS user
                //LEFT JOIN  Roles AS  role
                //ON user.RoleID = role.RoleID
                //Whre ..
                //string query = "SELECT * FROM user AS u LEFT JOIN ROLES AS r ON u.RoleId = r.RoleId  where UserId = '"+txt_UserId.Text.Trim()+"' AND Password='"+txt_Password.Text.Trim()+"'";


                string query = "SELECT * FROM Users where EmailAddress = @email AND Password= @password";
                SqlCommand cmd = new SqlCommand(query,con);

                cmd.Parameters.AddWithValue("@email", txt_UserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txt_Password.Text.Trim());

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        //if login is successfull, this 2 sessions will be created
                        Response.Write("<script>alert('LogIn Successful');</script>");
                        Session["firstname"] = dr.GetValue(4).ToString();
                        Session["EmailAddress"] = dr.GetValue(1).ToString();
                        Session["role"] = dr.GetValue(10).ToString();
                        
                        //Session["RequestStatus"]= dr.GetValue(12).ToString();

                    }
                    Response.Redirect("Welcome.aspx");
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