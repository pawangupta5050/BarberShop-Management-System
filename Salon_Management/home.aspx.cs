using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Salon_Management
{
    public partial class DummyHome : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void viewservices_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductList.aspx");
        }

        protected void about_Click(object sender, EventArgs e)
        {
            Response.Redirect("about.aspx");
        }

        protected void aboutus_Click(object sender, EventArgs e)
        {
            Response.Redirect("about.aspx");
        }

        protected void stylist_Click(object sender, EventArgs e)
        {
            Response.Redirect("StylistProfile.aspx");
        }
    }
}