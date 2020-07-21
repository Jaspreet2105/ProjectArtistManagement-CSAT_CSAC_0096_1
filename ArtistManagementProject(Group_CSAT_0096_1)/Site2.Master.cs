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
            if (Session["role"].Equals("Regular User"))
            {
                LinkButton2.Text = " Hello " + Session["firstname"].ToString();
            }
        }

        protected void LogOutLinkButton_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
        }
    }
}