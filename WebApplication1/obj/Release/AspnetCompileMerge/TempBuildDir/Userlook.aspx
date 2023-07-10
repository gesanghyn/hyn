<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Userlook.aspx.cs" Inherits="WebApplication1.Userlook" %>

<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=0.3, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <title></title>
    <style>
        body {
            font-family: 'Overpass', sans-serif;
            font-size: 16px;
            color: #1c1c1c;
            font: normal 20px Verdana, Arial, sans-serif;
        }

        .content {
            width: 550px;
            padding-top: 50px;
            margin-left: 35%;
            text-align: center;
        }

        h1 {
            margin: 0;
            font-weight: 400;
            font-size: 35px;
        }

            h1 span {
                font-family: 'The Girl Next Door', cursive;
                font-weight: 700;
                color: #4caf50;
            }



        .box {
            width: 50px;
            margin-left: 50%;
        }

        h2 {
            margin-top: 40px;
            text-decoration: underline;
        }

        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }
        .content {
            width: auto;
            margin-left: 25%;
        }



        .item {
            height: 35px;
            width: 55px;
            border-bottom: 1px solid #fff;
            margin-bottom: 40px;
            position: relative;
        }

        .textstyle {
            border-radius: 18px;
        }

        .auto-style24 {
            float: left;
            min-height: 100vh;
            width: 1900px;
            background-color: #fff;
        }

        *,
        *:before,
        *:after {
            box-sizing: border-box;
        }


        h3 {
            color: #55d9cb;
        }

        .input-group {
            margin-bottom: 1em;
            zoom: 1;
        }

            .input-group:before,
            .input-group:after {
                content: "";
                display: table;
            }

            .input-group:after {
                clear: both;
            }

        .input-group-icon {
            position: relative;
        }

            .input-group-icon input {
                padding-left: 4.4em;
            }

            .input-group-icon .input-icon {
                position: absolute;
                top: 0;
                left: 0;
                width: 3.4em;
                height: 3.4em;
                line-height: 3.4em;
                text-align: center;
                pointer-events: none;
            }

                .input-group-icon .input-icon:after {
                    position: absolute;
                    top: 0.6em;
                    bottom: 0.6em;
                    left: 3.4em;
                    display: block;
                    border-right: 1px solid #e5e5e5;
                    content: "";
                    -webkit-transition: 0.35s ease-in-out;
                    -moz-transition: 0.35s ease-in-out;
                    -o-transition: 0.35s ease-in-out;
                    transition: 0.35s ease-in-out;
                    transition: all 0.35s ease-in-out;
                }

                .input-group-icon .input-icon i {
                    -webkit-transition: 0.35s ease-in-out;
                    -moz-transition: 0.35s ease-in-out;
                    -o-transition: 0.35s ease-in-out;
                    transition: 0.35s ease-in-out;
                    transition: all 0.35s ease-in-out;
                }





        .row:before,
        .row:after {
            content: "";
            display: table;
        }

        .row:after {
            clear: both;
        }

        .col-half {
            padding-right: 10px;
            float: left;
            width: 50%;
            display: inline-block;
        }

            .col-half:last-of-type {
                padding-right: 0;
            }

        .col-third {
            padding-right: 10px;
            float: left;
            width: 33.33333%;
        }

            .col-third:last-of-type {
                padding-right: 0;
            }

        @media only screen and (max-width: 540px) {
            .col-half {
                width: 100%;
                padding-right: 0;
            }
        }

        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 30px;
        }



        .button1 {
            background-color: white;
            color: black;
            height: 50px;
            margin-left: 100px;
            border: 2px solid #4CAF50;
        }

            .button1:hover {
                background-color: #4CAF50;
                color: white;
            }

        .button2 {
            background-color: white;
            color: black;
            border: 2px solid #008CBA;
        }

            .button2:hover {
                background-color: #008CBA;
                color: white;
            }

        .button3 {
            background-color: white;
            color: black;
            border: 2px solid #FFA500;
        }

            .button3:hover {
                background-color: #FFA500;
                color: white;
            }


        .GridView {
            width: 50%;
            overflow-y: auto;
            float: left;
        }

            .GridView th {
                color: white;
                background-color: #243b55;
                height: 50px;
                font-size: 14px;
                font-weight: bold;
                border-bottom: 1px solid #DCDCDC;
                border-right: 1px solid #DCDCDC;
                text-align: left;
            }

            .GridView tr {
                background-color: whitesmoke;
                height: 25px;
                text-align: center;
                border-bottom: 1px solid #DCDCDC;
                border-right: 1px solid #DCDCDC;
            }

                .GridView tr td {
                    border-bottom: 1px solid #DCDCDC;
                    border-right: 1px solid #DCDCDC;
                    vertical-align: middle;
                }

                    .GridView tr td:nth-child(1) {
                        text-align: center;
                        width:10%;
                        vertical-align: middle;
                    }

                    .GridView tr td:nth-child(2) {
                        text-align: center;
                         width:20%;
                        vertical-align: middle;
                    }

                    .GridView tr td:nth-child(3) {
                        text-align: left;
                         width:70%;
                        vertical-align: middle;
                    }

            .GridView td table {
                background-color: #507CD1;
                text-align: left;
            }

                .GridView td table td {
                    text-align: left;
                }

        .exit {
            border-radius: 30px;
            width: 80px;
            background: linear-gradient(#141e30, #243b55);
            color: white;
        }

            .exit:hover {
                border: 2px solid #4caf50;
            }


        user {
            width: 200px;
        }

        .menu {
            height: 70px;
            width: 60%;
            line-height: 70px;
            font-size: 20px;
            border-radius: 5px;
            font-weight: bold;
        }

        div.menu ul {
            list-style-type: none; /*清除无序列表前的小点*/
            width: 960px;
            height: 70px;
            background: #3b3753;
            margin: 0px;
            text-align: center;
            padding: 0px;
        }

            div.menu ul li {
                float: left;
                width: 120px;
                font-size:18px;
                height: 100%;
                padding: 0px;
                margin-right: 1%; /*两个li之间的距离*/
            }

                div.menu ul li a:link, a:visited { /*鼠标未点击和点击过时的样式*/
                    display: block;
                    color: #FFFFFF;
                    /*background-color: #3b3753;*/
                    text-align: center;
                    /*line-height: 70px;*/ /*li行高*/
                    /*padding: 20px;*/
                    text-decoration: none; /*去下划线*/
                }

                div.menu ul li a:hover { /*鼠标移动到点击位时的样式，active指点击过后的样式*/
                    background-color: #111;
                }

        .liactive {
            background-color: #b83b5e;
        }

        div.menu ul li a:hover { /*鼠标移动到点击位时的样式，active指点击过后的样式*/
            background-color: #111;
        }

        

        .gri {
          /*  float: left;
            width: 1900px;
            height:450px;*/
           /* overflow-y:auto;*/
            background-color: #fff;
        }

        .thcss {
            float: left;
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
            border-bottom: 1px solid Silver;
            border-right: 1px solid Silver;
        }

        .table-thead tr {
            background-color: whitesmoke;
            height: auto;
            width: auto;
            text-align: center;
            border-bottom: 1px solid Silver;
            border-right: 1px solid Silver;
        }

        .title {
            width: 90%;
            height: 100px;
        }

        .left {
            float: left;
            width: 50%;
            height: auto;
        }

        .imgstyle {
            margin-top: 11px;
        }

        .right {
              margin-left: 80%;
            color:#555; 
            font-size:17px;
            width: 30%;
            height: auto;
        }

         .end {
            font-size: 18px;
            margin-top: 7%;
            padding: 0px;
            background: #3b3753;
            border: 1px solid #3b3753;
            color: white;
            font-weight:900;
        }

        .warp {
            white-space: pre-wrap;
            word-wrap: break-word;
            text-align: left;
            height:auto;
        }
        .auto-style28 {
            width: 230px;
            height: 55px;
        }
            .auto-style28:hover {
                border-color:paleturquoise;
            }
          .end:hover {
             background-color: #111;
             height:50px;
        }
           html,
        .page,
        .page__content {
            position: relative;
        }

        .content {
            width: auto;
            margin-left: 15%;
        }
    </style>

</head>
<body>
    <link href="https://fonts.googleapis.com/css?family=Overpass:400,700" rel="stylesheet">
    <link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
    <link href="https://fonts.googleapis.com/css?family=The+Girl+Next+Door" rel="stylesheet">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css'>
    <div class="page" style="margin-left:23%; width: auto; height: auto; margin-top:0px;">
        <form runat="server">
            <div class="title">
                <div class="left">
                    <img src="img/jd.png" class="imgstyle" />
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="Usermain.aspx">当日工作内容</a></li>
                    <li class="liactive"><a href="Userlook.aspx">历史记录</a></li>
                    <li><a href="Userweekplane.aspx">本周工作计划</a></li>
                    <li><a href="Cultivationdirection.aspx">培养方向</a></li>
                    <li><a href="Userpass.aspx">修改密码</a></li>
                     <li style="color:white; width:150px">
                             用户名：<asp:Label ID="Label1" runat="server"></asp:Label>
                    </li>
                    <li class="lablecss">
                             <asp:Button ID="Button2" runat="server" Text="退出" CssClass="end" Width="112px" OnClick="Button2_Click" />
                    </li>
                </ul>
            </div>
            <div class="auto-style24">
                <br />
                <br />
                &nbsp;起&nbsp;&nbsp;&nbsp;
                            <input type="date" name="dateselect" runat="server" id="txtEnteringDate" placeholder="选择日期" style="font-size: 22px" class="auto-style28" />&nbsp;&nbsp;至&nbsp;&nbsp;
                <input type="date" name="dateselectEnd" runat="server" id="txtEnteringDatEnd" placeholder="选择日期" style="font-size: 22px" class="auto-style28" />
                &nbsp;&nbsp;
                            <asp:Button ID="Button1" class="button button2" runat="server" Text="查询历史记录" OnClick="lookhistory" Height="51px" Width="160px" />
                &nbsp;&nbsp;
                            <asp:Button ID="Button4" class="button button3" runat="server" Text="导出Excel" OnClick="Button3_Click" Height="51px" Width="160px" />
                <br />
                <br />
                <br />
                <div class="thcss">
                    <table class="table-thead " runat="server" name="table1" ID="table1" style="width:950px;">
                        <thead>
                            <tr>
                                <th width="95px">序号</th>
                                <th width="191px" >时间</th>
                                <th width="669px">当日工作内容</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <div class="gri">
                    <asp:GridView ID="GridView1" CssClass="GridView" runat="server" Width="948px" AutoGenerateColumns="False" DataKeyNames="userName,datetime" CellPadding="4" ForeColor="black" GridLines="None" OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Center" BorderColor="Silver" BorderStyle="Solid" PageSize="2" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White"  />
                        <Columns>
                            <asp:BoundField HeaderText="序号"></asp:BoundField>
                            <asp:BoundField DataField="datetime" HeaderText="时间" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="work_day" HeaderText="当日工作内容" ReadOnly="True"></asp:BoundField>
                        </Columns>
                        <PagerTemplate>
                                    当前第:
                                     <%--//((GridView)Container.NamingContainer)就是为了得到当前的控件--%>
                                    <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>
                                    页/共:
                                    <%--//得到分页页面的总数--%>
                                    <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                                    页
                                    <%--//如果该分页是首分页，那么该连接就不会显示了.同时对应了自带识别的命令参数CommandArgument--%>
                                    <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                                        Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>'>首页</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                                        CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'>上一页</asp:LinkButton>
                                    <%--//如果该分页是尾页，那么该连接就不会显示了--%>
                                    <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>下一页</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>尾页</asp:LinkButton>
                                     转到第
                <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>'/>
                页
                <asp:Button ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-2" CommandName="Page" Text="Go"/>

                                </PagerTemplate>
                        <HeaderStyle BorderColor="Gainsboro" BorderStyle="solid" Height="60px" />
                        <RowStyle BorderStyle="Solid" BorderColor="Gainsboro" CssClass="warp" />
                    </asp:GridView>
                </div>
            </div>
        </form>
    </div>

</body>
</html>
<script>

    var Date8 = new Date();
    var Date1 = new Date(Date8.getTime() - 168 * 60 * 60 * 1000);
    document.getElementById('txtEnteringDate').valueAsDate = Date1;
    document.getElementById('txtEnteringDatEnd').valueAsDate = new Date();
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



