<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminadduser.aspx.cs" Inherits="WebApplication1.adminadduser" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加信息</title>
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
            margin: auto;
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

        h2 {
            margin-top: 40px;
            text-decoration: underline;
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
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 30px;
            margin-left: 30%;
        }

        .button1 {
            background-color: white;
            color: black;
            height: 50px;
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

        .exit {
            border-radius: 30px;
            width: 80px;
            background: linear-gradient(#141e30, #243b55);
            color: white;
        }

            .exit:hover {
                border: 2px solid #4caf50;
            }

        .auto-style1 {
            height: 60px;
        }

        .auto-style2 {
            height: 45px;
        }

        .auto-style3 {
            width: 528px;
            margin-left: 25%;
            margin-top: 5%;
        }

        .text {
            border-right: #0099cc 1px groove;
            border-top: 1px solid #0099cc;
            font-size: 9pt;
            border-left: 1px solid #0099cc;
            border-bottom: 1px inset #0099cc;
            font-family: 宋体;
            background-color: aliceblue;
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
                width: 200px;
                height: 100%;
                padding: 0px;
                margin-right: 8%; /*两个li之间的距离*/
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

        .te {
            margin-left: 20%;
        }

        .auto-style4 {
            height: 3px;
        }

        .auto-style6 {
            position: relative;
            width: 60%;
            left: 0px;
            top: 0px;
        }

        .title {
            width: 1400px;
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
    </style>
</head>
<body>
    <link href="https://fonts.googleapis.com/css?family=Overpass:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=The+Girl+Next+Door" rel="stylesheet" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css' />
    <link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' />
    <div class="auto-style6" style="margin-left: 17%;">

        <form runat="server">
            <div class="title">
                <div class="left">
                    <img src="img/jd.png" class="imgstyle" />
                </div>
                <div class="right">
                    <asp:Button ID="Button2" runat="server" Text="退出" CssClass="end" Width="112px" OnClick="Button2_Click1" />
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li id="todayLog"><a href="adminlog.aspx">日志管理</a></li>
                    <li><a href="admincontrol.aspx">员工管理</a></li>
                    <li class="auto-style2"><a href="admindirection.aspx">培养目标管理</a></li>
                    <li><a href="adminadduser.aspx" class="liactive">添加员工</a></li>
                </ul>
            </div>
            <div class="page__content">
                <div class="container">
                    <table class="auto-style3">
                        <tr>
                            <td class="auto-style4">
                                <label for="username">用户名</label></td>
                            <td class="auto-style4">
                                <input type="text" name="username" id="username" style="font-size: 18px" placeholder="请输入用户名" class="auto-style1" /><br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="password">密码</label></td>
                            <td>
                                <input type="password" name="password" style="font-size: 18px" id="password" placeholder="请输入密码" class="auto-style1" /><br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <label for="gender">身份属性</label></td>
                            <td class="auto-style2">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="text" Style="font-size: 18px" class="auto-style1">
                                    <asp:ListItem>员工</asp:ListItem>
                                    <asp:ListItem>领导</asp:ListItem>
                                    <asp:ListItem>管理员</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <div class="te">
                        <asp:Button ID="Button1" class="button button1" runat="server" Text="添加" Width="115px" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
