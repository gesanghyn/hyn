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
    public partial class admindirection : System.Web.UI.Page
    {
        MySqlConnection conn = new MySqlConnection(Class1.str);
        protected void Page_Load(object sender, EventArgs e)
        {
            this.GridView1.Attributes.Add("style", "table-layout:fixed");
            conn.Open();
            if (!IsPostBack)
            {
                string sql = "select distinct * from Direction ";
                MySqlDataAdapter mAdapter = new MySqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                mAdapter.Fill(dt);
                //绑定数据到DataGridView1
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            conn.Close();
        }
        private void search()
        {
            conn.Open();
            string sql = "select * from Direction ";
            MySqlDataAdapter mAdapter = new MySqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            mAdapter.Fill(dt);
            //绑定数据到DataGridView1
            GridView1.DataSource = dt;
            conn.Close();
            GridView1.DataBind();
        }
       
        protected void Button1_Click(object sender, EventArgs e)
        {
            string filename = "研发部员工培养方向表";
            GridView1.Columns[4].Visible = false;//隐藏
            GridView1.Columns[5].Visible = false;//隐藏
            foreach (GridViewRow dg in this.GridView1.Rows)
            {
                dg.Cells[0].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                dg.Cells[2].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
                dg.Cells[3].Attributes.Add("style", "vnd.ms-excel.numberformat: @;");
            }
            Exceloutput.OutPutExcel(GridView1,filename);
        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {


        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            search();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            conn.Open();
            string sql = "delete from Direction where username='{0}'";
            string userName = GridView1.DataKeys[e.RowIndex]["username"].ToString().Trim();
            sql = string.Format(sql, userName);
            MySqlCommand com = new MySqlCommand(sql, conn);
            com.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            conn.Close();
            search();
        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;//编辑行的索引为当前行
            search();
        }

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            conn.Open();
            string sql = "update Direction set cultivationdirection='{0}',task='{1}' where username='{2}'";
            string cultivationdirection = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
            string task = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
            string username = GridView1.DataKeys[e.RowIndex]["username"].ToString().Trim();
            sql = string.Format(sql, cultivationdirection, task, username);
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
            if ((e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate)) || (e.Row.RowState == DataControlRowState.Edit))
            {

                TextBox txt1 = e.Row.Cells[2].Controls[0] as TextBox; //还应设置换行
                txt1.Width = 504;
                txt1.Height = 150;
                txt1.BorderColor = System.Drawing.Color.LightGreen;
                txt1.TextMode = TextBoxMode.MultiLine;
                txt1.Font.Size = FontUnit.XLarge;
                TextBox txt2 = e.Row.Cells[3].Controls[0] as TextBox;
                txt2.Width =504;
                txt2.Height = 150;
                txt2.TextMode = TextBoxMode.MultiLine;
                txt2.BorderColor = System.Drawing.Color.LightGreen;
                txt2.Font.Size = FontUnit.XLarge;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    LinkButton link_delete = (LinkButton)e.Row.Cells[5].Controls[0];
                    link_delete.OnClientClick = "return confirm('您真要删除分类名称为:" + e.Row.Cells[1].Text + "的记录吗？');";
                }
                catch
                {
                }
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

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Log.aspx");
            HttpCookie ck2 = Request.Cookies["userName"];
            ck2.Expires = DateTime.MinValue;
            Response.Cookies["userName"].Expires = DateTime.MinValue;


        }
    }
}