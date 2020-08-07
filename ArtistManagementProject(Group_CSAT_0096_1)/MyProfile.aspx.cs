using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace ArtistManagementProject_Group_CSAT_0096_1_
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                btn_RequestElevatedAccess.Visible = false;
                if (Session["role"].Equals("3"))
                {
                    //btn_RequestElevatedAccess.Visible = false;
                    SetRequestStatus();
                }
                else
                {
                    lbl_AccessRequestText.Visible = false;
                    lbl_RequestStatus.Visible = false;
                }

                dropdown_AccessType.Attributes.Add("disabled", "disabled");
                dropdown_Department.Attributes.Add("disabled", "disabled");
                if (Session["UserName"].ToString() == "" || Session["UserName"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("Login.aspx");
                }
                else
                {

                    //if (!IsPostBack)
                    //{

                        getUserDetail();
                    //}
                }
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("Login.aspx");
            }
        }
        private void SetRequestStatus()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string query = "select ar.Rstatus from users u inner join AccessRequest ar on ar.UserId = u.UserId where u.UserId = " + Session["UserID"];
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //btn_RequestElevatedAccess.Visible = false;
                string requestStatus = dt.Rows[0]["Rstatus"].ToString();
                switch (requestStatus)
                {
                    case "Approved":
                        lbl_RequestStatus.Text = "Approved";
                        lbl_RequestStatus.ForeColor = Color.Green;
                        break;
                    case "Declined":
                        lbl_RequestStatus.Text = "Declined";
                        lbl_RequestStatus.ForeColor = Color.Red;
                        break;
                    default:
                        lbl_RequestStatus.Text = "Pending";
                        lbl_RequestStatus.ForeColor = Color.DarkKhaki;
                        break;
                }
            }
            else
                btn_RequestElevatedAccess.Visible = true;
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

                string query = "SELECT Users.*,dpt.DName FROM Users  inner join department dpt on dpt.DeptId= Users.DeptId where EmailAddress = @email";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@email", Session["UserName"].ToString());

                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);

                txt_FirstName.Text = dt.Rows[0]["FirstName"].ToString();
                txt_LastName.Text = dt.Rows[0]["LastName"].ToString();
                txt_DOB.Value = Convert.ToDateTime(dt.Rows[0]["DateOfBirth"]).ToString("yyyy-MM-dd");
                txt_FullAddress.Text = dt.Rows[0]["Address"].ToString();
                txt_PostalCode.Text = dt.Rows[0]["PostalCode"].ToString();
                txt_PhnNo.Text = dt.Rows[0]["PhoneNumber"].ToString();
                txt_Email.Text = dt.Rows[0]["EmailAddress"].ToString();
                txt_OldPassword.Text = dt.Rows[0]["Password"].ToString();


                dropdown_Department.Items.Add(new ListItem(dt.Rows[0]["DName"].ToString(), dt.Rows[0]["DeptId"].ToString()));
                dropdown_AccessType.SelectedValue = Convert.ToString(Session["role"]);
                //if (Session["role"].Equals("1"))
                //{
                //    dropdown_AccessType.SelectedValue = "1";
                //}
                //else if (Session["role"].Equals("1"))
                //{
                //    dropdown_AccessType.SelectedValue = "1";
                //}



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateUserDetail()
        {
            string password = "";
            if (txt_NewPassword.Text.Trim() == "")
            {
                password = txt_OldPassword.Text.Trim();
            }
            else
            {
                password = txt_NewPassword.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                String query = "UPDATE Users set FirstName=@FirstName, LastName=@LastName, DateOfBirth=@DateOfBirth,Address=@Address,PostalCode=@PostalCode,PhoneNumber=@PhoneNumber,Password=@Password,ConfirmPassword=@ConfirmPassword where EmailAddress = @EmailAddress";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@FirstName", txt_FirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@LastName", txt_LastName.Text.Trim());
                cmd.Parameters.AddWithValue("@DateOfBirth", txt_DOB.Value.Trim());
                cmd.Parameters.AddWithValue("@Address", txt_FullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@PostalCode", txt_PostalCode.Text.Trim());
                cmd.Parameters.AddWithValue("@PhoneNumber", txt_PhnNo.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailAddress", Session["UserName"].ToString().Trim());
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@ConfirmPassword", password);

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserDetail();

                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        protected void btn_Update_Click(object sender, EventArgs e)
        {


            if (Session["UserName"].ToString() == "" || Session["UserName"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("Login.aspx");
            }
            else
            {
                UpdateUserDetail();

            }


        }

        protected void btn_RequestElevatedAccess_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string query = " insert into accessrequest(Rstatus,RequestedAt,UserId) "
                        + " values('Active' "
                        + " , getdate() "
                        + " ," + Convert.ToString(Session["UserID"])
                        + " )";
            SqlCommand cmd = new SqlCommand(query, con);
            int rowsEffected = cmd.ExecuteNonQuery();
            btn_RequestElevatedAccess.Visible = false;
            SetRequestStatus();
            //if (rowsEffected > 0)// If admin approves the request, Need to update user role to manager
            //{
            //    query = " update u "
            //            + " set  RoleId = 2 " //RequestStatus = ar.Rstatus,
            //            + " from users u "
            //            + " inner join AccessRequest ar on ar.UserId = u.UserId "
            //            + " where ar.Rid in (" + RID + ")";
            //    cmd = new SqlCommand(query, con);
            //    rowsEffected = cmd.ExecuteNonQuery();
            //}
            con.Close();
        }
    }


}
