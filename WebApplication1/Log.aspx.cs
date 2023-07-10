using System;
using System.Data.SqlClient;
using System.Web;
using MySql.Data.MySqlClient;
namespace WebApplication1
{
    public partial class Log : System.Web.UI.Page
    {
        string str = Class1.str;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void Button1_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection(str);
            conn.Open();
            string sql = "select * from Userlog where userName=@userName and password=@password ";
            MySqlCommand comm = new MySqlCommand(sql, conn);
            string userName = Request["userName"].ToString();
            string password = Request["Password"].ToString();
            MySqlParameter p1 = new MySqlParameter("userName", MySqlDbType.VarChar);
            p1.Value = userName;
            MySqlParameter p2 = new MySqlParameter("password", MySqlDbType.VarChar);
            p2.Value = password;
            //comm.Parameters.Add("userName", MySqlDbType.VarChar);
            comm.Parameters.Add(p1);
            comm.Parameters.Add(p2);
            MySqlDataReader sdr = comm.ExecuteReader();
            if (sdr.Read())
            {
                HttpCookie cookie = new HttpCookie("userName");
                cookie.Value = HttpUtility.UrlEncode(userName,System.Text.Encoding.GetEncoding("UTF-8"));
                Response.Cookies.Add(cookie);
                conn.Close();
                conn.Open();
                string identity = "select identity from userlog where userName= '" + userName + "'";
                MySqlCommand com = new MySqlCommand(identity, conn);
                //执行命令并返回单个值
                object objstr = com.ExecuteScalar();
                if (Convert.ToString(objstr).Trim() == "员工")
                {
                    Response.Redirect("usermain.aspx");
                }
                else if (Convert.ToString(objstr).Trim() == "管理员")
                {
                    Response.Redirect("adminlog.aspx");
                }
                else
                {
                    Response.Redirect("Leadercontrol.aspx");
                }
                conn.Close();
            }
            else
            {
                Response.Write("<script>alert('无法登陆，用户名或密码错误,请重新输入!')</script>");

            }
            conn.Close();
            sdr.Close();
        }
       
    }
}