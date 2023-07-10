<%@ Page Language="C#" AutoEventWireup="true"  MaintainScrollPositionOnPostback="true" EnableEventValidation="false" CodeBehind="admindirection.aspx.cs" Inherits="WebApplication1.admindirection" %>

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



        .row {
            zoom: 1;
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

        .table {
            font-size: 15px;
        }

        .GridView {
            float: left;
            table-layout:fixed;
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


        .GridView tr {
            background-color: whitesmoke;
            height: auto;
            width: auto;
          /*  text-align: center;*/
            border-bottom: 1px solid #DCDCDC;
            border-right: 1px solid #DCDCDC;
        }

            .GridView tr td {
                height: 40px;
                width: 30px;
                border-bottom: 1px solid #DCDCDC;
                border-right: 1px solid #DCDCDC;
            }
             .GridView tr td:nth-child(1) {
                    text-align: center;
                    width:6%;
                    vertical-align: middle;
                }
              .GridView tr td:nth-child(2) {
                    text-align: center;
                    width:8%;
                    vertical-align: middle;
                }
                .GridView tr td:nth-child(3) {
                    text-align: left;
                    width:32%;
                    vertical-align: middle;
                }
                  .GridView tr td:nth-child(4) {
                    text-align: left;
                    width:32%;
                    vertical-align: middle;
                }
                   .GridView tr td:nth-child(5) {
                    text-align: center;
                    width:5%;
                    vertical-align: middle;
                }
              .GridView tr td:nth-child(6) {
                    text-align: center;
                    width:5%;
                    vertical-align: middle;
                }
        .GridView td table {
            height: auto;
            width: auto;
            background-color: #507CD1;
            text-align: left;
            border-bottom: 1px solid #DCDCDC;
            border-right: 1px solid #DCDCDC;
        }

            .GridView td table td {
                text-align: left;
            }


        .auto-style1 {
            float: left;
            min-height: 100vh;
            width: 2200px;
            background-color: #fff;
        }

        .bt3 {
            border: 2px solid #FFA500;
            color: black;
            border-radius: 30px;
            width: 60px;
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

        .thcss {
            float: left;
            width: 1800px;
            height: 50px;
        }
        .gritable {
            width:1800px;
            height: 500px;
            overflow-y: scroll;
            float:left;
        }
        .title {
            width:1400px;
            height:100px;
        }

.left {
            float:left;
             width: 50%;
            height: auto;
         
        }

.imgstyle {
            margin-top: 11px;
        }

.right {
            float:right;
             width: 50%;
            height: 40px;
         
        }

  .end {
            margin-left: 85%;
            width: 30px;
            float:right;
            margin-top:7%;
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
             white-space:pre-wrap;  
            word-wrap: break-word;  
        }
        .topstyle {
            display:none;
        }
    </style>

</head>
<body>
    <link href="https://fonts.googleapis.com/css?family=Overpass:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=The+Girl+Next+Door" rel="stylesheet">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css'>
    <div class="page" style="margin-left: 10%; width: 600px;">
        <form runat="server">
              <asp:HiddenField ID="dvscrollX" runat="server" />
                  <asp:HiddenField ID="dvscrollY" runat="server" />
         <div class="title" >
                <div class="left">
                <img src="img/jd.png" class="imgstyle" />
                    </div>
                <div class="right">
                <asp:Button ID="Button2" runat="server" Text="退出" CssClass="end" Width="112px" OnClick="Button2_Click1"  />
                    </div>
            </div>
        <div class="menu">
            <ul>
                <li id="todayLog"><a href="adminlog.aspx">日志管理</a></li>
                <li><a href="admincontrol.aspx">员工管理</a></li>
                <li class="one"><a href="admindirection.aspx" class="liactive">培养目标管理</a></li>
            </ul>
        </div>
            <div class="auto-style1">
                <div class="container">
                    <div class="table">
                         <br />
                        <asp:Button ID="Button1" runat="server" Text="导出Excel" OnClick="Button1_Click" CssClass="bt3" Width="90px" />
                    </div>
                    <div class="thcss">
                        <table class="table-thead " style="width: 1401px">
                            <thead>
                                <tr>
                                    <th width="93px">序号</th>
                                    <th width="128px">用户名</th>
                                    <th width="509px">现阶段任务</th>
                                    <th width="510px">长远规划</th>
                                    <th width="79px">编辑</th>
                                    <th width="80px">删除</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="gritable" id="dvGridView"  onscroll="javascript:RecordPostion(this);">
                        <asp:GridView ID="GridView1" HorizontalAlign="Center" CssClass="GridView" runat="server" Width="1400px" AutoGenerateColumns="False" Height="239px" OnRowEditing="GridView1_RowEditing1" DataKeyNames="username" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating1" OnRowDataBound="GridView1_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" BorderColor="Silver" BorderStyle="Solid">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField HeaderText="序号" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField HeaderText="用户名" DataField="username" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField HeaderText="现阶段任务" DataField="cultivationdirection" ></asp:BoundField>
                                <asp:BoundField HeaderText="长远规划" DataField="task"></asp:BoundField>
                                <asp:CommandField HeaderText="编辑" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" ShowSelectButton="True" DeleteText="" SelectText=""></asp:CommandField>
                                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" ShowHeader="True"></asp:CommandField>
                            </Columns>
                            <HeaderStyle BorderColor="Gainsboro" BorderStyle="solid" CssClass="topstyle" />
                            <RowStyle BorderStyle="Solid" BorderColor="Gainsboro" CssClass="warp"   />
                        </asp:GridView>
                    </div>
                </div>
            </div>
    </form>
    </div>
</body>
</html>
<script>
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


