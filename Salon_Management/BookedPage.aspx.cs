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
    public partial class BookedPage : System.Web.UI.Page
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

                    SqlCommand cmd = new SqlCommand("SELECT [appointment_id],[package_id],[package_name],[stylist_id],[stylist_name],[customer_id],[customer_name],[service_cost],[appointment_date],[choosen_date],[choosen_time],[status] from [BarberShop].[dbo].[appointment_details] WHERE [appointment_id]='" + AppointmentId + "' ", con);
                    dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            lblAppointmentId.Text = dr["appointment_id"].ToString();
                            lblCurrentDate.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                            lblServiceName.Text = dr["package_name"].ToString();
                            lblCustomerName.Text = dr["customer_name"].ToString();
                            int total = Int32.Parse(dr["service_cost"].ToString()) + 120;
                            lblCost.Text = total.ToString();
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
        //void FillNotification()
        //{

        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }

        //        SqlCommand cmd = new SqlCommand("insert into [BarberShop].[dbo].[Notification] (AppointmentID,CustomerName,Date,Status) values (@AppointmentID,@CustomerName,@Date,@Status) ", con);
        //        cmd.Parameters.AddWithValue("@AppointmentID", Session["AppointmentId"].ToString());
        //        cmd.Parameters.AddWithValue("@CustomerName", Session["fullname"].ToString());
        //        cmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("MM/dd/yyyy"));
        //        cmd.Parameters.AddWithValue("@Status", "Unseen");
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");
        //    }
        //    finally
        //    {

        //    }
        //}
        protected void Invoice_Click(object sender, EventArgs e)
        {
            Response.Redirect("Invoice.aspx?appointment_id=" + Session["AppointmentId"].ToString().Trim());
        }
    }
}