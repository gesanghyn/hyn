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
    public partial class updatepass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (null != Request.Cookies["userName"])
            {
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));

                Label1.Text = username;

            }
            else
            {
                Response.Write("<script>alert('请先登录!')</script>");
                Label1.Text = "";
            }
        }
        string str = Class1.str;
        //修改密码

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (null != Request.Cookies["userName"])
            {
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));

                string password = Request["password"].ToString();//选择的日期
                string repassword = Request["repassword"].ToString();
                Label1.Text = username;//显示用户名
                MySqlConnection conn = new MySqlConnection(str);
                conn.Open();
                if (username != "")
                {
                    if (password == "" || repassword == "")
                    {
                        Response.Write("<script>alert('密码不能为空!')</script>");
                    }
                    else
                    {
                        if (password != repassword) //两次输入不一致
                        {
                            Response.Write("<script>alert('两次输入不一致!')</script>");
                        }
                        else
                        {
                            string sql = " UPDATE  Userlog SET password='" + password + "'"
                                           + "where userName='" + username + "'";  //修改信息
                            MySqlCommand comm = new MySqlCommand(sql, conn);
                            comm.ExecuteReader();
                        }
                    }
                }
                conn.Close();
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