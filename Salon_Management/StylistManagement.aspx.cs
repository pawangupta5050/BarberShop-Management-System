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
    public partial class WebForm13 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string Filepath;
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
            if (CheckStylistExist())
            {
                Response.Write("<script>alert('Stylist with This id Exist. Try another');</script>");
            }
            else
            {
                AddNewStylist();
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            if (CheckStylistExist())
            {
                UpdateStylist();
            }
            else
            {
                Response.Write("<script>alert('Stylist with This id does not Exist. Try another');</script>");
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            if (CheckStylistExist())
            {
                DeleteStylist();
            }
            else
            {
                Response.Write("<script>alert('Stylist with This id does not Exist. Try another');</script>");
            }
        }
        bool CheckStylistExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from stylist_management where stylist_id='" + StylistId.Text.Trim() + "'; ", con);
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
        void AddNewStylist()
        {
            try
            {

                string filepath = "~/Stylist_ImgUpload/Admin_logo.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Stylist_ImgUpload/" + filename));
                filepath = "~/Stylist_ImgUpload/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into stylist_management (stylist_id,stylist_name,stylist_desc,stylist_email,stylist_password,stylist_img) values (@stylist_id,@stylist_name,@stylist_desc,@stylist_email,@stylist_password,@stylist_img) ", con);

                cmd.Parameters.AddWithValue("@stylist_id", StylistId.Text.Trim());
                cmd.Parameters.AddWithValue("@stylist_name", StylistName.Text.Trim());
                cmd.Parameters.AddWithValue("@stylist_desc", StylistDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@stylist_email", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@stylist_password", Password.Text.Trim());
                cmd.Parameters.AddWithValue("@stylist_img", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Added Stylist successfull');</script>");
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
        void UpdateStylist()
        {
            try
            {
                string filepath = "~/Stylist_ImgUpload/Admin_logo.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = Filepath;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("Stylist_ImgUpload/" + filename));
                    filepath = "~/Stylist_ImgUpload/" + filename;
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("update stylist_management set stylist_name=@stylist_name, stylist_desc=@stylist_desc, stylist_email=@stylist_email, stylist_password=@stylist_password, stylist_img=@stylist_img where stylist_id='" + StylistId.Text.Trim() + "' ", con);

                cmd.Parameters.AddWithValue("@stylist_name", StylistName.Text.Trim());
                cmd.Parameters.AddWithValue("@stylist_desc", StylistDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@stylist_email", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@stylist_password", Password.Text.Trim());
                cmd.Parameters.AddWithValue("@stylist_img", filepath );


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Updated Stylist successfull');</script>");
                Clear();
                ListView1.DataBind();
                Update.Visible = false;
                Delete.Visible = false;
                Add.Visible = true;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

            }
        }
        void DeleteStylist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("delete from stylist_management where stylist_id='" + StylistId.Text.Trim() + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Deleted Stylist successfull');</script>");
                Clear();
                ListView1.DataBind();
                Update.Visible = false;
                Delete.Visible = false;
                Add.Visible = true;
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
                    SqlCommand cmd = new SqlCommand("select [stylist_id],[stylist_name],[stylist_desc],[stylist_img],[stylist_password],[stylist_email] FROM [BarberShop].[dbo].[stylist_management] where [stylist_id] = '" + e.CommandArgument.ToString().Trim() + "' ", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        StylistId.Text = dt.Rows[0]["stylist_id"].ToString().Trim();
                        StylistName.Text = dt.Rows[0]["stylist_name"].ToString().Trim();
                        StylistDesc.Text = dt.Rows[0]["stylist_desc"].ToString().Trim();
                        Email.Text = dt.Rows[0]["stylist_email"].ToString().Trim();
                        Password.Text = dt.Rows[0]["stylist_password"].ToString().Trim();
                        Filepath = dt.Rows[0]["stylist_img"].ToString().Trim();
                        Image1.ImageUrl = dt.Rows[0]["stylist_img"].ToString().Trim();
                        Delete.Visible = true;
                        Update.Visible = true;
                        Add.Visible = false;

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
            StylistId.Text = "";
            StylistName.Text = "";
            StylistDesc.Text = "";
            Email.Text = "";
            Password.Text = "";
            Image1.ImageUrl = "";
        }
    }
}