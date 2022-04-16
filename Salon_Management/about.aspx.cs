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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCount();
            }
        }
        void BindCount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader dr = null;
                SqlCommand cmd = new SqlCommand("SELECT (SELECT(COUNT([stylist_id])) FROM[BarberShop].[dbo].[stylist_management]) as stylistcount,(COUNT([user_id])) as usercount FROM[BarberShop].[dbo].[user_details]", con);

                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        int a = Int32.Parse(dr["usercount"].ToString()) - 1;
                        user.Text = a.ToString();
                        int b = Int32.Parse(dr["stylistcount"].ToString()) - 1;
                        stylist.Text = b.ToString();
                    }
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

            }
        }
    }
}