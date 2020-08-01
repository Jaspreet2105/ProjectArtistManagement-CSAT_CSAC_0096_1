using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtistManagementProject_Group_CSAT_0096_1_
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].Equals("1"))
            {


                lbl_Welcome.Text = "Welcome ADMIN";

            }

            if (Session["role"].Equals("2"))
            {


                lbl_Welcome.Text = "Welcome Elevated Access User";
                

            }

            if (Session["role"].Equals("3"))
            {

                lbl_Welcome.Text = "Welcome Regular User";
                
                
               


            }
        }
    }
}