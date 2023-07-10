using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class historylook : System.Web.UI.Page
    {
        MySqlConnection conn = new MySqlConnection(Class1.str);

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

            this.GridView1.Attributes.Add("style", "table-layout:fixed");

        }
        public void Bind()
        {
            Button4.Visible = true;
            if (null != Request.Cookies["userName"] && null != Request.Cookies["datebegin"] && null != Request.Cookies["datee"])
            {
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                string datebegin = System.Web.HttpUtility.UrlDecode(Request.Cookies["datebegin"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                string datee = System.Web.HttpUtility.UrlDecode(Request.Cookies["datee"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                conn.Open();
                string sql = "select DISTINCT * from information where userName='" + username + "' and datetime >= '" + datebegin + "'and datetime <='" + datee + "'order by datetime desc";
                MySqlDataAdapter mAdapter = new MySqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                mAdapter.Fill(dt);
                //绑定数据到DataGridView1
                GridView1.DataSource = dt;
                conn.Close();
                GridView1.DataBind();


            }


        }



        protected void Button3_Click(object sender, EventArgs e)
        {
            if (this.GridView1.Rows.Count != 0)
            {
                GridView1.AllowPaging = false;
                GridView1.BottomPagerRow.Visible = false;//导出到Excel表后，隐藏分页部分
                Bind();
                if (null != Request.Cookies["userName"])
                {
                    string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));

                    string filename = username + "日志";
                    foreach (GridViewRow dg in this.GridView1.Rows)
                    {
                        dg.Cells[0].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                        dg.Cells[1].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                        dg.Cells[2].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                    }
                    Exceloutput.OutPutExcel(GridView1, filename);


                }


            }
            }
            protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                //GridView1.PageIndex = e.NewPageIndex;
                GridView theGrid = sender as GridView;
                int newPageIndex = 0;
                if (e.NewPageIndex == -3)
                {
                    //点击了go按钮
                    TextBox txtNewPageIndex = null;

                    //GridView较DataGrid提供了更多的API，获取分页块可以使用BottomPagerRow 或者TopPagerRow，当然还增加了HeaderRow和FooterRow
                    GridViewRow pagerRow = theGrid.BottomPagerRow;

                    if (pagerRow != null)
                    {
                        //得到text控件
                        txtNewPageIndex = pagerRow.FindControl("txtNewPageIndex") as TextBox;
                    }
                    if (txtNewPageIndex != null)
                    {
                        //得到索引
                        newPageIndex = int.Parse(txtNewPageIndex.Text) - 1;
                    }
                }
                else
                {
                    //点击了其他的按钮
                    newPageIndex = e.NewPageIndex;
                }
                //防止新索引溢出
                newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
                newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;

                //得到新的值
                theGrid.PageIndex = newPageIndex;
                Bind();


            
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {


        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Log.aspx");
            HttpCookie ck2 = Request.Cookies["userName"];
            ck2.Expires = DateTime.MinValue;
            Response.Cookies["userName"].Expires = DateTime.MinValue;
        }

        protected void lookhistory(object sender, EventArgs e)
        {
            Button4.Visible = true;
            if (null != Request.Cookies["userName"])
            {
                string username = System.Web.HttpUtility.UrlDecode(Request.Cookies["userName"].Value, System.Text.Encoding.GetEncoding("UTF-8"));
                //string date = Request["dateselect"].ToString();
                //string dateend = Request["dateselectEnd"].ToString();
                string date = this.txtEnteringDate.Value.ToString();//选择日期
                string dateend = this.txtEnteringDatEnd.Value.ToString();//选择日期
                if (username != null) //username为空不执行
                {
                    conn.Open();
                    string sql = "select  distinct userName,datetime,work_day ,work_plan  from information where userName='" + username + "' and datetime >= '" + date + "'and datetime <='" + dateend + "'order by datetime desc";
                    MySqlDataAdapter mAdapter = new MySqlDataAdapter(sql, conn);
                    DataTable dt = new DataTable();
                    mAdapter.Fill(dt);
                    //绑定数据到DataGridView1
                    GridView1.DataSource = dt;
                    conn.Close();
                    GridView1.DataBind();
                }
                if (date != "" && dateend != "")
                {
                    HttpCookie datebegin = new HttpCookie("datebegin");
                    datebegin.Value = HttpUtility.UrlEncode(date, System.Text.Encoding.GetEncoding("UTF-8"));  //传递开始日期
                    HttpCookie datee = new HttpCookie("datee");
                    datee.Value = HttpUtility.UrlEncode(dateend, System.Text.Encoding.GetEncoding("UTF-8"));  //传递截至日期
                    Response.Cookies.Add(datebegin);
                    Response.Cookies.Add(datee);
                }
            }

        }
    }
}