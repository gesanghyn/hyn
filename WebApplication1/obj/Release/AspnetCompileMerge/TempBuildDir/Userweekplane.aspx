<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userweekplane.aspx.cs" Inherits="WebApplication1.Userweekplane" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            width: auto;
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

        .auto-style18 {
            position: relative;
            min-height: 100vh;
            width: 700px;
            background-color: #fff;
            margin-top: 15px;
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
            width: 950px;
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

        .tete {
            font-size: 25px;
            padding: 12px;
            position: relative;
            left: 0px;
            top: -11px;
            height: 322px;
            width: 135%;
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

        .button1 {
            background-color: white;
            color: black;
            height: 60px;
            float: right;
            font-size: 14px;
            border: 2px solid #4CAF50;
        }

            .button1:hover {
                background-color: #4CAF50;
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

        .liactive {
            background-color: #b83b5e;
        }

        div.menu ul li a:hover { /*鼠标移动到点击位时的样式，active指点击过后的样式*/
            background-color: #111;
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
             font-size:17px;
            color: #555;
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

        .auto-style19 {
           font-size: 25px;
            padding: 12px;
            position: relative;
            left: 0px;
            top: -24px;
            height:500px;
            width: 135%;
        }
          .end:hover {
             background-color: #111;
             height:50px;
        }
          	.btn {
			padding: 10px 20px;
			margin-top: 27px;
			color: darkslateblue;
            border: 2px solid darkorange;
           height: 55px;
			position: relative;
			overflow: hidden;
			text-transform: uppercase;
			letter-spacing: 2px;
             border-radius: 30px;
            font-size:19px;
			left: 8%;
		}

		.btn:hover {
		   border-radius: 30px;
			color: #fff;
			background:darkorange;
			box-shadow: 0 0 5px darkorange ,
				0 0 25px 0 darkorange,
				0 0 50px 0 darkorange,
				0 0 100px 0 darkorange;
			transition: all 1s linear;
		}

		.btn>span {
			position: absolute;
		}

		.btn>span:nth-child(1) {
			width: 100%;
			height: 2px;
			background: -webkit-linear-gradient(left, transparent, #03e9f4);
			left: -100%;
			top: 0px;
			animation: line1 1s linear infinite;
		}
    </style>
</head>
<body>
    <link href="https://fonts.googleapis.com/css?family=Overpass:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=The+Girl+Next+Door" rel="stylesheet" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css' />
    <div class="page" style="margin-left:23%;width: auto;height:auto; ">
        <form runat="server">
            <div class="title">
                <div class="left">
                    <img src="img/jd.png" class="imgstyle" />
                </div>
                <div class="right">
                    <br />
                    <br />
                    <br />
                   <%-- 用户名：<asp:Label ID="Label1" runat="server"></asp:Label>--%>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li id="todayLog"><a href="Usermain.aspx">当日工作内容</a></li>
                    <li><a href="Userlook.aspx">历史记录</a></li>
                    <li><a href="Userweekplane.aspx" class="liactive">本周工作计划</a></li>
                    <li><a href="Cultivationdirection.aspx">培养方向</a></li>
                    <li><a href="Userpass.aspx">修改密码</a></li>
                     <li style="color:white; width:150px">
                             用户名：<asp:Label ID="Label1" runat="server"></asp:Label>
                    </li>
                    <li class="lablecss">
                        <asp:Button ID="Button2" runat="server" Text="退出" CssClass="end" Width="112px" OnClick="Button2_Click1" style="height: 24px" />
                    </li>
                </ul>
            </div>
            <div class="auto-style18">
                <div class="container">
                    <div class="input-group ">
                        <input type="date" name="dateselect" id="txtEnteringDate" placeholder="选择日期" style="font-size: 25px; height: 60px; width: 80%" />
                        <asp:Button ID="Button1" class="btn" runat="server" Text="提交" Width="105px" OnClick="Button1_Click1" />
                    </div>
                    <br />
                    <div>
                        <textarea name="weekmessage" id="weekmessage" runat="server"  cols="72" placeholder="本周工作计划" class="auto-style19"></textarea>

                    </div>

                </div>
            </div>
        </form>
    </div>
</body>
</html>
<script>  
    var now = new Date();
    var nowTime = now.getTime();
    var day = now.getDay();
    var oneDayTime = 24 * 60 * 60 * 1000;

    //显示周一
    var MondayTime = nowTime - (day - 1) * oneDayTime;
  

    //初始化日期时间
    var monday = new Date(MondayTime);
    document.getElementById('txtEnteringDate').valueAsDate = monday;//显示周一
</script>
