using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mime;
using System.Net;
using System.Net.Mail;

namespace Salon_Management
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"]==null)
                {
                    login.Visible = true;
                    ProfileDropdown.Visible = false;
                    logout.Visible = false;
                    hello.Visible = false;
                    wishlist.Visible = false;

                    AdminLogin.Visible = true;
                }
                else if (Session["role"].Equals("user"))
                {
                    login.Visible = false;
                    logout.Visible = true;
                    ProfileDropdown.Visible = true;
                    hello.Visible = true;
                    wishlist.Visible = true;
                    hello.Text= "Your Profile <br/> (" + Session["fullname"].ToString()+")";

                    AdminLogin.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    login.Visible = false;

                    logout.Visible = true;
                    ProfileDropdown.Visible = true;
                    hello.Visible = true;
                    hello.Text = "Dashboard" ;
                    logout.Visible = false;
                    wishlist.Visible = false;

                    AdminLogin.Visible = false;
                }
                else if (Session["role"].Equals("stylist"))
                {
                    login.Visible = false;

                    logout.Visible = true;
                    ProfileDropdown.Visible = true;
                    hello.Visible = true;
                    hello.Text = "Appointments";
                    logout.Visible = false;
                    wishlist.Visible = false;
                    AdminLogin.Visible = false;
                }
            }
            catch(Exception ex)
            {
                Response.Write("< script > alert('"+ex.Message+"');</ script >");
            }
            finally
            {

            }
        }

        protected void home_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void aboutus_Click(object sender, EventArgs e)
        {
            Response.Redirect("about.aspx");
        }

        protected void terms_Click(object sender, EventArgs e)
        {
            Response.Redirect("terms.aspx");
        }

        protected void viewservice_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductList.aspx");
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void privacy_Click(object sender, EventArgs e)
        {
            Response.Redirect("privacy.aspx");
        }

        protected void social_Click(object sender, EventArgs e)
        {
            Response.Redirect("privacy.aspx");
        }

        protected void blogs_Click(object sender, EventArgs e)
        {
            Response.Redirect("privacy.aspx");
        }

        protected void career_Click(object sender, EventArgs e)
        {
            Response.Redirect("privacy.aspx");
        }

        protected void AdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["role"] = null;
            Session["status"] = "";

            login.Visible = true;

            logout.Visible = false;
            hello.Visible = false;

            AdminLogin.Visible = true;

            Response.Redirect("home.aspx");

        }

        protected void hello_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals("user"))
                {
                    Response.Redirect("userprofile.aspx");
                }
                else if (Session["role"].Equals("admin"))
                {
                    Response.Redirect("Dashboard.aspx");
                }
                else if (Session["role"].Equals("stylist"))
                {
                    Response.Redirect("AppointmentReport.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("< script > alert('" + ex.Message + "');</ script >");
            }
            finally
            {

            }
        }

        protected void Gallery_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gallery.aspx");
        }

        protected void StylistProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("StylistProfile.aspx");
        }

        protected void subscribe_Click(object sender, EventArgs e)
        {
            sendMail();
        }

        void sendMail()
        {
            try
            {
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com", 587);
                SmtpServer.EnableSsl = true;
                SmtpServer.Timeout = 10000;
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new NetworkCredential("Your Email ID", "Your Password");
                MailMessage msg = new MailMessage();
                msg.To.Add(Newsletter.Text);
                msg.From = new MailAddress("Your Email ID");
                msg.Subject = "Thank You for Subscribing";
                msg.Body = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("Email/Newsletter.html"));
                msg.IsBodyHtml = true;
                System.Net.Mail.Attachment attachment;
                attachment = new System.Net.Mail.Attachment(Server.MapPath("Email/Brochure.pdf"));
                msg.Attachments.Add(attachment);
                SmtpServer.Send(msg);
                Response.Write("<script>alert('Thank you for Subscribing. Please Check the mail');</script>");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {

            }
        }

        protected void wishlist_Click(object sender, EventArgs e)
        {
            Response.Redirect("Wishlist.aspx");
        }
    }
}
