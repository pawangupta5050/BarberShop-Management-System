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
    public partial class WebForm22 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetStylistData();
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
        void GetStylistData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT [stylist_id],[stylist_name],[stylist_password] FROM [BarberShop].[dbo].[stylist_management] WHERE [stylist_id]= '" + Session["username"].ToString().Trim() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    AdminUsername.Text = dt.Rows[0]["stylist_id"].ToString().Trim();
                    StylistName.Text = dt.Rows[0]["stylist_name"].ToString().Trim();
                    StylistPass.Attributes["value"] = dt.Rows[0]["stylist_password"].ToString().Trim();
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
                if (StChngPass.Text.Trim() == "")
                {
                    password = StylistPass.Text.Trim();
                }
                else
                {
                    password = StChngPass.Text.Trim();
                }
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE [BarberShop].[dbo].[stylist_management] SET stylist_password=@stylist_password where stylist_id='" + Session["username"].ToString().Trim() + "' ", con);

                cmd.Parameters.AddWithValue("@stylist_password", password);
                int result = cmd.ExecuteNonQuery();
                con.Close();

                if (result > 0)
                {
                    Response.Write("<script>alert('Details Updated Successfull');</script>");
                    GetStylistData();
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
            StChngPass.Text = "";
        }
    }
}