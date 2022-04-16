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
    public partial class WebForm12 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string Filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ServicesNDesc();
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
        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            if (CheckServiceExist())
            {
                Response.Write("<script>alert('Service with This id Exist. Try another');</script>");
            }
            else
            {
                AddNewServices();
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
                Response.Write("<script>alert('Service with This Doesn't id Exist. Try another');</script>");
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            if (CheckServiceExist())
            {
                UpdateService();
                Add.Visible = true;
                Update.Visible = false;
                Delete.Visible = false;
            }
            else
            {
                Response.Write("<script>alert('Service with This id doesn't Exist.');</script>");
            }
        }

        void ServicesNDesc()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select service_name from service_management;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);  
                SerName.DataTextField = ds.Tables[0].Columns["service_name"].ToString();
                SerName.DataSource = ds.Tables[0];
                SerName.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

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

                SqlCommand cmd = new SqlCommand("select * from service_inventory where service_id='" + ServiceId.Text.Trim() + "'; ", con);
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
        void AddNewServices()
        {
            try
            {
                string service_category = "";
                foreach(int i in ServiceCat.GetSelectedIndices())
                {
                    service_category = service_category + ServiceCat.Items[i] + ",";
                }
                service_category = service_category.Remove(service_category.Length - 1);

                string filepath = "~/Service_ImgUpload/Admin_logo.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Service_ImgUpload/"+filename));
                filepath = "~/Service_ImgUpload/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into service_inventory (service_id,package_name,service_name,service_category,quality_type,service_cost,service_desc,service_img) values (@service_id,@package_name,@service_name,@service_category,@quality_type,@service_cost,@service_desc,@service_img) ", con);
                cmd.Parameters.AddWithValue("@service_id", ServiceId.Text.Trim());
                cmd.Parameters.AddWithValue("@package_name", PackageName.Text.Trim());
                cmd.Parameters.AddWithValue("@service_name", SerName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@service_category", service_category);
                cmd.Parameters.AddWithValue("@quality_type", Quality.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@service_cost", Cost.Text.Trim());
                cmd.Parameters.AddWithValue("@service_desc", ServiceDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@service_img", filepath);
                cmd.ExecuteNonQuery();
                
                Response.Write("<script>alert('added successfull');</script>");
                ListView1.DataBind();
                con.Close();
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
        void UpdateService()
        {
            try
            {
                string service_category = "";
                foreach (int i in ServiceCat.GetSelectedIndices())
                {
                    service_category = service_category + ServiceCat.Items[i] + ",";
                }
                service_category = service_category.Remove(service_category.Length - 1);

                string filepath = "~/Service_ImgUpload/Admin_logo.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if(filename == "" || filename == null)
                {
                    filepath = Filepath;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("Service_ImgUpload/" + filename));
                    filepath = "~/Service_ImgUpload/" + filename;
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("update service_inventory set package_name=@package_name,service_name=@service_name,service_category=@service_category,quality_type=@quality_type,service_cost=@service_cost,service_desc=@service_desc,service_img=@service_img where service_id='"+ServiceId.Text.Trim()+"' ", con);
                
                cmd.Parameters.AddWithValue("@package_name", PackageName.Text.Trim());
                cmd.Parameters.AddWithValue("@service_name", SerName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@service_category", service_category);
                cmd.Parameters.AddWithValue("@quality_type", Quality.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@service_cost", Cost.Text.Trim());
                cmd.Parameters.AddWithValue("@service_desc", ServiceDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@service_img", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                clear();
                Response.Write("<script>alert('Service updated successfull');</script>");
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

                SqlCommand cmd = new SqlCommand("delete from service_inventory where service_id='" + ServiceId.Text.Trim() + "' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('deleted successfull');</script>");
                clear();
                ListView1.DataBind();
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

                    SqlCommand cmd = new SqlCommand("select [service_id],[package_name],[service_name],[quality_type],[service_cost],[service_desc],[service_category],[service_img] from [BarberShop].[dbo].[service_inventory] where service_id='" + e.CommandArgument.ToString().Trim() + "' ", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        ServiceId.Text = dt.Rows[0]["service_id"].ToString().Trim();
                        PackageName.Text = dt.Rows[0]["package_name"].ToString().Trim();
                        SerName.SelectedValue = dt.Rows[0]["service_name"].ToString().Trim();
                        Quality.SelectedValue = dt.Rows[0]["quality_type"].ToString().Trim();
                        Cost.Text = dt.Rows[0]["service_cost"].ToString().Trim();
                        ServiceDesc.Text = dt.Rows[0]["service_desc"].ToString().Trim();
                        Image1.ImageUrl = dt.Rows[0]["service_img"].ToString();
                        string[] serviceCat = dt.Rows[0]["service_category"].ToString().Trim().Split(',');
                        for (int i = 0; i < serviceCat.Length; i++)
                        {
                            for (int j = 0; j < ServiceCat.Items.Count; j++)
                            {
                                if (ServiceCat.Items[j].ToString() == serviceCat[i])
                                {
                                    ServiceCat.Items[j].Selected = true;
                                }
                                else
                                {
                                    ServiceCat.Items[j].Selected = false;
                                }
                            }
                        }
                        Filepath = dt.Rows[0]["service_img"].ToString().Trim();
                        Add.Visible = false;
                        Update.Visible = true;
                        Delete.Visible = true;
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
            ServiceId.Text = "";
            PackageName.Text = "";
            Quality.Text = "";
            Cost.Text = "";
            ServiceDesc.Text = "";
            Image1.ImageUrl = "";
            this.SerName.ClearSelection();
            this.ServiceCat.ClearSelection();
        }
    }
}