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
    public partial class Leadercontrol : System.Web.UI.Page
    {
        MySqlConnection conn = new MySqlConnection(Class1.str);
        MySqlConnection conns = new MySqlConnection(Class1.str);
        MySqlConnection connm = new MySqlConnection(Class1.str);
        protected void Page_Load(object sender, EventArgs e)
        {
            this.GridView1.Attributes.Add("style", "table-layout:fixed");
            conn.Open();
            conns.Open();
            connm.Open();
            string datetime = DateTime.Now.ToString("yyyy-MM-dd");//选择的日期
            Label1.Text = datetime;
            string sqlm = "select max(datetime) from historyinformation";
            MySqlCommand comm = new MySqlCommand(sqlm, connm);
            MySqlDataReader Drs = comm.ExecuteReader();
            while (Drs.Read())
            {
                string xibie = Drs["max(datetime)"].ToString();
                this.Label1.Text = xibie;
            }
            string sqls = "SELECT distinct historyinformation.userName,historyinformation.work_day,direction.cultivationdirection  FROM historyinformation " +
                "LEFT JOIN direction ON historyinformation.userName=direction.username " +
                "LEFT JOIN userspriority c on historyinformation.userName=c.userName " +
                " where historyinformation.datetime=(select max(datetime) from historyinformation) ORDER BY c.priority asc";
            MySqlCommand com = new MySqlCommand(sqls, conn);
            MySqlDataReader Dr = com.ExecuteReader();
            if (Dr.Read())
            {
                Button1.Visible = true;
                MySqlDataAdapter mAdapter = new MySqlDataAdapter(sqls, conns);
                DataTable dt = new DataTable();
                mAdapter.Fill(dt);
                ////绑定数据到DataGridView1
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            Dr.Close();
            Drs.Close();
            connm.Close();
            conn.Close();   
            conns.Close();  
           
        }




        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
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
                        //让数字以文本形式表示   
                e.Row.Cells[3].Attributes.Add("style", " vnd.ms - excel.numberformat:@; ");


            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            string filename = "研发部工作日志"+Label1.Text.Trim();
            foreach (GridViewRow dg in this.GridView1.Rows)
            {
                dg.Cells[0].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                dg.Cells[2].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                dg.Cells[3].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
            }
            Exceloutput.OutPutExcel(GridView1, filename);
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Log.aspx");
            Session.Contents.RemoveAll();
        }
    }
}