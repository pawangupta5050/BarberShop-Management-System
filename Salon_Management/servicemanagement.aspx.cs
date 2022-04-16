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
    public partial class WebForm10 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

        protected void Add_Click(object sender, EventArgs e)
        {
            if (CheckServiceExist())
            {
                Response.Write("<script>alert('Service with This id Exist. Try another');</script>");
            }
            else
            {
                AddNewService();
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            if (CheckServiceExist())
            {
                UpdateService();
            }
            else
            {
                Response.Write("<script>alert('Service with This id does not Exist. Try another');</script>");
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            if (CheckServiceExist())
            {
                DeleteService();
            }
            else
            {
                Response.Write("<script>alert('Service with This id does not Exist. Try another');</script>");
            }

        }

        bool CheckServiceExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from service_management where service_id='" + ServiceId.Text.Trim() + "'; ", con);
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
        void AddNewService()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into service_management (service_id,service_name,service_desc) values (@service_id,@service_name,@service_desc) ", con);

                cmd.Parameters.AddWithValue("@service_id", ServiceId.Text.Trim());
                cmd.Parameters.AddWithValue("@service_name", ServiceName.Text.Trim());
                cmd.Parameters.AddWithValue("@service_desc", ServiceDesc.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('added successfull');</script>");
                Clear();
                ListView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

            }
        }

        void UpdateService()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("update service_management set service_name = @service_name, service_desc=@service_desc where service_id='" + ServiceId.Text.Trim() + "' ", con);

                cmd.Parameters.AddWithValue("@service_name", ServiceName.Text.Trim());
                cmd.Parameters.AddWithValue("@service_desc", ServiceDesc.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('updated successfull');</script>");
                Clear();
                ListView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

            }
        }

        void DeleteService()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("delete from service_management where service_id='" + ServiceId.Text.Trim() + "' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('deleted successfull');</script>");
                Clear();
                ListView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

            }
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (String.Equals(e.CommandName, "viewdata"))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("select [service_id],[service_name],[service_desc] FROM [BarberShop].[dbo].[service_management] where [service_id] = '" + e.CommandArgument.ToString().Trim() + "' ", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        ServiceId.Text = dt.Rows[0]["service_id"].ToString().Trim();
                        ServiceName.Text = dt.Rows[0]["service_name"].ToString().Trim();
                        ServiceDesc.Text = dt.Rows[0]["service_desc"].ToString().Trim();
                        Add.Visible = false;
                        Update.Visible = true;
                        Delete.Visible = true;

                        cmd.ExecuteNonQuery();
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {

            }
        }

        void Clear()
        {
            ServiceId.Text = "";
            ServiceName.Text = "";
            ServiceDesc.Text = "";
        }

    }
}