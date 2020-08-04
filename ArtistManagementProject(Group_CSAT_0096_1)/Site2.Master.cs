using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtistManagementProject_Group_CSAT_0096_1_
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].Equals("1"))
            {

                LinkButton2.Text = " Hello Admin " + Session["firstname"].ToString();
                

            }

            if (Session["role"].Equals("2"))
            {

                LinkButton2.Text = " Hello " + Session["firstname"].ToString();
                linkAccessRequest.Visible = false;
             

            }

            if (Session["role"].Equals("3"))
            {

                LinkButton2.Text = " Hello " + Session["firstname"].ToString();
                linkAccessRequest.Visible = false;
                linkUsers.Visible = false;
                //btn_Users.Visible = false;
                //btn_AccessRequests.Visible = false;
                //linkbtn_Users.Visible = false;
                //linkbtn_AccessRequests.Visible = false;



            }
           
        }

        protected void LogOutLinkButton_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
        }

        protected void btn_MyProfile_Click(object sender, EventArgs e)
        {

        }
    }
}