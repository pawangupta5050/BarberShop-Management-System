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
    public partial class Invoice : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!String.IsNullOrEmpty(Request.QueryString["appointment_id"]))
                {
                    String AppointmentId = Request.QueryString["appointment_id"].ToString().Trim();
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlDataReader dr = null;

                    SqlCommand cmd = new SqlCommand("SELECT [appointment_id],(select user_email from" +
                        " [BarberShop].[dbo].[user_details] where user_id='"+Session["username"]+"')" +
                        " as [Email],(select user_contact from [BarberShop].[dbo].[user_details] where" +
                        " user_id='"+Session["username"]+"') as [ContactNo],(select acc_status from" +
                        " [BarberShop].[dbo].[user_details] where user_id='"+Session["username"]+"') " +
                        "as [Status],[package_id],[package_name],[stylist_id],[stylist_name],[customer_id]" +
                        ",[customer_name],[service_cost],[appointment_date],(Select CONVERT(varchar,[choosen_date],5) as [DD-MM-YY]) as [choosen_date]" +
                        ",(Select CONVERT(varchar,[choosen_time],108) as time) as [choosen_time],[status] from [BarberShop].[dbo].[appointment_details] WHERE [appointment_id]='" + AppointmentId+"' ", con);
                    dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            AppId.Text = dr["appointment_id"].ToString();
                            Date.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                            AppDate.Text = dr["choosen_date"].ToString();
                            AppTime.Text = dr["choosen_time"].ToString();
                            AppDate.Text = dr["choosen_date"].ToString();
                            lblName.Text = Session["fullname"].ToString();
                            lblStatus.Text = dr["Status"].ToString();
                            lblContact.Text = dr["ContactNo"].ToString();
                            lblEmail.Text = dr["Email"].ToString();
                            lblService.Text= dr["package_name"].ToString();
                            lblCost.Text = dr["service_cost"].ToString();
                            lblTotal.Text = dr["service_cost"].ToString();
                            lblSubTotal.Text = dr["service_cost"].ToString();
                            lblServiceCharge.Text = "120";
                            int total = Int32.Parse(dr["service_cost"].ToString()) + 120;
                            lblFinalTotal.Text = total.ToString();
                            lblCustomerName.Text = Session["fullname"].ToString();

                        }
                    }
                    con.Close();
                }
                else
                {
                    Response.Redirect("home.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {

            }
        }

    }
}