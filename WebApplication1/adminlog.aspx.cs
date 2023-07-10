using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplication1
{
    public partial class adminlog : System.Web.UI.Page
    {
        MySqlConnection conn = new MySqlConnection(Class1.str);
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            //查找用户名绑定到控件
            string sql = "select distinct userlog.userName from userlog  LEFT JOIN userspriority c on userlog.userName=c.userName" +
                " where identity='员工'  ORDER BY c.priority asc";
            MySqlDataAdapter mAdapter = new MySqlDataAdapter(sql, conn);   //绑定数据到DataGridView1
            DataSet ds = new DataSet();
            mAdapter.Fill(ds);
            if (!IsPostBack)
            {
                DropDownList1.DataSource = ds.Tables[0];
                DropDownList1.DataValueField = "userName";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("所有人", "0")); //动态插入指定序号的新项
            }
            string sqlsingal = " SELECT checkauto FROM `checksingal`";
            MySqlCommand cmd = new MySqlCommand(sqlsingal, conn);
            int count = (int)cmd.ExecuteScalar();//查出标志位,控制是否勾选.1显示，0不显示
            if (count == 1)
            {
                checkauto.Checked = true;
            }
            else
            {
                checkauto.Checked = false;

            }
            conn.Close();


        }
        /// <summary>
        /// 查询今日记录
        /// </summary>
        private void search()
        {
            conn.Open();
            GridView2.Visible = false;

            if (HttpContext.Current.Request.Cookies != null && HttpContext.Current.Request.Cookies["s"] != null)
            {
                string date = HttpUtility.UrlDecode(HttpContext.Current.Request.Cookies["s"].Value.ToString(), Encoding.GetEncoding("UTF-8"));
                //2023-04-27修改，避免显示重复数据
                string sql = "select distinct a.userName,a.datetime,a.work_day ,b.work_plan from information a" +
                    " left JOIN information b ON a.userName = b.userName" +
                    " left JOIN  userspriority c on a.userName = c.userName" +
                     " where  a.datetime= '" + date + " '" +
                     " and b.datetime in (select subdate(curdate(),date_format(curdate(),'%w')-1)) ORDER BY c.priority asc";
                MySqlDataAdapter mAdapter = new MySqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                mAdapter.Fill(dt);
                //绑定数据到DataGridView1
                GridView1.DataSource = dt;
                GridView1.DataBind();
                conn.Close();
            }


        }
        /// <summary>
        /// 查询历史记录
        /// </summary>
        private void searchAll()
        {
            conn.Open();
            GridView2.Visible = false;
            string date = this.txtEnteringDate.Value.ToString();//选择日期
            string dateend = this.txtEnteringDatEnd.Value.ToString();//选择日期
            string usernameselect = DropDownList1.SelectedItem.Text.ToString();
            if (DropDownList1.SelectedItem.Text.Trim() == "所有人")
            {
                usernameselect = " SELECT userName FROM `information`";
            }
            else
            {
                usernameselect = "'" + usernameselect + "'";
            }
            string sql = "select  distinct userName,datetime,work_day ,work_plan   from information where  datetime between '" + date + "'and '" + dateend + "' and userName in ( " + usernameselect + " ) order by datetime desc";
            MySqlDataAdapter mAdapter = new MySqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            mAdapter.Fill(dt);
            //绑定数据到DataGridView1
            GridView1.DataSource = dt;
            GridView1.Columns[5].Visible = false;//隐藏
            conn.Close();
            GridView1.DataBind();

        }
        /// <summary>
        /// 历史记录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button3_Click(object sender, EventArgs e)
        {
            string date = this.txtEnteringDate.Value.ToString();//选择日期
            string dateend = this.txtEnteringDatEnd.Value.ToString();//选择日期
            string usernameselect = DropDownList1.SelectedItem.Text.Trim();
            searchAll();
            if (date != "" && dateend != "")
            {
                HttpCookie datebegin = new HttpCookie("datebegin");
                datebegin.Value = HttpUtility.UrlEncode(date, System.Text.Encoding.GetEncoding("UTF-8"));  //传递开始日期
                HttpCookie datee = new HttpCookie("datee");
                datee.Value = HttpUtility.UrlEncode(dateend, System.Text.Encoding.GetEncoding("UTF-8"));  //传递截至日期
                HttpCookie user = new HttpCookie("usernameselect");
                user.Value = HttpUtility.UrlEncode(usernameselect, System.Text.Encoding.GetEncoding("UTF-8"));  //传递用户名
                Response.Cookies.Add(datebegin);
                Response.Cookies.Add(datee);
                Response.Cookies.Add(user);
            }
        }

        /// <summary>
        /// 查询未交员工
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button4_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
            string date = this.hisdate.Value.ToString();//选择日期
            if (date != "")
            {
                loook(date);
            }

        }

        protected void loook(string date)
        {
            conn.Open();
            string sql = "select distinct userName from userlog where userName not in(" +
                "select userName from information where  datetime='" + date + "') and identity='员工' ";
            MySqlDataAdapter mAdapter = new MySqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            mAdapter.Fill(dt);
            //绑定数据到DataGridView1
            GridView2.DataSource = dt;
            GridView2.DataBind();
            conn.Close();
        }


        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.Visible = true;
            GridView1.EditIndex = -1;
            search();
        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.Visible = true;
            GridView1.EditIndex = e.NewEditIndex;//编辑行的索引为当前行
            search();
        }

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            GridView1.Visible = true;
            conn.Open();
            GridView1.DataKeyNames = new string[] { "datetime", "userName" };
            string sql = "update information set work_day='{0}',work_plan='{1}' where userName='{2}' and datetime='{3}'";
            string work_day = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
            string work_plan = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
            string datetime = GridView1.DataKeys[e.RowIndex]["datetime"].ToString().Trim();
            string userName = GridView1.DataKeys[e.RowIndex]["userName"].ToString().Trim();
            sql = string.Format(sql, work_day, work_plan, userName, datetime);
            MySqlCommand com = new MySqlCommand(sql, conn);
            com.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            conn.Close();
            search();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string sjs = "GetResultFromServer();";
            ScriptManager.RegisterClientScriptBlock(this.GridView1, this.GetType(), "", sjs, true);
            GridView1.Visible = true;
            if ((e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate)) || (e.Row.RowState == DataControlRowState.Edit))
            {

                TextBox txt1 = e.Row.Cells[3].Controls[0] as TextBox; //还应设置换行
                txt1.Width = 500;
                txt1.TextMode = TextBoxMode.MultiLine;
                txt1.BorderColor = System.Drawing.Color.LightGreen;
                txt1.Height = 150;
                txt1.Font.Size = FontUnit.XLarge;
                TextBox txt2 = e.Row.Cells[4].Controls[0] as TextBox;
                txt2.Width = 500;
                txt2.Height = 150;
                txt2.Font.Size = FontUnit.XLarge;
                txt2.BorderColor = System.Drawing.Color.LightGreen;
                txt2.TextMode = TextBoxMode.MultiLine;

            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='lightblue'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                //设置悬浮鼠标指针形状为"小手"
                e.Row.Attributes["style"] = "Cursor:hand";
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='lightblue'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                //设置悬浮鼠标指针形状为"小手"
                e.Row.Attributes["style"] = "Cursor:hand";

            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies != null && HttpContext.Current.Request.Cookies["s"] != null)
            {
                //string date = System.Web.HttpUtility.UrlDecode(Request.Cookies["date"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                string date = HttpUtility.UrlDecode(HttpContext.Current.Request.Cookies["s"].Value.ToString(), Encoding.GetEncoding("UTF-8"));

                string filename = "研发部员工原始日志记录" + date;
                GridView1.Columns[5].Visible = false;//隐藏
                foreach (GridViewRow dg in this.GridView1.Rows)
                {
                    dg.Cells[0].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                    dg.Cells[2].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                    dg.Cells[3].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                    dg.Cells[4].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                }
                Exceloutput.OutPutExcel(GridView1, filename);
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {

            if (null != Request.Cookies["dateselect"])
            {
                string date = System.Web.HttpUtility.UrlDecode(Request.Cookies["dateselect"].Value, System.Text.Encoding.GetEncoding("UTF-8"));

                string filename = "研发部未交日志名单" + date;
                foreach (GridViewRow dg in this.GridView2.Rows)
                {
                    dg.Cells[0].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                }
                Exceloutput.OutPutExcel(GridView2, filename);
            }

        }

        /// <summary>
        /// 查看日志，插入并更新
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Columns[5].Visible = true;//隐藏
            GridView2.Visible = false;
            string dateselect = this.hisdate.Value.Trim();//选择日期
            HttpCookie cookie = HttpContext.Current.Request.Cookies["s"];
            if (cookie == null)
            {
                cookie = new HttpCookie("s");
            }
            cookie.Value = HttpUtility.UrlEncode(dateselect, Encoding.GetEncoding("UTF-8"));
            HttpContext.Current.Response.AppendCookie(cookie);
            //HttpCookie cookie = new HttpCookie("date");
            //cookie.Value = HttpUtility.UrlEncode(dateselect, System.Text.Encoding.GetEncoding("UTF-8"));  //传递日期
            //Response.Cookies.Add(cookie);
            if (dateselect != "")
            {
                search();
            }

        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {


        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();
                //当鼠标停留时更改背景色
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='lightblue'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                //设置悬浮鼠标指针形状为"小手"
                e.Row.Attributes["style"] = "Cursor:hand";
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (null != Request.Cookies["datebegin"] && null != Request.Cookies["datee"] && null != Request.Cookies["usernameselect"])
            {
                string datebegin = System.Web.HttpUtility.UrlDecode(Request.Cookies["datebegin"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                string datee = System.Web.HttpUtility.UrlDecode(Request.Cookies["datee"].Value, System.Text.Encoding.GetEncoding("UTF-8"));

                string usernameselect = System.Web.HttpUtility.UrlDecode(Request.Cookies["usernameselect"].Value, System.Text.Encoding.GetEncoding("UTF-8"));

                string filename = usernameselect + "-" + datebegin + "-" + datee + "历史记录";
                foreach (GridViewRow dg in this.GridView1.Rows)
                {
                    dg.Cells[0].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                    dg.Cells[2].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                    dg.Cells[3].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                    dg.Cells[4].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                }
                Exceloutput.OutPutExcel(GridView1, filename);

            }
        }


        /// <summary>
        /// 员工提交的日志信息，初始日志
        /// </summary>
        /// <param name="sender"></param>TRUE
        /// <param name="e"></param>
        protected void Button10_Click(object sender, EventArgs e)
        {
            conn.Open();
            GridView2.Visible = false;
            string date = this.hisdate.Value.ToString();//选择日期
            string sql = " select * from information  LEFT JOIN  userspriority c on information.userName=c.userName" +
                " where datetime='" + date + "'ORDER BY c.priority asc ";
            MySqlDataAdapter mAdapter = new MySqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            mAdapter.Fill(dt);
            //绑定数据到DataGridView1
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (date != "")
            {
                HttpCookie cookie = new HttpCookie("date");
                cookie.Value = HttpUtility.UrlEncode(date, System.Text.Encoding.GetEncoding("UTF-8"));  //传递日期
                Response.Cookies.Add(cookie);
            }
            conn.Close();
        }
        /// <summary>
        /// 提交日志，提交到historyinformation,插入并更新
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button11_Click(object sender, EventArgs e)
        {
            put();
        }

        public void put()
        {
            conn.Open();
            GridView2.Visible = false;
            if (HttpContext.Current.Request.Cookies != null && HttpContext.Current.Request.Cookies["s"] != null)
            {
                //string date = System.Web.HttpUtility.UrlDecode(Request.Cookies["date"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                string date = HttpUtility.UrlDecode(HttpContext.Current.Request.Cookies["s"].Value.ToString(), Encoding.GetEncoding("UTF-8"));
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
                conn.Close();
                searchhistory();
            }
            Response.Write("<script>alert('提交成功!')</script>");
        }
        /// <summary>
        /// 查询提交到historyinformation信息
        /// </summary>
        private void searchhistory()
        {
            conn.Open();
            GridView2.Visible = false;
            GridView1.Visible = true;
            if (HttpContext.Current.Request.Cookies != null && HttpContext.Current.Request.Cookies["s"] != null)
            {
                //string date = System.Web.HttpUtility.UrlDecode(Request.Cookies["date"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                string date = HttpUtility.UrlDecode(HttpContext.Current.Request.Cookies["s"].Value.ToString(), Encoding.GetEncoding("UTF-8"));
                string sql = "select * from historyinformation LEFT JOIN  userspriority c on historyinformation.userName=c.userName  " +
                    "where datetime='" + date + " ' ORDER BY c.priority asc";
                MySqlDataAdapter mAdapter = new MySqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                mAdapter.Fill(dt);
                //绑定数据到DataGridView1
                GridView1.Columns[5].Visible = false;//隐藏
                GridView1.DataSource = dt;
                GridView1.DataBind();
                conn.Close();
            }

        }

        protected void Button6_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Log.aspx");
            Session.Contents.RemoveAll();

        }

        protected void checkauto_CheckedChanged(object sender, EventArgs e)
        {
            //选中状态变为未选中状态
            if (checkauto.Checked == true)
            {
                conn.Open();
                string Subuser_Count = "UPDATE checksingal SET checkauto=0 where checkauto=1";
                MySqlCommand cmd = new MySqlCommand(Subuser_Count, conn);
                cmd.ExecuteScalar();//查出今日提交的日志总数
                conn.Close();
                checkauto.Checked = false;
            }
            else //未选中状态变为选中状态
            {
                conn.Open();
                string Subuser_Count = "UPDATE checksingal SET checkauto=1  where checkauto=0";
                MySqlCommand cmd = new MySqlCommand(Subuser_Count, conn);
                cmd.ExecuteScalar();//查出今日提交的日志总数
                conn.Close();
                checkauto.Checked = true;
            }
        }

        //修改时间
        protected void Button2_Click(object sender, EventArgs e)
        {
            conn.Open();
            string hour = TextBox1.Text;
            string minute = TextBox2.Text;
            string sqltimeupdate = "UPDATE checksingal SET hourset= " + hour + ", Minuteset= " + minute + " where id=1 ";
            MySqlCommand cmd = new MySqlCommand(sqltimeupdate, conn);
            cmd.ExecuteScalar();//查出今日提交的日志总数
            conn.Close();
        }
        protected void TextBox2_Init(object sender, EventArgs e)
        {
            conn.Open();
            string sqlMinute = " SELECT Minuteset FROM `checksingal`where id=1;";
            MySqlCommand cmdMinute = new MySqlCommand(sqlMinute, conn);
            object Minute = cmdMinute.ExecuteScalar();//查出标志位,控制是否勾选.1显示，0不显示
            TextBox2.Text = Minute.ToString().PadLeft(2, '0');
            conn.Close();

        }
        protected void TextBox1_Init(object sender, EventArgs e)
        {
            conn.Open();
            string sqlhour = " SELECT hourset FROM `checksingal` where id=1;";
            MySqlCommand cmdhour = new MySqlCommand(sqlhour, conn);
            object hour = cmdhour.ExecuteScalar();//查出标志位,控制是否勾选.1显示，0不显示
            TextBox1.Text= hour.ToString().PadLeft(2, '0');
            conn.Close();
           
        }
    }
}