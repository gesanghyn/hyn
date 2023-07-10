using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Timers;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace WebApplication1
{
    public class Global : System.Web.HttpApplication
    {
        MySqlConnection conn = new MySqlConnection(Class1.str);
        protected void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            //定义定时器  
           // 在应用程序启动时运行的代码
            Time_Task.Instance().ExecuteTask += new System.Timers.ElapsedEventHandler(myTimer_Elapsed);
            //Time_Task.Instance().Interval =1000;//表示1秒的间隔
            Time_Task.Instance().Start();

        }
        //访问才能生效
        void myTimer_Elapsed(object source, ElapsedEventArgs e)
        {
            try
            {
                conn.Open();
                string sqlhour = " SELECT hourset FROM `checksingal` where id=1;";
                MySqlCommand cmdhour = new MySqlCommand(sqlhour, conn);
                object hour = cmdhour.ExecuteScalar();
                int  hoursend = Convert.ToInt32(hour.ToString().PadLeft(2, '0'));//查出定时提交时间

                string sqlMinute = " SELECT Minuteset FROM `checksingal`where id=1;";
                MySqlCommand cmdMinute = new MySqlCommand(sqlMinute, conn);
                object Minute = cmdMinute.ExecuteScalar();//查出定时提交分钟
                int minsend = Convert.ToInt32(Minute.ToString().PadLeft(2, '0'));
                // 得到 hour minute second　如果等于某个值就开始执行某个程序。
                int intHour = e.SignalTime.Hour;
                int intMinute = e.SignalTime.Minute;
                int intSecond = e.SignalTime.Second;
                //提交条件一:每天自动提交日志的时间可设置，默认为晚上10点；
                int iHour = hoursend;
                int iMinute=minsend;
                int iSecond =00;

                // 设置　默认每天的晚上１０：0０：００开始执行程序
                if (intHour == iHour && intMinute == iMinute && intSecond == iSecond)
                {
                    //提交条件二：如果当天撰写日志的人数大于5人，且 自动提交的选项被勾选，才自动提交当天的工作日志；
                    //1 验证是否被勾选
                    string sqlsingal = " SELECT checkauto FROM `checksingal` where id=1;";
                    MySqlCommand cmds = new MySqlCommand(sqlsingal, conn);
                    object counts = (int)cmds.ExecuteScalar();//查出标志位,控制是否勾选,勾选为1，不勾选为0
                    //2 验证今日提交人数是否大于五人
                    string date = DateTime.Now.ToString("yyyy-MM-dd");
                    string Subuser_Count = "select count(*)  from information where  datetime='" + date + " '";
                    MySqlCommand cmd = new MySqlCommand(Subuser_Count, conn);
                    object count = cmd.ExecuteScalar();//查出今日提交的日志总数
                    //3 验证是否已经提交过了 
                    string submitsingal = "SELECT count(datetime) FROM `historyinformation` where  datetime='" + date + " '";
                    MySqlCommand cmdsubmit = new MySqlCommand(submitsingal, conn);
                    object submit = cmdsubmit.ExecuteScalar();//查出是否已经提交过,不为0表示已经提交过，为0表示还未提交

                    if (Convert.ToInt32(count) > 5 && Convert.ToInt32(counts) == 1 && Convert.ToInt32(submit)==0)
                    {
                        string sql =
                        "INSERT INTO historyinformation(" +
                        " select information.* from information left join historyinformation  " +
                        " on information.userName=historyinformation.userName and " +
                        "information.datetime=historyinformation.datetime where historyinformation.userName is null and information.datetime = '" + date + "')";
                        MySqlCommand com = new MySqlCommand(sql, conn);
                        com.ExecuteNonQuery();
                        string sqlupdate = "UPDATE historyinformation a " +
                           "INNER JOIN(select b.*from historyinformation a LEFT JOIN information b on a.userName = b.userName and a.datetime = b.datetime) c ON a.userName = c.userName and a.datetime = c.datetime SET a.work_day = c.work_day ,a.logupdate = c.logupdate,a.work_plan = c.work_plan";
                        MySqlCommand coms = new MySqlCommand(sqlupdate, conn);
                        coms.ExecuteNonQuery();
                    }

                }
                conn.Close();
            }
            catch (Exception ee)
            {

                //Log.SaveException(ee);

            }

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        { // Log.SaveNote(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + ":Application End!");  

            //下面的代码是关键，可解决IIS应用程序池自动回收的问题  

            System.Threading.Thread.Sleep(1000);
            //这里设置你的web地址，可以随便指向你的任意一个aspx页面甚至不存在的页面，目的是要激发Application_Start  

            string url = "http://www.shaoqun.com";
            HttpWebRequest myHttpWebRequest = (HttpWebRequest)WebRequest.Create(url);

            HttpWebResponse myHttpWebResponse = (HttpWebResponse)myHttpWebRequest.GetResponse();

            Stream receiveStream = myHttpWebResponse.GetResponseStream();//得到回写的字节流
        }
    }
}