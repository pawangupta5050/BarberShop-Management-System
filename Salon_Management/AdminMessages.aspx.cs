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
    public partial class WebForm20 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["userid"]))
            {
                String userid = Request.QueryString["userid"].ToString();
                SqlConnection con = new SqlConnection(strcon);

                SqlDataReader dr = null;

                string strSql = "SELECT [time],[userid],[usermssg],[adminmssg],(SELECT [user_name] FROM [BarberShop].[dbo].[user_details] WHERE [user_id]='" + userid + "') as username FROM [BarberShop].[dbo].[chat] where [userid]='" + userid + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(strSql, con);
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Username.Text = dr["username"].ToString();
                        HiddenField1.Value = dr["userid"].ToString();
                    }
                }
                con.Close();
                if (!IsPostBack)
                {
                    getAllChat();
                }
            }
        }
        public void getAllChat()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT [time],[usermssg],[adminmssg] FROM [BarberShop].[dbo].[chat] where [userid]='"+HiddenField1.Value.ToString()+"' ", con))
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

        protected void send_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE [BarberShop].[dbo].[chat] SET time=@time,adminmssg=@adminmssg,userstatus=@userstatus where [userid]='" + HiddenField1.Value.ToString() + "' ", con);

                cmd.Parameters.AddWithValue("@adminmssg", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@time", DateTime.Now.ToString("0:HH:mm"));
                cmd.Parameters.AddWithValue("@userstatus", "seen");
                cmd.ExecuteNonQuery();
                con.Close();
                getAllChat();
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
            TextBox1.Text = "";
        }

    }
}