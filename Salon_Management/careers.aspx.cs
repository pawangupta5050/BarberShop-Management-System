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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {

            try
            {
                string filepath = "~/Careers/Admin_logo.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Careers/" + filename));
                filepath = "~/Careers/" + filename;
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO [BarberShop].[dbo].[careers] (Name,Email,Contact,Proficiency,Address,Resume) VALUES (@Name,@Email,@Contact,@Proficiency,@Address,@Resume)", con);
                cmd.Parameters.AddWithValue("@Name", name.Text.Trim() );
                cmd.Parameters.AddWithValue("@Email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact", contact.Text.Trim());
                cmd.Parameters.AddWithValue("@Proficiency", proficiency.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", address.Text.Trim());
                cmd.Parameters.AddWithValue("@Resume", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                sendMail();
                Response.Write("<script>alert('Your Response has been submitted');</script>");
                clear();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

            }
        }
        void clear()
        {
            name.Text = "";
            email.Text = "";
            contact.Text = "";
            proficiency.Text = "";
            address.Text = "";
        }
        void sendMail()
        {
            try
            {

                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com", 587);
                SmtpServer.EnableSsl = true;
                SmtpServer.Timeout = 10000;
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new NetworkCredential("pawangupta200301@gmail.com", "Pawan2031");
                MailMessage msg = new MailMessage();
                msg.To.Add(email.Text);
                msg.From = new MailAddress("pawangupta200301@gmail.com");
                msg.Subject = "BS BarberShop application received for the position of " + proficiency.SelectedValue.Trim();
                msg.Body = CreateBody();
                msg.IsBodyHtml = true;
                SmtpServer.Send(msg);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        private String CreateBody()
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Email/CareersEmail.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{applicantname}", name.Text.Trim());
            body = body.Replace("{proficiency}", proficiency.SelectedValue.Trim());
            return body;

        }
    }
}