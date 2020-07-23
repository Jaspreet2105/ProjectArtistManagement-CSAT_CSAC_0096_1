using System;

namespace ArtistManagementProject_Group_CSAT_0096_1_
{
    public partial class CheckLogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session.Keys.Count == 0)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}