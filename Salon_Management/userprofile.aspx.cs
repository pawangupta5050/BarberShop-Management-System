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
    public partial class WebForm19 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString().Trim() == "" || Session["username"].ToString().Trim() == null)
                {

                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("home.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        GetUserData();
                        getBookingDetails();
                        getWishlist();
                        bindGrandTotal();
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("login.aspx");
            }
            finally
            {

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
                GetUserData();
            }
        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            DeleteUser();
        }
        protected void Edit_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString().Trim() == "" || Session["username"].ToString().Trim() == null)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("home.aspx");
            }
            else
            {
                UpdateDetails();
            }
        }
        protected void SaveImg_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString().Trim() == "" || Session["username"].ToString().Trim() == null)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("home.aspx");
            }

            else
            {
                SaveUserImage();
                GetUserData();
            }
        }
        void GetUserData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select [user_name],[user_dob],[user_contact],[user_email],[user_state],[user_city],[user_pincode],[user_add],[user_id],[acc_status],[user_pass],[user_img] FROM [BarberShop].[dbo].[user_details] where [user_id] = '" + Session["username"].ToString().Trim() + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    UserId.Text = dt.Rows[0]["user_id"].ToString().Trim();
                    Name.Text = dt.Rows[0]["user_name"].ToString().Trim();
                    DOB.Text = dt.Rows[0]["user_dob"].ToString().Trim();
                    City.Text = dt.Rows[0]["user_city"].ToString().Trim();
                    Address.Text = dt.Rows[0]["user_add"].ToString().Trim();
                    Pincode.Text = dt.Rows[0]["user_pincode"].ToString().Trim();
                    Email.Text = dt.Rows[0]["user_email"].ToString().Trim();
                    Contact.Text = dt.Rows[0]["user_contact"].ToString().Trim();
                    State.Text = dt.Rows[0]["user_state"].ToString().Trim();
                    Password.Attributes["value"] = dt.Rows[0]["user_pass"].ToString().Trim();
                    Label1.Text = dt.Rows[0]["acc_status"].ToString().Trim();
                    Image1.ImageUrl = dt.Rows[0]["user_img"].ToString().Trim();

                    if (dt.Rows[0]["acc_status"].ToString().Trim() == "Premium")
                    {
                        Label1.Attributes.Add("class", "badge rounded-pill bg-success");
                    }
                    else if (dt.Rows[0]["acc_status"].ToString().Trim() == "Gold")
                    {
                        Label1.Attributes.Add("class", "badge rounded-pill bg-success");
                    }
                    else if (dt.Rows[0]["acc_status"].ToString().Trim() == "Classic")
                    {
                        Label1.Attributes.Add("class", "badge rounded-pill bg-warning");
                    }

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
        void UpdateDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("update user_details set user_name=@user_name,user_dob=@user_dob,user_contact=@user_contact,user_email=@user_email,user_state=@user_state,user_city=@user_city,user_pincode=@user_pincode,user_add=@user_add where user_id='" + Session["username"].ToString().Trim() + "' ", con);

                cmd.Parameters.AddWithValue("@user_name", Name.Text.Trim());
                cmd.Parameters.AddWithValue("@user_email", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@user_dob", DOB.Text.Trim());
                cmd.Parameters.AddWithValue("@user_city", City.Text.Trim());
                cmd.Parameters.AddWithValue("@user_state", State.Text.Trim());
                cmd.Parameters.AddWithValue("@user_add", Address.Text.Trim());
                cmd.Parameters.AddWithValue("@user_pincode", Pincode.Text.Trim());
                cmd.Parameters.AddWithValue("@user_contact", Contact.Text.Trim());

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('Details Updated Successfull');</script>");
                    GetUserData();
                }
                else
                {
                    Response.Write("<script>alert('Details Update Unsuccessfull');</script>");
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
                if (ChnPass.Text.Trim() == "")
                {
                    password = Password.Text.Trim();
                }
                else
                {
                    password = ChnPass.Text.Trim();
                }
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update user_details set user_pass=@user_pass where user_id='" + Session["username"].ToString().Trim() + "' ", con);

                cmd.Parameters.AddWithValue("@user_pass", password);
                int result = cmd.ExecuteNonQuery();
                con.Close();

                if (result > 0)
                {
                    Response.Write("<script>alert('Details Updated Successfull');</script>");
                    GetUserData();
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
        void DeleteUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("delete from user_details where user_id='" + Session["username"].ToString().Trim() + "' ", con);
                int result = cmd.ExecuteNonQuery();
                con.Close();

                if (result > 0)
                {
                    Session["username"] = "";
                    Session["fullname"] = "";
                    Session["role"] = "";
                    Session["status"] = "";
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Operation');</script>");
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
        void clear()
        {
            ChnPass.Text = "";
        }
        void SaveUserImage()
        {
            try
            {
                string filepath = "~/UserPhotoUpload/Admin_logo.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("UserPhotoUpload/" + filename));
                filepath = "~/UserPhotoUpload/" + filename;
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("update user_details set user_img=@user_img where user_id='" + Session["username"].ToString().Trim() + "' ", con);

                cmd.Parameters.AddWithValue("@user_img", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Profile Photo Uploaded successfull');</script>");
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
        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
        public void getBookingDetails()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [appointment_date],[package_name],[status] FROM [BarberShop].[dbo].[appointment_details] WHERE [customer_id]='" + Session["username"] + "'", con))
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
        public void getWishlist()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [serviceid],[servicename],[servicecategory],[servicedesc],[serviceimage],[serviceprice] FROM [BarberShop].[dbo].[wishlist] where [username]='" + Session["username"].ToString().Trim() + "'", con))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ListView2.Items.Count > 0)
                            { ListView2.Items.Clear(); }

                            ListView2.DataSource = ds.Tables[0];
                            ListView2.DataBind();
                        }
                        else
                        {
                            ListView2.DataSource = null;
                            ListView2.DataBind();
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
        void bindGrandTotal()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader dr = null;
                SqlCommand cmd = new SqlCommand("SELECT SUM(CONVERT(int, [serviceprice])) as grandtotal,(SELECT (COUNT(serviceid))) as servicecount FROM [BarberShop].[dbo].[wishlist] WHERE [username] = '" + Session["username"].ToString().Trim() + "'", con);

                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblsubtotal.Text = dr["grandtotal"].ToString();
                        lblservicecount.Text = dr["servicecount"].ToString();
                        lblTotal.Text = dr["grandtotal"].ToString();
                    }
                }
                con.Close();
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
}