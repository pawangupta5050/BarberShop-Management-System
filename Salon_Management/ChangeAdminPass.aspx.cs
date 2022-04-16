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

namespace Salon_Management
{
    public partial class ChangeAdminPass : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetAdminData();
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
        protected void Update_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString().Trim() == "" || Session["username"].ToString().Trim() == null)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("home.aspx");
            }
            else
            {
                ChangePassword();
            }
        }
        void GetAdminData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT [admin_username],[admin_password],[admin_name] FROM [BarberShop].[dbo].[admin_login] WHERE [admin_username]= '" + Session["username"].ToString().Trim() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    AdminUsername.Text = dt.Rows[0]["admin_username"].ToString().Trim();
                    AdminName.Text = dt.Rows[0]["admin_name"].ToString().Trim();
                    AdminPass.Attributes["value"] = dt.Rows[0]["admin_password"].ToString().Trim();
                    cmd.ExecuteNonQuery();
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
        void ChangePassword()
        {
            try
            {
                string password = "";
                if (AdChngPass.Text.Trim() == "")
                {
                    password = AdminPass.Text.Trim();
                }
                else
                {
                    password = AdChngPass.Text.Trim();
                }
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update [admin_login] set admin_password=@admin_password where admin_username='" + Session["username"].ToString().Trim() + "' ", con);

                cmd.Parameters.AddWithValue("@admin_password", password);
                int result = cmd.ExecuteNonQuery();
                con.Close();

                if (result > 0)
                {
                    Response.Write("<script>alert('Details Updated Successfull');</script>");
                    GetAdminData();
                }
                else
                {
                    Response.Write("<script>alert('Details Update Unsuccessfull');</script>");
                }
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
            AdChngPass.Text = "";
        }
    }
}