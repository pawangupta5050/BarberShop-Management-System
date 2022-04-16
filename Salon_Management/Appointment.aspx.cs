using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Net.Mime;
using System.Net;
using System.Net.Mail;

namespace Salon_Management
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllPendingAppointment();
                ListView1.DataBind();
            }
            if (Session["role"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }
            else if (Session["role"].Equals("user"))
            {
                Response.Redirect("home.aspx");
            }
            else if (Session["role"].Equals("stylist"))
            {
                Response.Redirect("AppointmentReport.aspx");
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
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [appointment_id],[package_id],[package_name],[stylist_id],[stylist_name],[customer_id],[customer_name],[service_cost],[appointment_date],[choosen_date],[choosen_time],[status] from [BarberShop].[dbo].[appointment_details] WHERE [status]='pending' ", con))
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
            var userid = (Label)e.Item.FindControl("customer_idLabel");
            var servicename = (Label)e.Item.FindControl("package_nameLabel");
            var Accept = (LinkButton)e.Item.FindControl("btnAccept");
            var Reject = (LinkButton)e.Item.FindControl("btnReject");
            bindemail(userid.Text, e.CommandArgument.ToString());
            try
            {
                if (String.Equals(e.CommandName, "accept"))
                {

                    try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd = new SqlCommand("UPDATE [BarberShop].[dbo].[appointment_details] SET [status]='Accepted' WHERE [appointment_id]='" + e.CommandArgument + "' ", con);

                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Appointment has been Accepted');</script>");
                        con.Close();
                        getAllPendingAppointment();
                        sendAcceptMail(userid.Text, servicename.Text);
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                    finally
                    {

                    }
                }
                else if (String.Equals(e.CommandName, "reject"))
                {
                    try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd = new SqlCommand("UPDATE [BarberShop].[dbo].[appointment_details] SET [status]='Rejected' WHERE [appointment_id]='" + e.CommandArgument + "' ", con);

                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Appointment has been Rejected');</script>");
                        con.Close();
                        ListView1.DataBind();
                        getAllPendingAppointment(); 
                        sendRejectionMail(userid.Text, servicename.Text);
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
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {

            }

        }
        void bindemail(string UserID, String commandargument)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                SqlDataReader dr = null;

                string strSql = "SELECT (SELECT [user_email] FROM [BarberShop].[dbo].[user_details] WHERE [user_id]='" + UserID + "') as email FROM [BarberShop].[dbo].[appointment_details] WHERE [appointment_id]='" + commandargument + "' ";
                con.Open();
                SqlCommand cmd = new SqlCommand(strSql, con);
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        HiddenField1.Value = dr["email"].ToString().Trim();
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {

            }
            finally
            {

            }
        }
        void sendRejectionMail(string name,String service)
        {
            try
            {

                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com", 587);
                SmtpServer.EnableSsl = true;
                SmtpServer.Timeout = 10000;
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new NetworkCredential("pawangupta200301@gmail.com", "Pawan2031");
                MailMessage msg = new MailMessage();
                msg.To.Add(HiddenField1.Value.ToString().Trim());
                msg.From = new MailAddress("pawangupta200301@gmail.com");
                msg.Subject = "Appointment Rejection Mail";
                msg.Body = CreateBody(name,service);
                msg.IsBodyHtml = true;
                SmtpServer.Send(msg);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        private String CreateBody(string name,String service)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Email/AppointmentStatus.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{customername}", name);
            body = body.Replace("{service}", service);
            body = body.Replace("{admin}", Session["fullname"].ToString().Trim());
            return body;
        }
        void sendAcceptMail(string name, String service)
        {
            try
            {

                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com", 587);
                SmtpServer.EnableSsl = true;
                SmtpServer.Timeout = 10000;
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new NetworkCredential("pawangupta200301@gmail.com", "Pawan2031");
                MailMessage msg = new MailMessage();
                msg.To.Add(HiddenField1.Value.ToString().Trim());
                msg.From = new MailAddress("pawangupta200301@gmail.com");
                msg.Subject = "Appointment Accept Mail";
                msg.Body = CreateAcceptBody(name, service);
                msg.IsBodyHtml = true;
                SmtpServer.Send(msg);

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        private String CreateAcceptBody(string name, String service)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Email/AppointmentAccept.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{customername}", name);
            body = body.Replace("{service}", service);
            body = body.Replace("{admin}", Session["fullname"].ToString().Trim());
            return body;
        }
    }
}