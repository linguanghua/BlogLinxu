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
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="/static/semantic.css">
    <link rel="stylesheet" type="text/css" href="/static/semantic.min.css">

    <script type="application/javascript" src="/static/jquery.min.js"></script>
    <script type="application/javascript" src="/static/semantic.js"></script>
    <script type="application/javascript" src="/static/semantic.min.js"></script>
    <script type="application/javascript" src="/static/js/calendar.js"></script>
    <script type="application/javascript">
        $(document).ready(function () {
            $('.ui.accordion').accordion({duration: 'click'});

            $('.ui.dropdown').dropdown();

            $("#calendarYear").html(gYear);
            $("#calendarMonth").html(gMonth + 1);
            makeCalendar();

            LRBtnClickListener();
            addDateItem();
            countDay(gYear, gMonth);
            $("#calendarLayout").hide();
            $("#birthdayLayout").click(function(){
                $("#calendarLayout").transition('scale');
            });
            $("#birthdayLayout").blur(function(){
                $("#calendarLayout").transition('scale');
            });
        });

    </script>
</head>
<body style="background: url('/static/imgs/bg1.jpg');padding: 2rem;">


<div class="ui centered text container segment">
    <img class="ui small circular image centered" src="/static/imgs/steve.jpg">
    <div class="ui centered card">
        <div class="content centered">
            <h2 class="ui header">注册</h2>
            <div class="ui left icon input fluid">
                <input type="text" placeholder="用户名">
                <i class="user icon"></i>
            </div>
            <br/>
            <div class="ui left icon input fluid">
                <input type="password" placeholder="密码">
                <i class="protect  icon"></i>
            </div>
            <br/>
            <!-- 性别 -->
            <div class="ui selection dropdown fluid">
                <i class="dropdown icon"></i>
                <div class="default text">性别</div>
                <div class="menu">
                    <div class="item" data-value="1">男</div>
                    <div class="item" data-value="0">女</div>
                </div>
            </div>
            <br/>
            <!-- 日历 -->
            <div class="ui fluid selection dropdown" id="birthdayLayout">
                <i class="dropdown icon"></i>
                <div class="default text" id="birthday">生日</div>
                <div class="menu">
                </div>
            </div>
            <br/>
            <!-- 地址 -->
            <div class="ui dropdown green basic button fluid">
                <i class="dropdown icon"></i>
                <span class="text">地址</span>
                <div class="menu">
                    <div class="item">
                        <i class="dropdown icon"></i>
                        <span class="text">广西</span>
                        <div class="right menu">
                            <div class="item">南宁</div>
                            <div class="item">桂林</div>
                            <div class="item">玉林</div>
                        </div>
                    </div>
                    <div class="item">
                        <i class="dropdown icon"></i>
                        <span class="text">广东</span>
                        <div class="right menu">
                            <div class="item">广州</div>
                            <div class="item">深圳</div>
                            <div class="item">珠海</div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <button class="fluid ui green button">注册</button>
        </div>
    </div>
    <br/>
</div>

<div class="ui centered card" style="width: 320px;position: relative;margin-top: -280px;" id="calendarLayout">
    <div class="content" style="width: 320px;">
        <div class="ui grid">
            <div class="row" style="background-color: #0d71bb;padding: 0px">

                <div class="two wide column center aligned" style="margin-top: 5px;margin-left:-7px;">
                    <button class="mini ui icon green basic button" id="leftBtn">
                        <i class="angle left icon"></i>
                    </button>
                </div>
                <div class="two wide column center" style="margin-top: 5px;">
                    <button class="mini ui icon green basic button" id="doubleLeftBtn">
                        <i class="angle double left icon"></i>
                    </button>
                </div>
                <div class="five wide column center aligned">
                    <div class="ui selection dropdown fluid" style="background-color: #1dff23">
                        <input type="hidden" name="gender">
                        <i class="dropdown icon"></i>
                        <div class="default text" style="color: #FFFFFF" id="calendarYear">2017</div>
                        <div class="menu" id="yearData">
                        </div>
                    </div>
                </div>
                <div class="three wide column center aligned" style="padding-left: 0px;padding-right: 0px">
                    <div class="ui selection dropdown fluid" style="background-color: #1dff23">
                        <input type="hidden" name="gender">
                        <i class="dropdown icon"></i>
                        <div class="default text" style="color: #FFFFFF" id="calendarMonth">11</div>
                        <div class="menu" id="monthData">

                        </div>
                    </div>
                </div>
                <div class="two wide column center aligned" style="margin-top: 5px;margin-left:-7px;">
                    <button class="mini ui icon green basic button" id="doubleRightBtn">
                        <i class="angle double right icon"></i>
                    </button>
                </div>
                <div class="two wide column center aligned" style="margin-top: 5px;">
                    <button class="mini ui icon green basic button" id="rightBtn">
                        <i class="angle right icon"></i>
                    </button>
                </div>
            </div>

            <div class="row" style="padding-bottom: 0px">
                <div class="one wide column" style="padding-left: 0.3rem">&nbsp;</div>
                <div class="two wide column">一</div>
                <div class="two wide column">二</div>
                <div class="two wide column">三</div>
                <div class="two wide column">四</div>
                <div class="two wide column">五</div>
                <div class="two wide column">六</div>
                <div class="two wide column">日</div>
                <div class="one wide column">&nbsp;</div>
            </div>
        </div>
        <div class="ui grid" id="testDiv">

        </div>
    </div>
</div>
</body>
</html>
