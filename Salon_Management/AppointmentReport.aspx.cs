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
    public partial class WebForm15 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListView1.DataBind();
                getAllReports();
            }
        }

        protected void GetData_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [appointment_id],[package_id],[package_name],[stylist_id],[stylist_name],[customer_id],[customer_name],[service_cost],[appointment_date],[choosen_date],[choosen_time] from [BarberShop].[dbo].[appointment_details] WHERE [appointment_date] between '" + FromDate.Text.Trim() + "' and '" + ToDate.Text.Trim() + "' and [status]='"+DropDownList1.SelectedItem.Value.Trim()+"' ", con))
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
                ListView2.Visible = false;
                ListView1.Visible = true;
            }
            catch (Exception Ex)
            {
                Response.Write(Ex.Message);
            }
            finally
            {

            }
        }

        void getAllReports()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [appointment_id],[package_id],[package_name],[stylist_id],[stylist_name],[customer_id],[customer_name],[service_cost],[appointment_date],[choosen_date],[choosen_time] from [BarberShop].[dbo].[appointment_details] ", con))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ListView2.Items.Count > 0)
                            { ListView2.Items.Clear(); }

                            ListView2.DataSource = ds.Tables[0];
                            ListView2.DataBind();
                        }
                        else
                        {
                            ListView2.DataSource = null;
                            ListView2.DataBind();
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
    }
}