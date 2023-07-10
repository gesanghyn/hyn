using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public class Exceloutput
    {
        public static void OutPutExcel(GridView GridView1,string filename)
        {
            string style = @"<style> .text { mso-number-format:/@;text-align: center; } </script> ";
            HttpContext.Current.Response.Charset = "GB2312"; 
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            HttpContext.Current.Response.Write("<meta http-equiv=Content-Type content=\"text/html; charset=GB2312\">");//出现中文乱码加这句
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" +filename + ".xls");
           
            GridView1.Page.EnableViewState = false;
            //GridView1.AllowPaging = false;
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            GridView1.RenderControl(hw);
            HttpContext.Current.Response.Write(tw.ToString().Replace("\r\n","<br/>"));
            HttpContext.Current.Response.Write(style);

            HttpContext.Current.Response.End();
          
            GridView1.Page.EnableViewState = false;

        }
    }
}