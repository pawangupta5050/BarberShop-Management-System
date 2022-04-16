using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mime;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace Salon_Management
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void signup_Click(object sender, EventArgs e)
        {
            if (CheckUserExists())
            {
                Response.Write("<script>alert('User Already exist with same user Id Try other Id');</script>");
            }
            else
            {
                    SignUpNewMember();
            }
        }
        bool CheckUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from user_details where user_id='" + UserId.Text.Trim() + "'; ", con);
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

        void SignUpNewMember()
        {
            try
            {
                //CheckBox1.Checked = true;
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into user_details (user_name,user_email,user_id,user_pass,acc_status) values (@user_name,@user_email,@user_id,@user_pass,@acc_status) ", con);

                cmd.Parameters.AddWithValue("@user_name", Name.Text.Trim());
                cmd.Parameters.AddWithValue("@user_email", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@user_id", UserId.Text.Trim());
                cmd.Parameters.AddWithValue("@user_pass", UserPass.Text.Trim());
                //cmd.Parameters.AddWithValue("@user_agree", CheckBox1.Checked ? "Agree" : "Disagree");
                cmd.Parameters.AddWithValue("@acc_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();
                sendMail();
                Response.Redirect("login.aspx");
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
                msg.To.Add(Email.Text.Trim());
                msg.From = new MailAddress("pawangupta200301@gmail.com");
                msg.Subject = "Your Account Credentials";
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
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Email/SignUpEmail.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{customername}",Name.Text.Trim());
            body = body.Replace("{customeremail}",Email.Text.Trim());
            body = body.Replace("{customerid}",UserId.Text.Trim());
            body = body.Replace("{customerpass}",UserPass.Text.Trim());
            return body;

        }
        void clear()
        {
            Name.Text = "";
            Email.Text = "";
            UserId.Text = "";
            UserPass.Text = "";
            ConFirmPass.Text = "";
        }
    }
}
