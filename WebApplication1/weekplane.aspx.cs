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
    public partial class weekplane : System.Web.UI.Page
    {
        string str = Class1.str;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (null != Request.Cookies["userName"])
            {
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                Label1.Text = username;
                Read_Log();

            }
            else
            {
                Response.Write("<script>alert('请先登录!')</script>");
                Label1.Text = "";
            }

        }

        /// <summary>
        /// 查询每周一的记录
        /// </summary>
        protected void Read_Log()
        {
            if (null != Request.Cookies["userName"])
            {
                MySqlConnection conn = new MySqlConnection(str);
                conn.Open();
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                if ( username != "")
                {
                    string sql = "select work_plan from information where datetime in (select subdate(curdate(),date_format(curdate(),'%w')-1) )" +
                        " and userName= '"+username+"'";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        string xibie = dr["work_plan"].ToString();
                        this.weekmessage.Value = xibie;
                    }
                    dr.Close(); 
                }
                
                conn.Close();
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection(str);
            conn.Open();
            string workplane = Request["weekmessage"].ToString();
            if (null != Request.Cookies["userName"])
            {
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));

                if (username != null && workplane != "")
                {
                    string datetime = Request["dateselect"].ToString();//选择的日期
                    MySqlCommand commupdate = new MySqlCommand("select logupdate  from information where userName='" +
                      username + "'and datetime='" + datetime + " '", conn);
                    int logupdate = Convert.ToInt32(commupdate.ExecuteScalar());//查出标志位
                    MySqlCommand comms = new MySqlCommand("select count(*) from information where userName='" +
                     username + "'and datetime='" + datetime + " '", conn);
                    int count = Convert.ToInt32(comms.ExecuteScalar());
                    if (count > 0)
                    { //标志位是从一开始递增
                        logupdate++;
                        string sql = "update information set work_plan='{0}',logupdate={1} where userName='{2}' and datetime='{3}'";
                        sql = string.Format(sql, workplane, logupdate, username, datetime);
                        MySqlCommand comm = new MySqlCommand(sql, conn);
                        comm.ExecuteNonQuery();
                        conn.Close();
                        Read_Log();
                        Response.Write("<script>alert('提交成功!')</script>");
                    }
                    else
                    {
                        //      //INSERT INTO table_name (列1, 列2,...) VALUES (值1, 值2,....)
                        string sql = "insert into information (userName,datetime,work_plan,logupdate)values('"
                            + username + "','" + datetime + "','" + workplane + "','" + logupdate + "')";
                        MySqlCommand com = new MySqlCommand(sql, conn);
                        com.ExecuteReader();
                        conn.Close();
                        Read_Log();
                        Response.Write("<script>alert('提交成功!')</script>");

                    }
                }
            }
            conn.Close();   
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
