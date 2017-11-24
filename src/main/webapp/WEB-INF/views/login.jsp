<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-11-23
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="/static/semantic.css">
    <link rel="stylesheet" type="text/css" href="/static/semantic.min.css">
</head>
<body style="background: url('/static/imgs/bg1.jpg');padding: 2rem;">
<div class="ui centered text container segment" style="margin-top: 8rem;">
    <img class="ui small circular image centered" src="/static/imgs/steve.jpg">
    <div class="ui centered card">
        <div class="content centered">
            <h2 class="ui header">登录</h2>
            <div class="ui left icon input fluid">
                <input type="text" placeholder="username">
                <i class="user icon"></i>
            </div>
            <br/><br/>
            <div class="ui left icon input fluid">
                <input type="password" placeholder="password">
                <i class="protect  icon"></i>
            </div>
            <br/><br/>
            <button class="fluid ui green button">登录</button>
        </div>
    </div>
    <br />
</div>

</body>
</html>
