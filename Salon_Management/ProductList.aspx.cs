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
    public partial class ProductList : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllproducts();
            }
        }
        public void getAllproducts()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [service_id],[package_name],[service_name],[quality_type],[service_cost],[service_desc],[service_category],[service_img] from [BarberShop].[dbo].[service_inventory]", con))
                    {
                        // 3
                        // Use DataAdapter to fill DataTable
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
            if (Session["role"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else if (Session["role"].Equals("user"))
            {
                if (String.Equals(e.CommandName, "wishlist"))
                {
                    var servicename = (Label)e.Item.FindControl("name");
                    var servicecategory = (Label)e.Item.FindControl("cat");
                    var servicedesc = (Label)e.Item.FindControl("desc");
                    var serviceprice = (Label)e.Item.FindControl("price");
                    var serviceimage = (Image)e.Item.FindControl("image");
                    try
                    {
                        if (checkifServiceAdded(e.CommandArgument.ToString()))
                        {
                            Response.Write("<script>alert('Already Added this service');</script>");
                        }
                        else
                        {
                            SqlConnection con = new SqlConnection(strcon);
                            if (con.State == ConnectionState.Closed)
                            {
                                con.Open();
                            }

                            SqlCommand cmd = new SqlCommand("INSERT INTO [BarberShop].[dbo].[wishlist] (serviceid,servicename,servicecategory,servicedesc,serviceprice,serviceimage,username) VALUES (@serviceid,@servicename,@servicecategory,@servicedesc,@serviceprice,@serviceimage,@username)", con);
                            cmd.Parameters.AddWithValue("@serviceid", e.CommandArgument.ToString().Trim());
                            cmd.Parameters.AddWithValue("@servicename", servicename.Text.Trim());
                            cmd.Parameters.AddWithValue("@servicecategory", servicecategory.Text.Trim());
                            cmd.Parameters.AddWithValue("@servicedesc", servicedesc.Text.Trim());
                            cmd.Parameters.AddWithValue("@serviceprice", serviceprice.Text.Trim());
                            cmd.Parameters.AddWithValue("@serviceimage", serviceimage.ImageUrl.Trim());
                            cmd.Parameters.AddWithValue("@username", Session["username"].ToString().Trim());
                            cmd.ExecuteNonQuery();
                            Response.Write("<script>alert('Added to wishlist');</script>");
                            con.Close();
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
            else if (Session["role"].Equals("admin"))
            {
                Response.Write("<script>alert('You are not permited to Add to wishlist');</script>");
            }
            else if (Session["role"].Equals("admin"))
            {
                Response.Write("<script>alert('You are not permited to Add to wishlist');</script>");
            }

        }
        bool checkifServiceAdded(string serviceid)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM [BarberShop].[dbo].[wishlist] WHERE [serviceid]='" + serviceid + "' and [username]='" + Session["username"].ToString().Trim() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
            finally
            {

            }
        }
    }
}