using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class adminadduser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string str = Class1.str;
        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = Request["username"].ToString();//登录传递过来的数据
            string password = Request["password"].ToString();//选择的日期
            string identity = DropDownList1.SelectedItem.Text.Trim();
            MySqlConnection conn = new MySqlConnection(str);
            conn.Open();
            string sql = "insert into userlog values('"
                + username + "','" + password + "','" + identity + "')";//插入
            MySqlCommand comm = new MySqlCommand(sql, conn);
            comm.ExecuteReader();

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Log.aspx");
            Session.Contents.RemoveAll();
        }
    }
}