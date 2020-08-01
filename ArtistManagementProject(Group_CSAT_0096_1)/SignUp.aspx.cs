using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtistManagementProject_Group_CSAT_0096_1_
{
    public partial class SignUp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_SignUp_Click(object sender, EventArgs e)
      {
            //Response.Write("<script>alert('testing');</script>");
            try
            {
                ExampleCaptcha.UserInputID = CaptchaCode.ClientID;

                if (IsPostBack)
                {
                    string userInput = CaptchaCode.Text;
                    bool isHuman = ExampleCaptcha.Validate(userInput);
                    CaptchaCode.Text = null; // clear previous user input

                    if (isHuman)
                    {
                        CaptchaErrorLabel.Visible = false;
                        // TODO: proceed with protected action
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        string query = "INSERT INTO Users(EmailAddress,Password,ConfirmPassword,FirstName,LastName,DateOfBirth,RoleId)VALUES(@EmailAddress,@Password,@ConfirmPassword,@FirstName,@LastName,@DateOfBirth,@RoleId)";
                        SqlCommand cmd = new SqlCommand(query, con);

                        cmd.Parameters.AddWithValue("@EmailAddress", txt_Email.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txt_Password.Text.Trim());
                        cmd.Parameters.AddWithValue("@ConfirmPassword", txt_ConfirmPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("@FirstName", txt_FirstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@LastName", txt_LastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@DateOfBirth", txt_Dob.Value.Trim()); //having html date textbox
                        cmd.Parameters.AddWithValue("@RoleId", "3");

                        cmd.ExecuteNonQuery();
                        con.Close();

                        Response.Write("<script>alert('Registration Successful. ');</script>");
                    }
                    else
                    {
                        CaptchaErrorLabel.Visible = true;
                        CaptchaErrorLabel.Text = "Captcha failed";
                    }
                }
                
            }

           
            
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"')</script>");

            }

            //ClearTextBoxes(this);

            
        }

        //private void ClearTextBoxes(Control control)
        //{
        //    foreach (Control c in control.Controls)
        //    {
        //        if (c is TextBox)
        //        {
        //            ((TextBox)c).Text = String.Empty;
        //        }

        //        if (c is CheckBox)
        //        {

        //            ((CheckBox)c).Checked = false;
        //        }

        //        if (c is RadioButton)
        //        {
        //            ((RadioButton)c).Checked = false;
        //        }
        //    }
        //}
    }
}