<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Leadercontrol.aspx.cs" Inherits="WebApplication1.Leadercontrol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta name="viewport" content="width=device-width, initial-scale=0.3, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <title></title>
    <style>
        body {
            width: auto;
            height: 700px;
        }

        h1 {
            margin-top: 10px;
        }

        .auto-style1 {
            height: 700px;
            width: 1800px;
           margin-left: 20%;
            overflow-y: auto;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 25%;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            overflow: auto;
        }

        li a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
        }

            li a.active {
                background-color: #4CAF50;
                color: white;
            }

            li a:hover:not(.active) {
                background-color: #555;
                color: white;
            }

        .GridView {
            width: 70%;
            float:left;
        }

            .GridView th {
                color: white;
                background-color: #243b55;
                height: 50px;
                font-size: 14px;
                font-weight: bold;
            }

            .GridView tr {
                background-color: whitesmoke;
                height: 25px;
               /* text-align: center;*/
               font-size:18px;
            }

                .GridView tr td:nth-child(1) {
                    text-align: center;
                    width:10%;
                    vertical-align: middle;
                }
                .GridView tr td:nth-child(2) {
                    text-align: center;
                    width:10%;
                    vertical-align: middle;
                }

                .GridView tr td :nth-child(3) {
                    text-align: left;
                    width:70%;
                    vertical-align: middle;
                }
                .GridView tr td :nth-child(4) {
                    text-align: left;
                    width:70%;
                    vertical-align: middle;
                }

            .GridView td table {
                background-color: #507CD1;
                text-align: center;
            }

                .GridView td table td {
                    text-align: center;
                    vertical-align: middle;
                }

        .btn {
            border: 2px solid #FFA500;
            color: black;
            background-color:white;
            Width: 100px;
            height:60px;
            margin-left: 8%;
            border-radius: 30px;
        }

            .btn:hover {
                background: #FFA500;
                color: white;
            }

        .thcss {
            float: left;
            margin-left: 20%;
            width: 1800px;
            height: 50px;
        }

        .table-thead th {
            color: white;
            background-color: #243b55;
            height: 50px;
            position: relative;
            font-size: 14px;
            font-weight: bold;
            border-bottom: 1px solid #DCDCDC;
            border-right: 1px solid #DCDCDC;
        }

        .table-thead tr {
            background-color: whitesmoke;
            height: auto;
            width: auto;
            text-align: center;
            border-bottom: 1px solid #DCDCDC;
            border-right: 1px solid #DCDCDC;
        }
         .title {
            width:1470px;
            height:100px;
            margin-left:20%;
        }

.left {
            float:left;
             width: 25%;
            height: auto;
         
        }

.imgstyle {
            margin-top: 11px;
        }

.right {
            float:left;
             width: 20%;
            height: 50px;
            margin-top:1%;
         
        }

  .end {
            margin-left: 85%;
            float:right;
            margin-top:7%;
            background-color:white;
            color: #19667d;
            border: 1px solid #19667d;
            height:40px;
        }
.end:hover {
            margin-left: 85%;
            width: 30px;
            float:right;
            margin-top:7%;
            color: #19667d;
            background: #70c9e3; /* Old browsers */
            background: -moz-linear-gradient(top, #70c9e3 0%, #39a0be 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#70c9e3), color-stop(100%,#39a0be)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, #70c9e3 0%,#39a0be 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, #70c9e3 0%,#39a0be 100%); /* Opera 11.10+ */
            background: linear-gradient(top, #70c9e3 0%,#39a0be 100%); /* W3C */
        }
        .center {
            width:40%;
            margin-top:1%;
            float:left;
            margin-left:5%;
        }
        .warp {
            white-space:pre-wrap;  
            word-wrap: break-word;  
            height:auto;
        }
    </style>
</head>
<body style="height: 673px; width: 1420px;">
    <form runat="server">
          <div class="title" >
                <div class="left">
                <img src="img/jd.png" class="imgstyle" />
                    </div>
              <div class="center"><h1 style="color:#555" >研发部工作日志—<asp:Label ID="Label1" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label></h1>
           </div>
                <div class="right">
                <asp:Button ID="Button2" runat="server" Text="退出" CssClass="end" Width="112px" OnClick="Button2_Click"  />
                    </div>
            </div>
        <div>
            
            <p style="margin-left: 15%;">
                <asp:Button ID="Button1" CssClass="btn" runat="server" Text="导出Excel" Height="34px" OnClick="Button1_Click" />
            </p>
        </div>
        <div class="thcss">
            <table class="table-thead " style="width: 74.5%">
                <thead>
                    <tr>
                        <th width="143px" >序号</th>
                        <th width="142px ">用户名</th>
                        <th width="529.9px">当日工作内容</th>
                        <th width="529.5px">近期主要任务</th>
                    </tr>
                </thead>
            </table>
        </div>
        <div runat="server" id="div1" class="auto-style1">
            <asp:GridView ID="GridView1" CssClass="GridView" runat="server" Width="75%" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" PageSize="3" OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="序号"></asp:BoundField>
                    <asp:BoundField HeaderText="用户名" DataField="userName" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="work_day"  ReadOnly="True" HeaderText="当日工作内容"  ><ItemStyle CssClass="workdaystyle" /></asp:BoundField>
                     <asp:BoundField DataField="cultivationdirection"  ReadOnly="True" HeaderText="近期主要任务" ></asp:BoundField>
                </Columns>
                <HeaderStyle BorderColor="Gainsboro" BorderStyle="solid" Height="50px" Font-Bold="True"  />
                <RowStyle BorderStyle="Solid"  CssClass="warp" BorderColor="Gainsboro"  />
            </asp:GridView>

        </div>
    </form>
</body>
</html>
<script>
    function s() {
        var t = document.getElementById("GridView1"); //（下面Gridview的id）
        var t2 = t.cloneNode(true)
        for (i = t2.rows.length - 1; i > 0; i--)
            t2.deleteRow(i)
        t.deleteRow(0)
        a.appendChild(t2)
    }
    window.onload = s
</script>
