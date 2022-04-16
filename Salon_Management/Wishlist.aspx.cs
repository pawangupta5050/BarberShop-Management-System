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
    public partial class WebForm8 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"].ToString().Trim() == "" || Session["username"].ToString().Trim() == null)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("home.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    getWishlist();
                    bindGrandTotal();
                }
                
            }
        }
        public void getWishlist()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [serviceid],[servicename],[servicecategory],[servicedesc],[serviceimage],[serviceprice] FROM [BarberShop].[dbo].[wishlist] where [username]='" + Session["username"].ToString().Trim() + "'", con))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ListView1.Items.Count > 0)
                            { ListView1.Items.Clear(); }

                            ListView1.DataSource = ds.Tables[0];
                            ListView1.DataBind();
                        }
                        else
                        {
                            ListView1.DataSource = null;
                            ListView1.DataBind();
                        }
                    }
                    con.Close();
                }
            }
            catch (Exception Ex)
            {
                Response.Write(Ex.Message);
            }
            finally
            {
            }
        }
        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (String.Equals(e.CommandName, "viewdata"))
            {
                Response.Redirect("ViewProduct.aspx?service_id=" + e.CommandArgument.ToString());
            }
            if (String.Equals(e.CommandName, "removedata"))
            {

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM [BarberShop].[dbo].[wishlist] WHERE serviceid='" + e.CommandArgument + "' ", con);
                    cmd.ExecuteNonQuery();
                    getWishlist();
                    bindGrandTotal();
                    con.Close();
                    Response.Write("<script>alert('Service has been removed from your wishlist');</script>");
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
        void bindGrandTotal()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader dr = null;
                SqlCommand cmd = new SqlCommand("SELECT SUM(CONVERT(int, [serviceprice])) as grandtotal,(SELECT (COUNT(serviceid))) as servicecount FROM [BarberShop].[dbo].[wishlist] WHERE [username] = '" + Session["username"].ToString().Trim() + "'", con);

                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblsubtotal.Text = dr["grandtotal"].ToString();
                        lblservicecount.Text = dr["servicecount"].ToString();
                        lblTotal.Text = dr["grandtotal"].ToString();
                    }
                }
                con.Close();
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