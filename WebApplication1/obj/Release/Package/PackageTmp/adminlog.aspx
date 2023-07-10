<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="adminlog.aspx.cs" Inherits="WebApplication1.adminlog" %>


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
            height: 100%;
            width: 100%;
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

        .submenu {
            display: flex;
            justify-content: center;
            margin: 10px auto 0;
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


        .page,
        .page__content {
            float: left;
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

        *,
        *:before,
        *:after {
            box-sizing: border-box;
        }


        h3 {
            color: #55d9cb;
            margin-left: 100%
        }

        input,
        input[type="radio"] + label,
        input[type="checkbox"] + label:before,
        select option,
        select {
            width: 100%;
            padding: 1em;
            line-height: 1.4;
            background-color: #f9f9f9;
            border: 1px solid #e5e5e5;
            border-radius: 3px;
            -webkit-transition: 0.35s ease-in-out;
            -moz-transition: 0.35s ease-in-out;
            -o-transition: 0.35s ease-in-out;
            transition: 0.35s ease-in-out;
            transition: all 0.35s ease-in-out;
        }

            input:focus {
                outline: 0;
                border-color: #28d3c1;
            }

                input:focus + .input-icon i {
                    color: #55d9cb;
                }

                input:focus + .input-icon:after {
                    border-right-color: #55d9cb;
                }

            input[type="radio"] {
                display: none;
            }

                input[type="radio"] + label,
                select {
                    display: inline-block;
                    width: 50%;
                    text-align: center;
                    float: left;
                    border-radius: 0;
                }

                    input[type="radio"] + label:first-of-type {
                        border-top-left-radius: 3px;
                        border-bottom-left-radius: 3px;
                    }

                    input[type="radio"] + label:last-of-type {
                        border-top-right-radius: 3px;
                        border-bottom-right-radius: 3px;
                    }

                    input[type="radio"] + label i {
                        padding-right: 0.4em;
                    }

                    input[type="radio"]:checked + label,
                    input:checked + label:before,
                    select:focus,
                    select:active {
                        background-color: #55d9cb;
                        color: #fff;
                        border-color: #28d3c1;
                    }

            input[type="checkbox"] {
                display: none;
            }

                input[type="checkbox"] + label {
                    position: relative;
                    display: block;
                    padding-left: 1.6em;
                }

                    input[type="checkbox"] + label:before {
                        position: absolute;
                        top: 0.2em;
                        left: 0;
                        display: block;
                        width: 1em;
                        height: 1em;
                        padding: 0;
                        content: "";
                    }

                    input[type="checkbox"] + label:after {
                        position: absolute;
                        top: 0.45em;
                        left: 0.2em;
                        font-size: 0.8em;
                        color: #fff;
                        opacity: 0;
                        font-family: FontAwesome;
                        content: "\f00c";
                    }

            input:checked + label:after {
                opacity: 1;
            }

        select {
            height: 3.4em;
            line-height: 2;
            width: 100%;
        }

            select:first-of-type {
                border-top-left-radius: 3px;
                border-bottom-left-radius: 3px;
            }

            select:last-of-type {
                border-top-right-radius: 3px;
                border-bottom-right-radius: 3px;
            }

            select:focus,
            select:active {
                outline: 0;
            }

            select option {
                background-color: #55d9cb;
                color: #fff;
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
            text-align: left;
            text-decoration: none;
            display: inline-block;
            font-size: 10px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .button1 {
            background-color: white;
            color: black;
            height: 50px;
            margin-left: 10px;
            border: 2px solid #4CAF50;
            border-radius: 6px;
            margin-bottom: 1%;
        }

            .button1:hover {
                background-color: #4CAF50;
                color: white;
            }
             .buttonstyle {
            background-color: white;
            color: black;
            height: 50px;
            border: 2px solid #0099FF;
            border-radius: 6px;
        }

            .buttonstyle:hover {
                background-color: #0066CC;
                color: white;
            }

        .button2 {
            background-color: white;
            color: black;
            border: 2px solid #008CBA;
            border-radius: 6px;
        }

            .button2:hover {
                background-color: #008CBA;
                color: white;
            }

        .button3 {
            background-color: white;
            color: black;
            margin-top: 3%;
            border: 2px solid #832161;
            border-radius: 6px;
        }

            .button3:hover {
                background-color: #832161;
                color: white;
            }

        .button4 {
            background-color: white;
            color: black;
            border-radius: 6px;
        }

            .button4:hover {
                background-color: #008CBA;
                color: white;
            }

        .button5 {
            background-color: white;
            color: black;
            border: 2px solid #D72638;
            border-radius: 6px;
        }

            .button5:hover {
                background-color: #D72638;
                color: white;
            }

        .table {
            margin-left: 20%;
            font-size: 15px;
        }

        .GridView {
            width: 90%;
        }

            .GridView th {
                color: white;
                background-color: #243b55;
                height: 30px;
                text-align: center;
                font-size: 14px;
                font-weight: bold;
                border: 1px solid #DCDCDC;
                /*     border-right: 1px solid #DCDCDC;*/
            }

            .GridView tr {
                background-color: whitesmoke;
                text-align: center;
                border: 1px solid #DCDCDC;
                border-bottom: 1px solid Gainsboro;
                border-right: 1px solid Gainsboro;
            }

                .GridView tr td {
                    border: 1px solid #DCDCDC;
                    vertical-align: middle;
                }

                    .GridView tr td:nth-child(1) {
                        text-align: center;
                        width: 7%;
                        font-size: 20px;
                        vertical-align: middle;
                    }

                    .GridView tr td:nth-child(2) {
                        text-align: center;
                        font-size: 20px;
                        width: 7%;
                        vertical-align: middle;
                    }

                    .GridView tr td:nth-child(3) {
                        text-align: center;
                        font-size: 20px;
                        width: 9%;
                        vertical-align: middle;
                    }

                    .GridView tr td:nth-child(4) {
                        text-align: left;
                        font-size: 19px;
                        width: 30%;
                        vertical-align: middle;
                    }

                    .GridView tr td:nth-child(5) {
                        text-align: left;
                        font-size: 19px;
                        width: 30%;
                        vertical-align: middle;
                    }

                    .GridView tr td:nth-child(6) {
                        text-align: center;
                        width: 7%;
                        vertical-align: middle;
                    }

            .GridView td table {
                background-color: #507CD1;
                text-align: left;
                border: 1px solid #DCDCDC;
            }

            .GridView td tr {
                border: 1px solid #DCDCDC;
            }

            .GridView td table td {
                text-align: left;
                vertical-align: middle;
            }

        .GridView2 {
            width: 90%;
        }

            .GridView2 th {
                color: white;
                background-color: #243b55;
                height: 50px;
                font-size: 14px;
                font-weight: bold;
                text-align: center;
                border-bottom: 1px solid #DCDCDC;
                border-right: 1px solid #DCDCDC;
            }

            .GridView2 tr {
                background-color: whitesmoke;
                text-align: center;
                border-bottom: 1px solid Gainsboro;
                border-right: 1px solid Gainsboro;
            }

                .GridView2 tr td {
                    text-align: center;
                    border-bottom: 1px solid Gainsboro;
                    border-right: 1px solid Gainsboro;
                    vertical-align: middle;
                }

            .GridView2 td table {
                background-color: #507CD1;
                text-align: center;
                border-bottom: 1px solid Gainsboro;
                border-right: 1px solid Gainsboro;
            }

                .GridView2 td table td {
                    text-align: center;
                    vertical-align: middle;
                }

        .table {
            float: left;
            font-size: 15px;
        }

        .auto-style1 {
            float: left;
            min-height: 100vh;
            width: 1900px;
            background-color: #fff;
        }

        .bt3 {
            border: 2px solid #FFA500;
            color: black;
            border-radius: 30px;
            width: 50px;
            margin-left: 10%;
        }

            .bt3:hover {
                background-color: orange;
                color: white;
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

        .select {
            height: 310px;
            width: 1800px;
            margin-bottom: 71px;
        }

        .dates {
            width: 9.5%;
        }

        .auto-style2 {
            font-size: 15px;
            float: left;
            height: 500px;
            width: 74%;
            overflow-y: scroll;
            margin-left: 0%;
            overflow-y: auto;
        }

        .auto-style3 {
            height: 132px;
            width: 1800px;
            margin-bottom: 30px;
            float: left;
        }

        .menu {
            height: 70px;
            line-height: 70px;
            font-size: 20px;
            border-radius: 5px;
            font-weight: bold;
        }

        div.menu ul {
            list-style-type: none; /*清除无序列表前的小点*/
            width: 1400px;
            height: 70px;
            background: #3b3753;
            margin: 0px;
            text-align: center;
            padding: 0px;
        }

            div.menu ul li {
                float: left;
                width: 466px;
                height: 100%;
                padding: 0px;
                /*margin-left:2%;
                margin-right: 4%;*/ /*两个li之间的距离*/
            }


                div.menu ul li a:link, a:visited { /*鼠标未点击和点击过时的样式*/
                    display: block;
                    color: #FFFFFF;
                    text-align: center;
                    /*line-height: 70px;*/ /*li行高*/
                    /*padding: 20px;*/
                    text-decoration: none; /*去下划线*/
                }

        .liactive {
            background-color: #b83b5e;
        }

        div.menu ul li a:hover { /*鼠标移动到点击位时的样式，active指点击过后的样式*/
            background-color: #111;
        }

        .tips {
            font-size: 15px;
            color: red;
            font-style: italic
        }

        .title {
            width: 1400px;
            height: 100px;
            margin-top: 9px;
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
            float: right;
            width: 50%;
            height: 40px;
        }

        .end {
            margin-left: 85%;
            width: 30px;
            float: right;
            margin-top: 7%;
            color: #19667d;
            border: 1px solid #19667d;
        }

            .end:hover {
                margin-left: 85%;
                width: 30px;
                float: right;
                margin-top: 7%;
                color: #19667d;
                background: #70c9e3; /* Old browsers */
                background: -moz-linear-gradient(top, #70c9e3 0%, #39a0be 100%); /* FF3.6+ */
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#70c9e3), color-stop(100%,#39a0be)); /* Chrome,Safari4+ */
                background: -webkit-linear-gradient(top, #70c9e3 0%,#39a0be 100%); /* Chrome10+,Safari5.1+ */
                background: -o-linear-gradient(top, #70c9e3 0%,#39a0be 100%); /* Opera 11.10+ */
                background: linear-gradient(top, #70c9e3 0%,#39a0be 100%); /* W3C */
            }

        .warp {
            white-space: pre-wrap;
            word-wrap: break-word;
            height: auto;
        }
    </style>

</head>
<body>
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Raleway'>
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <div class="page" style="margin-left: 10%; width: 600px;">
        <form runat="server">
            <asp:HiddenField ID="dvscrollX" runat="server" />
            <asp:HiddenField ID="dvscrollY" runat="server" />
            <div class="title">
                <div class="left">
                    <img src="img/jd.png" class="imgstyle" />
                </div>
                <div class="right">
                    <asp:Button ID="Button6" runat="server" Text="退出" CssClass="end" Width="112px" OnClick="Button6_Click1" />
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li id="todayLog"><a href="adminlog.aspx" class="liactive">日志管理</a></li>
                    <li><a href="admincontrol.aspx">员工管理</a></li>
                    <li><a href="admindirection.aspx">培养目标管理</a></li>
                </ul>
            </div>
            <div class="auto-style1">
                <div class="containers">
                    <div class="auto-style3">
                        <br />
                        <asp:Label ID="Label1" runat="server" CssClass="tips">
                         <br />
                        </asp:Label><asp:CheckBox runat="server" Text="自动提交日志 时间：" ID="checkauto" OnCheckedChanged="checkauto_CheckedChanged" AutoPostBack="True" ForeColor="#FF3300" Width="160px"></asp:CheckBox>
                        <asp:TextBox ID="TextBox1" runat="server" Width="60px" Height="1px" OnInit="TextBox1_Init" ForeColor="Red"></asp:TextBox>&nbsp;&nbsp;：
                        <asp:TextBox ID="TextBox2" runat="server" Width="60px" Height="1px" OnInit="TextBox2_Init" ForeColor="Red"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="修改时间" class="buttonstyle" Width="85px" Height="42px" OnClick="Button2_Click" />
                        <br /> <br />
                        <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="16px" Height="60px" Width="170px">
                            <asp:ListItem Value="0">所有人</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;起&nbsp;<input type="date" name="dateselect" runat="server" id="txtEnteringDate" style="font-size: 18px" class="dates" />&nbsp;至&nbsp;&nbsp;<input type="date" runat="server" name="dateselectEnd" id="txtEnteringDatEnd" placeholder="选择日期" style="font-size: 18px" class="dates" />
                        <asp:Button ID="Button3" class="button button1" runat="server" Text="查询历史记录" Width="128px" OnClick="Button3_Click" />
                        &nbsp;<input type="date" runat="server" name="hisdate" id="hisdate" placeholder="选择日期" style="font-size: 18px" class="dates" />
                        <%--<asp:Button ID="Button10" class="button button4" Width="128px" Height="50px" runat="server" Text="员工日志" OnClick="Button10_Click1" />--%>
                        <asp:Button ID="Button1" class="button button2" runat="server" Text="查看日志" Width="115px" Height="50px" OnClick="Button1_Click" />
                        <asp:Button ID="Button11" class="button button5" Width="123px" Height="50px" runat="server" Text="提交日志" OnClick="Button11_Click" />
                        <asp:Button ID="Button4" class="button button2" runat="server" Text="未交员工名单" Width="128px" Height="50px" OnClick="Button4_Click" />
                        <div class="btn-group" style="margin-bottom: 0.6%;">
                            <button type="button" style="width: 110px; height: 50px;" class="button button1" data-toggle="dropdown">
                                导出
		<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <asp:Button ID="Button8" runat="server" Text="日志" class="button button4" Width="173px" OnClick="Button8_Click" />
                                </li>
                                <li>
                                    <asp:Button ID="Button9" runat="server" Text="未交日志员工" class="button button4" Width="173px" OnClick="Button9_Click" />
                                </li>
                                <li>
                                    <asp:Button ID="Button5" runat="server" Text="历史记录" class="button button4" Width="173px" OnClick="Button5_Click" />
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="auto-style2" id="dvGridView" onscroll="javascript:RecordPostion(this);">
                        <br />
                        <asp:GridView ID="GridView2" CssClass="GridView2" Width="85%" runat="server" CellPadding="4" ForeColor="Black" GridLines="None" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound" HorizontalAlign="Center" BorderColor="Silver" BorderStyle="Solid">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="序号" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField HeaderText="未交用户" DataField="userName" ReadOnly="True"></asp:BoundField>
                            </Columns>
                            <HeaderStyle BorderColor="Gainsboro" BorderStyle="solid" Height="50px" Width="500px" />
                            <RowStyle BorderStyle="Solid" BorderColor="Gainsboro" Height="50px" Width="500px" />
                        </asp:GridView>
                        <asp:GridView ID="GridView1" HorizontalAlign="Center" CssClass="GridView" runat="server" Width="100%" AutoGenerateColumns="False" Height="239px" OnRowEditing="GridView1_RowEditing1" DataKeyNames="userName,datetime" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating1" OnRowDataBound="GridView1_RowDataBound" CellPadding="4" ForeColor="Black" BorderColor="Silver" BorderStyle="Solid">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="序号" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField HeaderText="用户名" DataField="userName" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField DataField="datetime" HeaderText="时间" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField DataField="work_day" HeaderText="当日工作内容"></asp:BoundField>
                                <asp:BoundField DataField="work_plan" HeaderText="本周工作计划"></asp:BoundField>
                                <asp:CommandField HeaderText="编辑" ShowEditButton="True" ShowHeader="True" ButtonType="Button"></asp:CommandField>
                            </Columns>
                            <HeaderStyle BorderColor="Gainsboro" BorderStyle="solid" Height="50px" />
                            <RowStyle BorderStyle="Solid" BorderColor="Gainsboro" CssClass="warp" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
<script>
    var Date8 = new Date();
    var Date1 = new Date(Date8.getTime() - 24 * 60 * 60 * 1000);
    document.getElementById('txtEnteringDate').valueAsDate = Date1;
    document.getElementById('txtEnteringDatEnd').valueAsDate = new Date();
    document.getElementById('txtEnteringDatEnd').valueAsDate = new Date();
    document.getElementById('hisdate').valueAsDate = new Date();
    function RecordPostion(obj) {
        var div1 = obj;
        var sx = document.getElementById('dvscrollX');
        var sy = document.getElementById('dvscrollY');

        sy.value = div1.scrollTop;
        sx.value = div1.scrollLeft;
    }

    function GetResultFromServer() {
        try {
            var sx = document.getElementById('dvscrollX');
            var sy = document.getElementById('dvscrollY');

            document.getElementById('dvGridView').scrollTop = sy.value;
            document.getElementById('dvGridView').scrollLeft = sx.value;
        } catch (e) {
        }
    }
    window.onload = RecordPostion
    window.onload = GetResultFromServer

</script>


