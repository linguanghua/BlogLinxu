
var gDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
var myDate = new Date();
var gYear = myDate.getFullYear();
var gMonth = myDate.getMonth();
var gDay = myDate.getDate();        //获取当前日(1-31)


var gDayNums = [[3, 6, 6, 2, 4, 0, 2, 5, 1, 3, 6, 1],
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

/**
 * 创建日历布局
 */
function makeCalendar() {//week表示所选月份第一天星期几，countDay表示所选月份有几天
    var i = 0;
    /**
     * 最外层的6行布局
     */
    while (i < 6) {
        $rowDiv = $("<div>");
        $rowDiv.addClass("row");
        $("#testDiv").append($rowDiv)
        $rowDiv.css("padding-top", "0px");
        $rowDiv.css("padding-bottom", "2px");
        i++;
    }
    /**
     * 每行里面7列，7个div对应于7个按钮布局
     * @type {number}
     */
    $cloDiv = $("<div>");
    $cloDiv.addClass("one wide column testDivClass");
    $cloDiv.css("padding-left", "0.3rem");
    $("#testDiv .row").append($cloDiv);

    var j = 0;
    while (j < 7) {
        $cloDiv = $("<div>");
        $cloDiv.addClass("two wide column testDivClass");
        $cloDiv.css("padding-left", "0.3rem");
        $("#testDiv .row").append($cloDiv);
        j++;
    }
    /**
     * 每行7列，每列一个button
     * @type {*|jQuery|HTMLElement}
     */
    $btn = $("<button>");
    $btn.addClass("mini ui icon basic button dayBtn");
    $btn.mouseover(function () {
        if (!$(this).hasClass("active")) {
            $(this).removeClass("basic");
        }
    });
    $btn.mouseout(function () {
        if (!$(this).hasClass("active")) {
            $(this).addClass("basic");
        }
    });
    $btn.html("01");
    $("#testDiv .two.wide.column").append($btn);
}
/**
 * 给年、月 下拉菜单添加item
 */
function addDateItem() {
    for (var i = 0; i < 12; i++) {
        /**
         * 每年12个月
         * @type {*|jQuery|HTMLElement}
         */
        $itemDiv = $("<div>");
        $itemDiv.addClass("item");
        $itemDiv.html(i + 1);
        $itemDiv.click(function () {
            var year = $("#calendarYear").html();
            countDay(year, ($(this).html() - 1));
        });
        $("#monthData").append($itemDiv);
    }
    /**
     * 年号由1900-今年
     */
    for (var i = 1900; i < parseInt(gYear); i++) {
        $itemDiv = $("<div>");
        $itemDiv.addClass("item");
        $itemDiv.html(i + 1);
        $itemDiv.click(function () {
            var month = $("#calendarMonth").html();
            countDay($(this).html(), month);
        });
        $("#yearData").append($itemDiv);
    }
}

/**
 * 将表示天数的按钮还原到初始状态（因为操作过程中是通过添加class来展示变化）
 * 所以日历发生改变时，通过去掉class还原状态
 * @param count
 */
function initBtn(count) {//将日期天数的按钮状态还原初始状态
    for (var i = 0; i < count; i++) {
        if ($($(".dayBtn")[i]).hasClass("green")) {
            $($(".dayBtn")[i]).removeClass("green");
        }
        if ($($(".dayBtn")[i]).hasClass("active")) {
            $($(".dayBtn")[i]).removeClass("active");
        }
        if (!$($(".dayBtn")[i]).hasClass("basic")) {
            $($(".dayBtn")[i]).addClass("basic");
        }
        if ($($(".dayBtn")[i]).hasClass("nextMonthDay")) {
            $($(".dayBtn")[i]).removeClass("nextMonthDay");
        }
        if ($($(".dayBtn")[i]).hasClass("lastMonthDay")) {
            $($(".dayBtn")[i]).removeClass("lastMonthDay");
        }
    }
}
/**
 * 给表示天数的按钮添加点击事件，点击事件的效果是给生日框填入生日值
 * 因日历存在上月、本月、下月的天号，所以需要处理上月、本月、下月
 * 当是年初或年末时，还要处理跨年
 * @param count
 */
function setDayBtnClickListener(count) {
    for (var i = 0; i < count; i++) {
        $($(".dayBtn")[i]).click(function () {
            var year =parseInt($("#calendarYear").html());
            var month = parseInt($("#calendarMonth").html());
            var day = $(this).html();
            if ($(this).hasClass("nextMonthDay")) {
                if(month==12){
                    month = 1;
                    year+=1;
                }else {
                    month += 1;
                }
            } else if ($(this).hasClass("lastMonthDay")) {
                if(month==1){
                    year-=1;
                    month = 12;
                }else {
                    month -= 1;
                }
            }
            if(month<9){
                month="0"+month;
            }
            $("#birthday").html(year + "-" + month + "-" + day);
        });
    }
}
/**
 * 日历表天号显示
 * 总共显示7*6=42天
 * 根据选中的月，查出该年该月第一天星期几，计算前一个月得出显示几天
 * 根据选中的月份，查出该月有几天，算上上个月显示的天数得出下个月显示几天
 * @param week
 * @param month
 */
function setCalendarDay(week, month) {//week表示所选月份第一天星期几，countDay表示所选月份有几天
    var count = $(".dayBtn").length;
    initBtn(count);
    var str;
    var index = 0;
    var lastMonth = 0;
    var nextMonth = 0;
    if (month == 0) {
        lastMonth = 11;
        nextMonth = 1;
    } else if (month == 11) {
        nextMonth = 0;
        lastMonth = 10;
    } else {
        lastMonth = month - 1;
        nextMonth = month + 1;
    }
    if (week == 0) {
        for (var i = gDays[lastMonth] - 6 + 1; i <= gDays[lastMonth]; i++) {
            str = i;
            $($(".dayBtn")[index]).html(str);
            $($(".dayBtn")[index]).addClass("lastMonthDay");
            index++;
        }
    } else if ((week == 1)) {
        for (var i = gDays[lastMonth] - 6; i <= gDays[lastMonth]; i++) {
            str = i;
            $($(".dayBtn")[index]).html(str);
            $($(".dayBtn")[index]).addClass("lastMonthDay");
            index++;
        }
    } else if (week > 1) {
        for (var i = gDays[lastMonth] - week + 1; i < gDays[lastMonth]; i++) {
            str = i + 1;
            $($(".dayBtn")[index]).html(str);
            $($(".dayBtn")[index]).addClass("lastMonthDay");
            index++;
        }
    }
    for (var i = 0; i < gDays[month]; i++) {

        if (i < 9) {
            str = "0" + (i + 1);
        } else {
            str = i + 1;
        }
        $($(".dayBtn")[index]).html(str);
        $($(".dayBtn")[index]).addClass("green");
        if (i == gDay - 1) {
            $($(".dayBtn")[index]).removeClass("basic");
            $($(".dayBtn")[index]).addClass("active");
        }
        index++;
    }

    for (var i = 0; i < gDays[nextMonth] && index < count; i++) {
        if (i < 9) {
            str = "0" + (i + 1);
        } else {
            str = i + 1;
        }
        $($(".dayBtn")[index]).html(str);
        $($(".dayBtn")[index]).addClass("nextMonthDay");
        index++;
    }
    setDayBtnClickListener(count);
}

/**
 * 根据每28年星期会循环，查出该年该月的第一天是星期几
 * @param year
 * @param month
 */
function countDay(year, month) {
    if ((year % 400 == 0) || (year%100!=0 && year % 4 == 0)) {
        gDays[1] = 29;
    }else{
        gDays[1] = 28;
    }
    var index1=year;
    if(year<2015){
        index1 = 2015-year;
    }else{
        index1 = year-2015;
    }
    var week = (gDayNums[(index1 % 28)][month] + 1) % 7;
    setCalendarDay(week, month);
}

/**
 * 日历左右按钮（上一年、上一月、下一年、下一月）
 * @constructor
 */
function LRBtnClickListener(){
    $("#leftBtn").click(function(){//上一年
        var year = parseInt($("#calendarYear").html());
        var month = parseInt($("#calendarMonth").html())-1;
        year--;
        countDay(year, month);
        $("#calendarYear").html(year);
    });
    $("#doubleLeftBtn").click(function(){//上一月
        var year = parseInt($("#calendarYear").html());
        var month = parseInt($("#calendarMonth").html())-1;
        if(month==0){
            month=11;
            year--;
            $("#calendarYear").html(year);
        }else{
            month--;
        }
        countDay(year, month);
        $("#calendarMonth").html(month+1);
    });
    $("#rightBtn").click(function(){//下一年
        var year = parseInt($("#calendarYear").html());
        var month = parseInt($("#calendarMonth").html()-1);
        year++;
        countDay(year, month);
        $("#calendarYear").html(year);
    });
    $("#doubleRightBtn").click(function(){//下一月
        var year = parseInt($("#calendarYear").html());
        var month = parseInt($("#calendarMonth").html()-1);
        if(month==11){//跨年
            month=0;
            year++;
            $("#calendarYear").html(year);
        }else{
            month++;
        }
        countDay(year, month);
        $("#calendarMonth").html(month+1);
    });
}




