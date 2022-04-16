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
    public partial class chat : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //getAllChat();
        }
        //public void getAllChat()
        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {

        //            if (con.State == ConnectionState.Closed)
        //            {
        //                con.Open();
        //            }
        //            using (SqlDataAdapter da = new SqlDataAdapter("SELECT [time],[usermssg],[adminmssg] FROM [BarberShop].[dbo].[chat] where [userid]='"+Session["username"].ToString().Trim()+"'", con))
        //            {
        //                DataSet ds = new DataSet();
        //                da.Fill(ds);

        //                if (ds.Tables[0].Rows.Count > 0)
        //                {
        //                    if (ListView1.Items.Count > 0)
        //                    { ListView1.Items.Clear(); }

        //                    ListView1.DataSource = ds.Tables[0];
        //                    ListView1.DataBind();
        //                }
        //                else
        //                {
        //                    ListView1.DataSource = null;
        //                    ListView1.DataBind();
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

        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }

        //        SqlCommand cmd = new SqlCommand("insert into [BarberShop].[dbo].[chat] (usermssg,userid,time,adminmssg,userstatus) values (@usermssg,@userid,@time,@adminmssg,@userstatus) ", con);

        //        cmd.Parameters.AddWithValue("@usermssg", TextBox1.Text.Trim());
        //        cmd.Parameters.AddWithValue("@time", DateTime.Now.ToString("0:HH:mm"));
        //        cmd.Parameters.AddWithValue("@userid", Session["username"].ToString());
        //        cmd.Parameters.AddWithValue("@adminmssg", "Hey &nbsp;"+Session["fullname"].ToString().Trim()+", please wait for " +
        //            "some time our admin will shortly get in touch with you.");
        //        cmd.Parameters.AddWithValue("@userstatus", "unseen");

        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //        getAllChat();
        //        clear();
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");
        //    }
        //    finally
        //    {

        //    }
        //}
        //void clear()
        //{
        //    TextBox1.Text = "";
        //}
    }
}