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
    public partial class MassageGalleryManagement : System.Web.UI.Page
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
            if (CheckImageExist())
            {
                Response.Write("<script>alert('Image with This id Exist. Try another');</script>");
            }
            else
            {
                AddNewImage();
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            if (CheckImageExist())
            {
                UpdateImage();
            }
            else
            {
                Response.Write("<script>alert('Image with This id does not Exist. Try another');</script>");
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            if (CheckImageExist())
            {
                DeleteImage();
            }
            else
            {
                Response.Write("<script>alert('Image with This id does not Exist. Try another');</script>");
            }
        }
        bool CheckImageExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from [BarberShop].[dbo].[massage_gallery] where massageimg_id='" + MassageImgId.Text.Trim() + "'; ", con);
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
        void AddNewImage()
        {
            try
            {

                string filepath = "~/MassageGallery_ImgUpload/Admin_logo.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("MassageGallery_ImgUpload/" + filename));
                filepath = "~/MassageGallery_ImgUpload/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into [BarberShop].[dbo].[massage_gallery] (massageimg_id,massageimg_name,massage_image) values (@massageimg_id,@massageimg_name,@massage_image) ", con);

                cmd.Parameters.AddWithValue("@massageimg_id", MassageImgId.Text.Trim());
                cmd.Parameters.AddWithValue("@massageimg_name", MassageImgName.Text.Trim());
                cmd.Parameters.AddWithValue("@massage_image", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Added Image Successfully');</script>");
                ListView1.DataBind();
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
        void UpdateImage()
        {
            try
            {
                string filepath = "~/MassageGallery_ImgUpload/Admin_logo.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = Filepath;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("MassageGallery_ImgUpload/" + filename));
                    filepath = "~/MassageGallery_ImgUpload/" + filename;
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("update [BarberShop].[dbo].[massage_gallery] set massageimg_id=@massageimg_id,massageimg_name=@massageimg_name,massage_image=@massage_image  where massageimg_id='" + MassageImgId.Text.Trim() + "' ", con);

                cmd.Parameters.AddWithValue("@massageimg_id", MassageImgId.Text.Trim());
                cmd.Parameters.AddWithValue("@massageimg_name", MassageImgName.Text.Trim());
                cmd.Parameters.AddWithValue("@massage_image", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Updated Image Successfully');</script>");
                ListView1.DataBind();
                clear();
                Add.Visible = true;
                Update.Visible = false;
                Delete.Visible = false;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

            }
        }
        void DeleteImage()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("delete from [BarberShop].[dbo].[massage_gallery] where massageimg_id='" + MassageImgId.Text.Trim() + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Deleted Image Successfully');</script>");
                ListView1.DataBind();
                clear();
                Add.Visible = true;
                Update.Visible = false;
                Delete.Visible = false;
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
                    SqlCommand cmd = new SqlCommand("SELECT [massageimg_id],[massageimg_name],[massage_image] FROM [BarberShop].[dbo].[massage_gallery] where [massageimg_id] = '" + e.CommandArgument.ToString().Trim() + "' ", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        MassageImgId.Text = dt.Rows[0]["massageimg_id"].ToString().Trim();
                        MassageImgName.Text = dt.Rows[0]["massageimg_name"].ToString().Trim();
                        Image1.ImageUrl = dt.Rows[0]["massage_image"].ToString().Trim();
                        Filepath = dt.Rows[0]["massage_image"].ToString().Trim();
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
        void clear()
        {
            MassageImgId.Text = "";
            MassageImgName.Text = "";
            Image1.ImageUrl = "";
        }
    }
}