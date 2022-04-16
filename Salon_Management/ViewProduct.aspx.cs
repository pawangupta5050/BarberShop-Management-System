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
    public partial class ViewProduct : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind_Time();
                bind_Stylist();
                bind_CustomerDetails();
            }
            if (!String.IsNullOrEmpty(Request.QueryString["service_id"]))
            {
                String ServiceId = Request.QueryString["service_id"].ToString();
                SqlConnection con = new SqlConnection(strcon);

                SqlDataReader dr = null;

                string strSql = "SELECT [service_id],[package_name],[service_name],[quality_type],[service_cost],[service_desc],[service_category],[service_img] from [BarberShop].[dbo].[service_inventory] WHERE [service_id] = '" + ServiceId + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(strSql, con);
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        ServiceID.Text = dr["service_id"].ToString();
                        ProductName.Text = dr["package_name"].ToString();
                        Tag.Text = dr["quality_type"].ToString();
                        Cost.Text = dr["service_cost"].ToString();

                        int a = Int32.Parse(dr["service_cost"].ToString()) + 50;
                        DeclinedCost.Text = a.ToString();
                        Description.Text = dr["service_desc"].ToString();
                        Quality.Text = dr["quality_type"].ToString();
                        ServiceCat.Text = dr["service_category"].ToString();
                        ServiceName.Text = dr["service_name"].ToString();
                        ProductImg.ImageUrl = dr["service_img"].ToString().Trim();

                        Session["Product_Id"] = ServiceID.Text;
                        Session["stylistname"] = Stylist.SelectedItem.ToString();
                        Session["date"] = Date.Text;
                        HiddenField2.Value = DateTime.Today.ToString();
                        Session["time"] = Time.SelectedItem.ToString();
                        HiddenField1.Value = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");
                        Session["ReviewID"] = Session["Product_Id"] + HiddenField1.Value;
                    }
                }
                if (!IsPostBack)
                {
                    getReviews();
                    BindReviewCount();
                }
                con.Close();
            }
            else
            {
                Response.Redirect("home.aspx");
            }
        }

        void bind_Time()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select CONVERT(varchar(15),[timing],100) as timing FROM [BarberShop].[dbo].[timing_details]", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                Time.DataTextField = ds.Tables[0].Columns["timing"].ToString();
                Time.DataSource = ds.Tables[0];
                Time.DataBind();
                Time.Items.Insert(0, new ListItem("Select Time", "0"));

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

            }
        }
        void bind_Stylist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT [stylist_name] from [BarberShop].[dbo].[stylist_management]", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                Stylist.DataTextField = ds.Tables[0].Columns["stylist_name"].ToString();
                Stylist.DataSource = ds.Tables[0];
                Stylist.DataBind();
                Stylist.Items.Insert(0, new ListItem("Select Stylist", "0"));

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

            }
        }
        void bind_CustomerDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT [acc_status],[user_img] FROM [BarberShop].[dbo].[user_details] WHERE [user_id]='" + Session["username"] + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    UserStatus.Value = dt.Rows[0]["acc_status"].ToString().Trim();
                    UserImage.Value = dt.Rows[0]["user_img"].ToString().Trim();
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
        protected void Book_Click(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else if (Session["role"].Equals("user"))
            {
                if (Stylist.SelectedValue == null || Stylist.SelectedItem.Text.Trim() == "Select Stylist")
                {
                    Response.Write("<script>alert('Please Select Stylist');</script>");
                }
                else if (Time.SelectedValue == null || Time.SelectedItem.Text.Trim() == "Select Time")
                {
                    Response.Write("<script>alert('Please Select Time');</script>");
                }
                else if (Date.Text == "")
                {

                    Response.Write("<script>alert('Please Select Date');</script>");
                    
                }
                else
                {
                    var a = Convert.ToDateTime(Date.Text);
                    var b = Convert.ToDateTime(HiddenField2.Value);
                    if (a <= b)
                    {
                        Response.Write("<script>alert('Previous date cannot be selected');</script>");
                    }
                    else
                    {
                        Response.Redirect("CheckOut.aspx?Service_id=" + Session["Product_Id"].ToString());
                    }
                }
            }
            else if (Session["role"].Equals("admin"))
            {
                Response.Write("<script>alert('You are not permited to Book an appointment');</script>");
            }
        }
        protected void ProductCmt_Click(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else if (Session["role"].Equals("user"))
            {
                CreateNewReview();
                getReviews();
                clear();
            }
            else if (Session["role"].Equals("admin"))
            {
                Response.Write("<script>alert('You are not permited to Write a review');</script>");
            }
        }
        void CreateNewReview()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO [BarberShop].[dbo].[ServiceReview] (ReviewID,CustomerName,CustomerImage,ProductID,Review,Date,CustomerID,CustomerStatus) values (@ReviewID,@CustomerName,@CustomerImage,@ProductID,@Review,@Date,@CustomerID,@CustomerStatus)", con);
                cmd.Parameters.AddWithValue("@ReviewID", Session["ReviewID"].ToString().Trim());
                cmd.Parameters.AddWithValue("@CustomerName", Session["fullname"].ToString().Trim());
                cmd.Parameters.AddWithValue("@CustomerImage", UserImage.Value.Trim());
                cmd.Parameters.AddWithValue("@ProductID", Session["Product_Id"].ToString().Trim());
                cmd.Parameters.AddWithValue("@Review", ProductReview.Text.Trim());
                cmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("MM/dd/yyyy"));
                cmd.Parameters.AddWithValue("@CustomerID", Session["username"].ToString().Trim());
                cmd.Parameters.AddWithValue("@CustomerStatus", UserStatus.Value.Trim());
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Thank You! Your Review means a lot. ');</script>");

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
        void getReviews()
        {

            try
            {

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [ReviewID],[CustomerName],[CustomerImage],[Review],[Date],[CustomerStatus] FROM [BarberShop].[dbo].[ServiceReview] WHERE [ProductID]='" + ServiceID.Text.ToString().Trim() + "'", con))
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
        void clear()
        {
            ProductReview.Text = "";
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (String.Equals(e.CommandName, "Report"))
                {
                    if (Session["role"] == null)
                    {
                        Response.Redirect("login.aspx");
                    }
                    else if (Session["role"].Equals("user"))
                    {
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        SqlCommand cmd = new SqlCommand("UPDATE [BarberShop].[dbo].[ServiceReview] SET [ReportReview]='Reported' WHERE [ReviewID] = '" + e.CommandArgument.ToString().Trim() + "' ", con);
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Reported Sucessfully, Our team will get back to the comment');</script>");
                        con.Close();
                    }
                    else if (Session["role"].Equals("admin"))
                    {
                        Response.Write("<script>alert('You are not permited to Report any Comment');</script>");
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {

            }
        }
        void BindReviewCount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader dr = null;
                SqlCommand cmd = new SqlCommand("SELECT (COUNT(Review)) as ReviewCount FROM [BarberShop].[dbo].[ServiceReview] WHERE [ProductID]='" + ServiceID.Text.ToString().Trim() + "' ", con);

                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ReviewCount.Text = dr["ReviewCount"].ToString();
                    }
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

        protected void BtnReview_Click(object sender, EventArgs e)
        {
            ProductReview.Text = "Best service... Really Liked it!!!";
        }
    }
}