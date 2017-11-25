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

    <style type="text/css">
        .calendarRow {
            margin-left: 1rem;
        }
    </style>
    <script type="application/javascript" src="/static/jquery.min.js"></script>
    <script type="application/javascript" src="/static/semantic.js"></script>
    <script type="application/javascript" src="/static/semantic.min.js"></script>
    <script type="application/javascript">
        $(document).ready(function () {
            $('.ui.accordion').accordion({duration: 'click'});

            $('.ui.dropdown').dropdown();

            $("#calendarYear").html(gYear);
            $("#calendarMonth").html(gMonth+1);
            makeCalendar();
            addDateItem();
            countDay(gYear,gMonth);
        });

        function makeCalendar() {//week表示所选月份第一天星期几，countDay表示所选月份有几天
            var i = 0;
            while (i < 6) {
                $rowDiv = $("<div>");
                $rowDiv.addClass("row calendarRow");
                $("#divCalendar").append($rowDiv)
                $rowDiv.css("padding-top", "2px");
                $rowDiv.css("padding-bottom", "2px");
                i++;
            }

            var j = 0;
            while (j < 7) {
                $cloDiv = $("<div>");
                $cloDiv.addClass("two wide column");
                $("#divCalendar .row").append($cloDiv);
                j++;
            }
            $btn = $("<button>");
            $btn.addClass("mini ui icon basic button dayBtn");
            $btn.mouseover(function () {
                if(!$(this).hasClass("active")) {
                    $(this).removeClass("basic");
                }
            });
            $btn.mouseout(function () {
                if(!$(this).hasClass("active")) {
                    $(this).addClass("basic");
                }
            });
            $btn.click(function () {
                var year = $("#calendarYear").html();
                var month = $("#calendarMonth").html();
                var day = $(this).html();
                $("#birthday").html(year + "-" + month + "-" + day);
            });
            $("#divCalendar .two.wide.column").append($btn);

        }

        function setCalendarDay(week,month) {//week表示所选月份第一天星期几，countDay表示所选月份有几天
            var count = $(".dayBtn").length;
            var str;
            var index=0;
            var lastMonth=0;
            var nextMonth=0;
            if(month==0){
                lastMonth = 11;
            } else if(month==11){
                nextMonth = 0;
            }else {
                lastMonth = month-1;
                nextMonth = month+1;
            }
            alert(week+" "+ month);
                if (week > 0) {
                    for (var i = days[lastMonth] - week+1; i < days[lastMonth]; i++) {
                        if (i < 9) {
                            str = "0" + (i + 1);
                        } else {
                            str = i + 1;
                        }
                        $($(".dayBtn")[index]).html(str);
                        index++;
                    }
                }
                if(week==0){
                    for (var i = days[lastMonth] - 6+1; i < days[lastMonth]; i++) {
                        if (i < 9) {
                            str = "0" + (i + 1);
                        } else {
                            str = i + 1;
                        }
                        $($(".dayBtn")[index]).html(str);
                        index++;
                    }
                }
                alert(days[month]);
                for (var i = 0; i < days[month]; i++) {

                    if (i < 9) {
                        str = "0" + (i + 1);
                    } else {
                        str = i + 1;
                    }
                    $($(".dayBtn")[index]).html(str);
                    $($(".dayBtn")[index]).addClass("green");
                    if(i==gDay-1){
                        $($(".dayBtn")[index]).removeClass("basic");
                        $($(".dayBtn")[index]).addClass("active");
                    }
                    index++;
                }

                for (var i = 0; i < days[nextMonth]&&index<count; i++) {
                    if (i < 9) {
                        str = "0" + (i + 1);
                    } else {
                        str = i + 1;
                    }
                    $($(".dayBtn")[index]).html(str);
                    index++;
                }
        }


        function addDateItem() {
            for (var i = 0; i < 12; i++) {
                $itemDiv = $("<div>");
                $itemDiv.addClass("item");
                $itemDiv.html(i + 1);
                $itemDiv.click(function () {
                    var year = $("#calendarYear").html();

                    countDay(year,($(this).html()-1));
                });
                $("#monthData").append($itemDiv);
            }
            for (var i = 1900; i < 2017; i++) {
                $itemDiv = $("<div>");
                $itemDiv.addClass("item");
                $itemDiv.html(i + 1);
                $itemDiv.click(function () {
                    var month = $("#calendarMonth").html();
                    countDay($(this).html(),month);
                });
                $("#yearData").append($itemDiv);
            }
        }
        var days = [31, 28, 31, 30, 31, 30, 31, 30, 31, 31, 30, 31];
        var myDate = new Date();
        var gYear = myDate.getFullYear();
        var gMonth = myDate.getMonth();
        var gDay = myDate.getDate();        //获取当前日(1-31)

        function countDay(year,month) {
            var dayNums = [[3, 6, 6, 2, 4, 0, 2, 5, 1, 3, 6, 1],
                [4, 0, 1, 4, 6, 2, 4, 0, 3, 5, 1, 3],
                [6, 2, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4],
                [0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5],
                [1, 4, 4, 0, 2, 5, 0, 3, 6, 1, 4, 6],
                [2, 5, 6, 2, 4, 0, 2, 5, 0, 3, 6, 1],
                [4, 0, 0, 3, 5, 1, 3, 6, 2, 4, 0, 2],
                [5, 1, 1, 4, 6, 2, 4, 0, 3, 5, 1, 3],
                [6, 2, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4],
                [0, 3, 4, 0, 2, 5, 0, 3, 6, 1, 4, 6],
                [2, 5, 5, 1, 3, 6, 1, 4, 0, 2, 5, 0],
                [3, 6, 6, 2, 4, 0, 2, 5, 1, 3, 6, 1],
                [4, 0, 0, 3, 5, 1, 3, 6, 2, 4, 0, 2],
                [5, 1, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4],
                [0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5],
                [1, 4, 4, 0, 2, 5, 0, 3, 6, 1, 4, 6],
                [2, 5, 5, 1, 3, 6, 1, 4, 0, 2, 5, 0],
                [3, 6, 0, 3, 5, 1, 3, 6, 2, 4, 0, 2],
                [5, 1, 1, 4, 6, 2, 4, 0, 3, 5, 1, 3],
                [6, 2, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4],
                [0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5],
                [1, 4, 5, 1, 3, 6, 1, 4, 0, 2, 5, 0],
                [3, 6, 6, 2, 4, 0, 2, 5, 1, 3, 6, 1],
                [4, 0, 0, 3, 5, 1, 3, 6, 2, 4, 0, 2],
                [5, 1, 1, 4, 6, 2, 4, 0, 3, 5, 1, 3],
                [6, 2, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5],
                [1, 4, 4, 0, 2, 5, 0, 3, 6, 1, 4, 6],
                [2, 5, 5, 1, 3, 6, 1, 4, 0, 2, 5, 0]];

            if (year % 100 == 0 && year % 4 == 0) {
                days[1] = 29;
            }
            var week = (dayNums[((gYear-2015)%28)][month]+1)%7;
            setCalendarDay(week,month);
        }

    </script>
</head>
<body style="background: url('/static/imgs/bg1.jpg');padding: 2rem;">

<div class="ui centered text container segment" style="margin-top: 8rem;">
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
                <input type="hidden" name="gender">
                <i class="dropdown icon"></i>
                <div class="default text">性别</div>
                <div class="menu">
                    <div class="item" data-value="1">男</div>
                    <div class="item" data-value="0">女</div>
                </div>
            </div>
            <br/>
            <!-- 日历 -->
            <div class="ui fluid selection dropdown">
                <input type="hidden" name="birthday" value="生日">
                <i class="dropdown icon"></i>

                <div class="default text" id="birthday">生日</div>
                <div class="menu">
                    <div class="item">
                    </div>
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


<div class="ui centered card">
    <div class="content centered">
        <div class="ui grid">


            <div class="row" style="background-color: #0d71bb">
                <div class="two wide column" style="padding-left: 1px;padding-top: 4px">
                    <button class="mini ui icon green basic button">
                        <i class="angle double left icon"></i>
                    </button>
                </div>
                <div class="two wide column" style="padding-left: 1px;padding-top: 4px">
                    <button class="mini ui icon green basic button">
                        <i class="angle left icon"></i>
                    </button>
                </div>
                <div class="five wide column" style="padding-left: 0px;padding-right: 1px;">
                    <div class="ui compact selection dropdown fluid"
                         style="padding-left: 10px;padding-right: 5px;background-color: #1EBC30">
                        <div class="text" id="calendarYear"> 2017</div>
                        年
                        <i class="dropdown icon" style="padding-left: 0px;padding-right: 10px"></i>
                        <div class="menu" id="yearData">
                        </div>
                    </div>

                </div>
                <div class="three wide column " style="padding-left: 1px;padding-right: 0px;">
                    <div class="ui compact selection dropdown fluid"
                         style="padding-left: 5px;padding-right: 5px;background-color: #1EBC30">
                        <div class="text" id="calendarMonth">11</div>
                        月
                        <i class="dropdown icon" style="padding-left: 0px;padding-right: 1px"></i>
                        <div class="menu" id="monthData">
                        </div>
                    </div>

                </div>
                <div class="two wide column" style="padding-left: 1px;padding-top: 4px">
                    <button class="mini ui icon green basic button">
                        <i class="angle double right icon"></i>
                    </button>
                </div>
                <div class="two wide column" style="padding-left: 1px;padding-top: 4px">
                    <button class="mini ui icon green basic button">
                        <i class="angle right icon"></i>
                    </button>
                </div>
            </div>


            <div class="row calendarRow" style="margin-left: 2rem">
                <div class="two wide column">一</div>
                <div class="two wide column">二</div>
                <div class="two wide column">三</div>
                <div class="two wide column">四</div>
                <div class="two wide column">五</div>
                <div class="two wide column">六</div>
                <div class="two wide column">日</div>
            </div>
        </div>
        <div class="ui grid" id="divCalendar"></div>
    </div>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
</body>
</html>
