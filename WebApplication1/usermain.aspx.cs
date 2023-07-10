using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication1
{
    public partial class usermain : System.Web.UI.Page
    {
        string str = Class1.str;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (null != Request.Cookies["userName"])
            {
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                Label1.Text = username;
                string date = DateTime.Now.ToString("yyyy-MM-dd");
                Read_Log(date);
            }


            else
            {
                Response.Write("<script>alert('请先登录!')</script>");
                Label1.Text = "";
            }

        }

        protected void Read_Log(string datetime)
        {
            this.message.Value = "";
            if (null != Request.Cookies["userName"])
            {
                MySqlConnection conn = new MySqlConnection(str);
                conn.Open();
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));

                if (datetime != "" && username != "")
                {
                    string sql = "select work_day from information where  userName='" +
                        username + "'and datetime='" + datetime + " '";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        string xibie = dr["work_day"].ToString();
                        this.message.Value = xibie;
                    }
                    dr.Close();
                    conn.Close();
                }
            }
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection(str);
            conn.Open();
            if (null != Request.Cookies["userName"])
            {
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                string datetime = Request["dateselectEnd"].ToString();//时间
                string workday = Request["message"].ToString();//日志信息
                string sqlm = "select identity  from userlog where userName = '" +
                           username + " '";
                MySqlCommand commupdates = new MySqlCommand(sqlm, conn);
                object shuxing  = commupdates.ExecuteScalar();//查出标志位
                if (Convert.ToString(shuxing) != "员工")
                {
                    Response.Write("<script>alert('请重新登录')</script>");
                }
                else
                {
                    if (username != null && workday != "")
                    {
                        string sqls = "select logupdate  from information where userName = '" +
                           username + "'and datetime='" + datetime + " '";
                        MySqlCommand commupdate = new MySqlCommand(sqls, conn);
                        int logupdate = Convert.ToInt32(commupdate.ExecuteScalar());//查出标志位
                        MySqlCommand comms = new MySqlCommand("select count(*) from information where userName='" +
                            username + "'and datetime='" + datetime + " '", conn);
                        int count = Convert.ToInt32(comms.ExecuteScalar());
                        if (count > 0)
                        {
                            //标志位是从一开始递增
                            logupdate++;
                            string sql = "update information set  work_day='{0}',logupdate={1} where userName='{2}' and datetime='{3}'";
                            sql = string.Format(sql, workday, logupdate, username, datetime);
                            MySqlCommand comm = new MySqlCommand(sql, conn);
                            comm.ExecuteNonQuery();
                            conn.Close();
                            Read_Log(datetime);
                            Response.Write("<script>alert('提交成功!')</script>");
                        }
                        else
                        {
                            //标志位是0直接插入
                            string sql = "insert into information (userName,datetime,work_day,logupdate)values('"
                                + username + "','" + datetime + "','" + workday + "','" + logupdate + "')";
                            MySqlCommand com = new MySqlCommand(sql, conn);
                            com.ExecuteReader();
                            conn.Close();
                            Read_Log(datetime);
                            Response.Write("<script>alert('提交成功!')</script>");

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
        /// <summary>
        /// 查询前一天的
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button3_Click(object sender, EventArgs e)
        {
            string date = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
            Read_Log(date);
        }
       /// <summary>
       /// 查询前两天
       /// </summary>
       /// <param name="sender"></param>
       /// <param name="e"></param>
        protected void Button4_Click(object sender, EventArgs e)
        {
            string date = DateTime.Now.AddDays(-2).ToString("yyyy-MM-dd");
            Read_Log(date);
        }
        /// <summary>
        /// 查询前三天
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button5_Click(object sender, EventArgs e)
        {
            string date = DateTime.Now.AddDays(-3).ToString("yyyy-MM-dd");
            Read_Log(date);
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            Read_Log(date);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("historylook.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("usermain.aspx");

        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("weekplane.aspx");

        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cultivationdirection.aspx");

        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("updatepass.aspx");
        }
    }
}