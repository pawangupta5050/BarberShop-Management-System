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
    public partial class WebForm11 : System.Web.UI.Page
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

        protected void premium_Click(object sender, EventArgs e)
        {
            UpdateMemberStatus("Premium");
        }

        protected void gold_Click(object sender, EventArgs e)
        {
            UpdateMemberStatus("Gold");
        }

        protected void classic_Click(object sender, EventArgs e)
        {
            UpdateMemberStatus("Classic");
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            DeleteMemberById();
            Clear();
        }

        bool CheckMemberExist()
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
        void UpdateMemberStatus(string status)
        {
            if (CheckMemberExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("update user_details set acc_status='" + status + "' where user_id='" + UserId.Text.Trim() + "' ", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    ListView1.DataBind();
                    Response.Write("<script>alert('updated successfull');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
                finally
                {

                }
            }
            else
            {
                Response.Write("<script>alert('invalid id');</script>");
            }
        }

        void DeleteMemberById()
        {
            if (CheckMemberExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("delete from user_details where user_id='" + UserId.Text.Trim() + "' ", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('deleted successfull');</script>");
                    ListView1.DataBind();
                    delete.Visible = false;
                    premium.Visible = false;
                    classic.Visible = false;
                    gold.Visible = false;
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
                finally
                {

                }
            }
            else
            {
                Response.Write("<script>alert('invalid id');</script>");
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
                    SqlCommand cmd = new SqlCommand("select [user_name],[user_dob],[user_contact],[user_email],[user_state],[user_city],[user_pincode],[user_add],[user_id],[acc_status],[user_img] FROM [BarberShop].[dbo].[user_details] where [user_id] = '" + e.CommandArgument.ToString().Trim() + "' ", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        UserId.Text = dt.Rows[0]["user_id"].ToString().Trim();
                        Name.Text = dt.Rows[0]["user_name"].ToString().Trim();
                        Status.Text = dt.Rows[0]["acc_status"].ToString().Trim();
                        DOB.Text = dt.Rows[0]["user_dob"].ToString().Trim();
                        City.Text = dt.Rows[0]["user_city"].ToString().Trim();
                        Address.Text = dt.Rows[0]["user_add"].ToString().Trim();
                        Pincode.Text = dt.Rows[0]["user_pincode"].ToString().Trim();
                        Email.Text = dt.Rows[0]["user_email"].ToString().Trim();
                        CNumber.Text = dt.Rows[0]["user_contact"].ToString().Trim();
                        State.Text = dt.Rows[0]["user_state"].ToString().Trim();
                        Image1.ImageUrl = dt.Rows[0]["user_img"].ToString().Trim();
                        delete.Visible = true;
                        premium.Visible = true;
                        classic.Visible = true;
                        gold.Visible = true;

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
            UserId.Text = "";
            Name.Text = "";
            Status.Text = "";
            DOB.Text = "";
            CNumber.Text = "";
            Email.Text = "";
            State.Text = "";
            City.Text = "";
            Pincode.Text = "";
            Address.Text = "";
            Image1.ImageUrl = "";
        }
    }
}
