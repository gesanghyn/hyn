using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplication1
{
    public partial class Cultivationdirection : System.Web.UI.Page
    {
        string str = Class1.str;
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox2.ReadOnly = true;
            if (null != Request.Cookies["userName"])
            {
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));

                Label1.Text = username;
                MySqlConnection conn = new MySqlConnection(str);
                conn.Open();
                string sql = " select cultivationdirection , task from Direction where username='" + username + "'";  //查询培养方向
                MySqlCommand comm = new MySqlCommand(sql, conn);
                MySqlDataReader Dr = comm.ExecuteReader();
                while (Dr.Read())
                {
                    TextBox2.Text = Dr["cultivationdirection"].ToString();
                    TextBox3.Text = Dr["task"].ToString();

                }
                conn.Close();
            }
            else
            {
                Response.Write("<script>alert('请先登录!')</script>");
                Label1.Text = "";
            }
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Log.aspx");
            HttpCookie ck2 = Request.Cookies["userName"];
            ck2.Expires = DateTime.MinValue;
            Response.Cookies["userName"].Expires = DateTime.MinValue;
        }


    }
}
