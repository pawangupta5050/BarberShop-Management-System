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
    public partial class CheckOut : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["service_id"]))
            {
                String ServiceId = Request.QueryString["service_id"].ToString();
                SqlConnection con = new SqlConnection(strcon);

                SqlDataReader dr = null;

                string strSql = "SELECT [service_id],[package_name],(SELECT [stylist_id] FROM [BarberShop].[dbo].[stylist_management] WHERE [stylist_name]='"+ Session["stylistname"].ToString().Trim() + "') as StylistId,[service_name],[quality_type],[service_cost],[service_desc],[service_category],[service_img] from [BarberShop].[dbo].[service_inventory] WHERE [service_id] = '" + ServiceId + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(strSql, con);
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        lblServicename.Text = dr["package_name"].ToString();
                        lblDescription.Text = dr["service_desc"].ToString();
                        lblCost.Text = dr["service_cost"].ToString();

                        int a = Int32.Parse(dr["service_cost"].ToString()) + 50;
                        lblDeclinedCost.Text = a.ToString();

                        lblsubtotal.Text = dr["service_cost"].ToString();

                        int total = Int32.Parse(dr["service_cost"].ToString()) + 120;

                        lblTotal.Text = total.ToString();
                        lblServicename2.Text = dr["package_name"].ToString();

                        lblCost2.Text = dr["service_cost"].ToString();
                        lblTotal2.Text = total.ToString();
                        lblChoosenDate.Text = Session["date"].ToString().Trim();
                        lblTime.Text = Session["time"].ToString().Trim();
                        lblStylist.Text = Session["stylistname"].ToString().Trim();
                        Image1.ImageUrl = dr["service_img"].ToString().Trim();
                        Image2.ImageUrl = dr["service_img"].ToString().Trim();
                        HiddenField1.Value = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");
                        HiddenField2.Value = dr["StylistId"].ToString().Trim();
                        Session["AppointmentId"] = Session["Product_Id"] + HiddenField1.Value + Session["username"].ToString();
                    }
                }
                con.Close();
            }
            else
            {
                Response.Redirect("home.aspx");
            }
        }

        protected void Appointment_Click(object sender, EventArgs e)
        {
            try
            {
                CreateNewAppointment();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                FillNotification();
            }
        }
        void CreateNewAppointment()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into [BarberShop].[dbo].[appointment_details] (appointment_id,package_id,package_name,stylist_id,stylist_name,customer_id,customer_name,service_cost,appointment_date,choosen_date,choosen_time,status) values (@appointment_id,@package_id,@package_name,@stylist_id,@stylist_name,@customer_id,@customer_name,@service_cost,@appointment_date,@choosen_date,@choosen_time,@status) ", con);
                cmd.Parameters.AddWithValue("@appointment_id", Session["AppointmentId"].ToString().Trim());
                cmd.Parameters.AddWithValue("@package_id", Session["Product_Id"].ToString().Trim());
                cmd.Parameters.AddWithValue("@package_name", lblServicename.Text.Trim());
                cmd.Parameters.AddWithValue("@stylist_id", HiddenField2.Value.ToString().Trim());
                cmd.Parameters.AddWithValue("@stylist_name", Session["stylistname"].ToString().Trim());
                cmd.Parameters.AddWithValue("@customer_id", Session["username"].ToString().Trim());
                cmd.Parameters.AddWithValue("@customer_name", Session["fullname"].ToString().Trim());
                cmd.Parameters.AddWithValue("@service_cost", lblCost.Text.Trim());
                cmd.Parameters.AddWithValue("@appointment_date", DateTime.Now.ToString("MM/dd/yyyy"));
                cmd.Parameters.AddWithValue("@choosen_date", lblChoosenDate.Text.Trim());
                cmd.Parameters.AddWithValue("@choosen_time", lblTime.Text.Trim());
                cmd.Parameters.AddWithValue("@status", "pending");
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                Response.Redirect("BookedPage.aspx?appointment_id=" + Session["AppointmentId"].ToString().Trim());
            }

        }
        void FillNotification()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into [BarberShop].[dbo].[Notification] (AppointmentID,CustomerName,Date,Status) values (@AppointmentID,@CustomerName,@Date,@Status) ", con);
                cmd.Parameters.AddWithValue("@AppointmentID", Session["AppointmentId"].ToString());
                cmd.Parameters.AddWithValue("@CustomerName", Session["fullname"].ToString());
                cmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("MM/dd/yyyy"));
                cmd.Parameters.AddWithValue("@Status", "Unseen");
                cmd.ExecuteNonQuery();
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