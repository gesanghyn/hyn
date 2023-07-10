<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Log.aspx.cs" Inherits="WebApplication1.Log" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录页面</title>
    <style>
		* {
			margin: 0;
			padding: 0;
		}

		a {
			text-decoration: none;
		}

		input,
		button {
			background: transparent;
			border: 0;
			outline: none;
		}

		body {
			height: 100vh;
			background: linear-gradient(#141e30, #243b55);
			display: flex;
			justify-content: center;
			align-items: center;
			font-size: 16px;
			color: #03e9f4;
		}

		.loginBox {
			width: 450px;
			height: 364px;
			background-color: #0c1622;
			margin: 100px auto;
			border-radius: 10px;
			box-shadow: 0 15px 25px 0 rgba(0, 0, 0, .6);
			padding: 40px;
			box-sizing: border-box;
		}

		h2 {
			text-align: center;
			color: aliceblue;
			margin-bottom: 30px;
			font-family: 'Courier New', Courier, monospace;
		}

		.item {
			height: 45px;
			border-bottom: 1px solid #fff;
			margin-bottom: 40px;
			position: relative;
		}

		.item input {
			width: 100%;
			height: 100%;
			color: #fff;
			padding-top: 20px;
			box-sizing: border-box;
		}

		.item input:focus+label,
		.item input:valid+label {
			top: 0px;
			font-size: 2px;
		}

		.item label {
			position: absolute;
			left: 0;
			top: 12px;
			transition: all 0.5s linear;
		}

		.btn {
			padding: 10px 20px;
			margin-top: 30px;
			color: #03e9f4;
			position: relative;
			overflow: hidden;
			text-transform: uppercase;
			letter-spacing: 2px;
			left: 35%;
		}

		.btn:hover {
			border-radius: 5px;
			color: #fff;
			background: #03e9f4;
			box-shadow: 0 0 5px 0 #03e9f4,
				0 0 25px 0 #03e9f4,
				0 0 50px 0 #03e9f4,
				0 0 100px 0 #03e9f4;
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

		@keyframes line1 {

			50%,
			100% {
				left: 100%;
			}
		}

		.btn>span:nth-child(2) {
			width: 2px;
			height: 100%;
			background: -webkit-linear-gradient(top, transparent, #03e9f4);
			right: 0px;
			top: -100%;
			animation: line2 1s 0.25s linear infinite;
		}

		@keyframes line2 {

			50%,
			100% {
				top: 100%;
			}
		}

		.btn>span:nth-child(3) {
			width: 100%;
			height: 2px;
			background: -webkit-linear-gradient(left, #03e9f4, transparent);
			left: 100%;
			bottom: 0px;
			animation: line3 1s 0.75s linear infinite;
		}

		@keyframes line3 {

			50%,
			100% {
				left: -100%;
			}
		}

		.btn>span:nth-child(4) {
			width: 2px;
			height: 100%;
			background: -webkit-linear-gradient(top, transparent, #03e9f4);
			left: 0px;
			top: 100%;
			animation: line4 1s 1s linear infinite;
		}

		@keyframes line4 {

			50%,
			100% {
				top: -100%;
			}
		}
	    .auto-style1 {
            height: 388px;
        }
        .auto-style2 {
            width: 450px;
            height: 442px;
            background-color: #0c1622;
            margin: 100px auto;
            border-radius: 10px;
            box-shadow: 0 15px 25px 0 rgba(0, 0, 0, .6);
            padding: 40px;
			margin-left:40%;
            box-sizing: border-box;
        }
	</style>
</head>
<body>
    <div class="auto-style2">
		<h2>login</h2>
		<form runat="server" class="auto-style1">
			<div class="item">
				  <input type="text" name="userName" style="font-size:18px" />
				<label style="font-size:18px" for="">用户名</label>
			</div>
			<div class="item">
				<input type="password" name="password"  style="font-size:18px"/>
				<label style="font-size:18px" for="">密码</label>
			</div>

		<asp:Button class="btn" ID="Button1" runat="server" Text="登录" style="font-size:18px" OnClick="Button1_Click" >
			</asp:Button >
			<br />

		</form>
	</div>
</body>
</html>
