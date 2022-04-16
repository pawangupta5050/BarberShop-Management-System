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
    public partial class Site2 : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindNotificationCount();
            getUnseenNotification();
            if (!IsPostBack)
            {
               
                //BindMessages();
                //getUnseenMessages();
            }
            try
            {
                HiddenField1.Value = DateTime.Now.ToString("dddd, dd MMMM yyyy");
                lblDateTime.Text = Convert.ToString(HiddenField1.Value);
                if (Session["role"] == null)
                {
                    Response.Redirect("adminlogin.aspx");
                }
                else if (Session["role"].Equals("user"))
                {
                    Response.Redirect("home.aspx");
                }
                else if (Session["role"].Equals("admin"))
                {
                    LoginId.Text = Session["fullname"].ToString();
                }
                else if (Session["role"].Equals("stylist"))
                {
                    Dashboard.Visible = false;

                    servicedrop.Visible = false;
                    customerdrop.Visible = false;
                    gallerydrop.Visible = false;
                    stylistdrop.Visible = false;
                    AppList.Visible = false;
                    AppRep.Visible = true;
                    AllotedApp.Visible = true;
                    ChangePass.Visible = false;
                    ChangeStylistPass.Visible = true;
                    Home.Visible = true;
                    ViewServices.Visible = true;
                    logout.Visible = true;
                    LoginId.Text = Session["fullname"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write("< script > alert('" + ex.Message + "');</ script >");
            }
            finally
            {

            }
        }

        protected void Dashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void ServiceInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("serviceinventory.aspx");
        }

        protected void ServiceManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("servicemanagement.aspx");
        }

        protected void CustomerManagement_Click(object sender, EventArgs e)
        {

            Response.Redirect("usermanagement.aspx");
        }

        protected void Customer_Click(object sender, EventArgs e)
        {

            Response.Redirect("testpage.aspx");
        }

        protected void stylistManagement_Click(object sender, EventArgs e)
        {

            Response.Redirect("StylistManagement.aspx");
        }

        protected void GalleryManagement_Click(object sender, EventArgs e)
        {

            Response.Redirect("testpage.aspx");
        }

        protected void Privacy_Click(object sender, EventArgs e)
        {
            Response.Redirect("privacy.aspx");
        }

        protected void Terms_Click(object sender, EventArgs e)
        {
            Response.Redirect("terms.aspx");
        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void ViewServices_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductList.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["role"] = null;

            Response.Redirect("home.aspx");
        }

        protected void ShaveGallery_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShaveGalleryManagement.aspx");
        }

        protected void HairGallery_Click(object sender, EventArgs e)
        {
            Response.Redirect("HairGalleryManagement.aspx");
        }

        protected void MassageGallery_Click(object sender, EventArgs e)
        {
            Response.Redirect("MassageGalleryManagement.aspx");
        }

        protected void ChangePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeAdminPass.aspx");
        }
        protected void AppList_Click(object sender, EventArgs e)
        {
            Response.Redirect("Appointment.aspx");
        }
        protected void AppRep_Click(object sender, EventArgs e)
        {
            Response.Redirect("AppointmentReport.aspx");
        }
        void BindNotificationCount()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader dr = null;
                SqlCommand cmd = new SqlCommand("SELECT (COUNT(NotificationID)) as NotificationCount FROM [BarberShop].[dbo].[Notification] WHERE Status='Unseen' ", con);

                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        NotificationCount.Text = dr["NotificationCount"].ToString();
                        NotifiCount.Text= dr["NotificationCount"].ToString();
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

        public void getUnseenNotification()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [AppointmentID],[CustomerName],[Date],[Status] from [BarberShop].[dbo].[Notification] WHERE [Status]='Unseen' ", con))
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

        protected void ChangeStylistPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeStylistPass.aspx");
        }

        protected void AllotedApp_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllotedAppointments.aspx");
        }

        //void BindMessages()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        SqlDataReader dr = null;
        //        SqlCommand cmd = new SqlCommand("SELECT (COUNT(usermssg)) as MessageCount FROM [BarberShop].[dbo].[chat] WHERE userstatus='unseen' ", con);

        //        dr = cmd.ExecuteReader();
        //        if (dr.HasRows)
        //        {
        //            while (dr.Read())
        //            {
        //                lblMessageCount.Text = dr["MessageCount"].ToString();
        //                LblMssgCount.Text = dr["MessageCount"].ToString();
        //            }
        //        }


        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");
        //    }
        //    finally
        //    {

        //    }
        //}
        //public void getUnseenMessages()
        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {

        //            if (con.State == ConnectionState.Closed)
        //            {
        //                con.Open();
        //            }
        //            using (SqlDataAdapter da = new SqlDataAdapter("SELECT [time],[userid] from [BarberShop].[dbo].[chat] WHERE [userstatus]='unseen' ", con))
        //            {
        //                DataSet ds = new DataSet();
        //                da.Fill(ds);

        //                if (ds.Tables[0].Rows.Count > 0)
        //                {
        //                    if (ListView2.Items.Count > 0)
        //                    { ListView2.Items.Clear(); }

        //                    ListView2.DataSource = ds.Tables[0];
        //                    ListView2.DataBind();
        //                }
        //                else
        //                {
        //                    ListView2.DataSource = null;
        //                    ListView2.DataBind();
        //                }
        //            }
        //            con.Close();
        //        }
        //    }
        //    catch (Exception Ex)
        //    {
        //        Response.Write(Ex.Message);
        //    }
        //    finally
        //    {

        //    }
        //}

        //protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
        //{
        //    if (String.Equals(e.CommandName, "ViewUserMessage"))
        //    {
        //        Response.Redirect("AdminMessages.aspx?userid=" + e.CommandArgument.ToString());

        //    }
        //}
    }
}