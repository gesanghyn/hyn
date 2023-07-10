<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updatepass.aspx.cs" Inherits="WebApplication1.updatepass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta name="viewport" content="width=device-width, initial-scale=0.3, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <title>修改密码</title>
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

        .demo-btns {
            display: flex;
            margin-left: 30%;
            justify-content: space-between;
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
            margin-top: 5%;
            height: 80px;
            width: 1050px;
            float: left;
            font-size: 30px;
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
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 30px;
        }

        .button1 {
            background-color: white;
            color: black;
            height: 60px;
            margin-left: 40%;
            font-size: 20px;
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
        

        .auto-style2 {
            height: 90px;
            width: 950px;
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
            font-weight: 900;
        }
          .end:hover {
             background-color: #111;
             height:50px;
        }
        .auto-style3 {
            font-size: 18px;
            padding: 0px;
            background: #3b3753;
            border: 1px solid #3b3753;
            color: white;
            font-weight: 900;
        }
    </style>
</head>
<body>
   <div class="page" style="margin-left:23%; width: auto;height:auto;">
        <form runat="server">
            <div class="title">
                <div class="left">
                    <img src="img/jd.png" class="imgstyle" />
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="usermain.aspx">当日工作内容</a></li>
                    <li><a href="historylook.aspx">历史记录</a></li>
                    <li><a href="weekplane.aspx">本周工作计划</a></li>
                    <li><a href="Cultivationdirection.aspx">培养方向</a></li>
                    <li  class="liactive"><a href="updatepass.aspx" >修改密码</a></li>
                
                    <li style="color:white; width:150px">
                             用户名：<asp:Label ID="Label1" runat="server"></asp:Label>
                    </li>
                        <li class="lablecss">
                        <asp:Button ID="Button2" runat="server" Text="退出" CssClass="end" Width="112px" OnClick="Button2_Click1" />

                    </li >
                </ul>
            </div>
            <div class="page__content">
                <div class="container">
                    <div class="row">
                        <div class="input-group input-group-icon ">
                            <input type="password" name="password" placeholder="新密码" style="font-size: 18px" class="auto-style2" />
                            <div class="input-icon">
                                <i class="fa fa-key"></i>
                            </div>
                        </div>
                        <div class="input-group input-group-icon">
                            <input type="password" name="repassword" placeholder="确认密码" style="font-size: 18px" class="auto-style2" />
                            <div class="input-icon">
                                <i class="fa fa-key"></i>
                            </div>
                        </div>
                        <div>
                            <asp:Button ID="Button1" class="button button1" runat="server" Text="修改" Width="115px" OnClick="Button1_Click" />
                        </div>
                    </div>

                </div>
            </div>
        </form>
    </div>
</body>
</html>
<script>
    var mydateInput = document.getElementById("txtEnteringDate");
    var date = new Date();
    var dateString = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
    mydateInput.value = dateString;
</script>
