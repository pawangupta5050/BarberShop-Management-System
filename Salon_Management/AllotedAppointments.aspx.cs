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
    public partial class WebForm23 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //getAllMyApp();
            if (!IsPostBack)
            {
                getAllPendingAppointment();
            }
        }
        public void getAllPendingAppointment()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [appointment_id],[package_id],[package_name],[customer_id],[customer_name],[service_cost],[appointment_date],[choosen_date],[choosen_time] from [BarberShop].[dbo].[appointment_details] WHERE [stylist_id]='"+Session["username"].ToString()+"' ", con))
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
        //void getAllMyApp()
        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {

        //            if (con.State == ConnectionState.Closed)
        //            {
        //                con.Open();
        //            }
        //            using (SqlDataAdapter da = new SqlDataAdapter("SELECT [appointment_id],[package_id],[package_name],[customer_id],[customer_name],[service_cost],[appointment_date],[choosen_date],[choosen_time] FROM [BarberShop].[dbo].[appointment_details] where [stylist_name]='" + Session["fullname"].ToString().Trim() + "' ", con))
        //            {
        //                DataSet ds = new DataSet();
        //                da.Fill(ds);

        //                if (ds.Tables[0].Rows.Count > 0)
        //                {
        //                    if (ListView1.Items.Count > 0)
        //                    { ListView1.Items.Clear(); }

        //                    ListView1.DataSource = ds.Tables[0];
        //                    ListView1.DataBind();
        //                }
        //                else
        //                {
        //                    ListView1.DataSource = null;
        //                    ListView1.DataBind();
        //                }
        //            }
        //            con.Close();
        //        }
        //    }
        //    catch (Exception Ex)
        //    {
        //        Response.Write(Ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //}
    }
}