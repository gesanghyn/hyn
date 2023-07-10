<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cultivationdirection.aspx.cs" Inherits="WebApplication1.Cultivationdirection" %>

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

        h4 {
            color: #3b3753;
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
            height: 50px;
            margin-left: 160px;
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
           top:20px;
            color:#555;
            font-size:17px;
            width: 30%;
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
         .end:hover {
             background-color: #111;
             height:50px;
        }
    </style>
</head>
<body>
    <link href="https://fonts.googleapis.com/css?family=Overpass:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=The+Girl+Next+Door" rel="stylesheet" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css' />
    <link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' />
    <div class="page" style="margin-left:23%; width: auto;height:auto;">
        
        <form runat="server">
        <div class="title">
            <div class="left">
                <img src="img/jd.png" class="imgstyle" />
            </div>
        </div>
       <div class="menu">
                <ul>
                    <li><a href="Usermain.aspx">当日工作内容</a></li>
                    <li><a href="Userlook.aspx">历史记录</a></li>
                    <li><a href="Userweekplane.aspx">本周工作计划</a></li>
                    <li><a href="Cultivationdirection.aspx"  class="liactive">培养方向</a></li>
                    <li><a href="Userpass.aspx">修改密码</a></li>
                
                    <li style="color:white; width:150px">
                             用户名：<asp:Label ID="Label1" runat="server"></asp:Label>
                    </li>
                        <li class="lablecss">
                        <asp:Button ID="Button2" runat="server" Text="退出" CssClass="end" Width="112px" OnClick="Button2_Click1" />

                    </li >
                </ul>
            </div>
                <div class="container" style="position: absolute; margin: auto;" >
                    <div class="row">
                        <h4>现阶段任务</h4>
                        <div>
                            <asp:TextBox ID="TextBox2" TextMode="MultiLine" Width="950px" runat="server" Height="180px" Style=" font-size: 25px;"></asp:TextBox>

                        </div>
                        <h4>长远规划</h4>
                        <div>
                            <asp:TextBox ID="TextBox3" ReadOnly="true" TextMode="MultiLine" Width="950px" runat="server" Height="180px" Style="font-size: 25px;"></asp:TextBox>
                            </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
<script>

</script>
