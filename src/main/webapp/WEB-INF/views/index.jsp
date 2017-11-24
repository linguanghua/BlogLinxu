<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="static/semantic.css">
    <link rel="stylesheet" type="text/css" href="static/semantic.min.css">
    <style type="text/css">

        .hidden.menu {
            display: none;
        }

        .masthead.segment {
            min-height: 700px;
            padding: 1em 0em;
        }

        .masthead .logo.item img {
            margin-right: 1em;
        }

        .masthead .ui.menu .ui.button {
            margin-left: 0.5em;
        }

        .masthead h1.ui.header {
            margin-top: 3em;
            margin-bottom: 0em;
            font-size: 4em;
            font-weight: normal;
        }

        .masthead h2 {
            font-size: 1.7em;
            font-weight: normal;
        }

        .ui.vertical.stripe {
            padding: 8em 0em;
        }

        .ui.vertical.stripe h3 {
            font-size: 2em;
        }

        .ui.vertical.stripe .button + h3,
        .ui.vertical.stripe p + h3 {
            margin-top: 3em;
        }

        .ui.vertical.stripe .floated.image {
            clear: both;
        }

        .ui.vertical.stripe p {
            font-size: 1.33em;
        }

        .ui.vertical.stripe .horizontal.divider {
            margin: 3em 0em;
        }

        .quote.stripe.segment {
            padding: 0em;
        }

        .quote.stripe.segment .grid .column {
            padding-top: 5em;
            padding-bottom: 5em;
        }

        .footer.segment {
            padding: 5em 0em;
        }

        .secondary.pointing.menu .toc.item {
            display: none;
        }

        @media only screen and (max-width: 700px) {
            .ui.fixed.menu {
                display: none !important;
            }

            .secondary.pointing.menu .item,
            .secondary.pointing.menu .menu {
                display: none;
            }

            .secondary.pointing.menu .toc.item {
                display: block;
            }

            .masthead.segment {
                min-height: 350px;
            }

            .masthead h1.ui.header {
                font-size: 2em;
                margin-top: 1.5em;
            }

            .masthead h2 {
                margin-top: 0.5em;
                font-size: 1.5em;
            }
        }
        a.spacing{
            letter-spacing:0.5rem;
        }
    </style>
    <script type="application/javascript" src="static/jquery.min.js"></script>
    <script type="application/javascript" src="static/semantic.js"></script>
    <script type="application/javascript" src="static/semantic.min.js"></script>
    <script src="static/components/visibility.js"></script>
    <script src="static/components/sidebar.js"></script>
    <script src="static/components/transition.js"></script>
    <script>
        $(document)
            .ready(function() {

                // fix menu when passed
                $('.ui.network.menu')
                    .visibility({
                        once: false,
                        onBottomPassed: function() {
                            $('.fixed.menu').transition('fade in');
                        },
                        onBottomPassedReverse: function() {
                            $('.fixed.menu').transition('fade out');
                        }
                    });

                // create sidebar and attach to menu open
                $('.ui.sidebar').sidebar('attach events', '.toc.item');
            });
    </script>
</head>
<body>
<!-- Following Menu -->
<div class="ui large secondary top fixed hidden menu" style="background: url('/static/imgs/bg1.jpg');padding: 2rem;">
    <div class="ui container">
        <a class="active item spacing"  style="color:#FFFFFF;">主页</a>
        <a class="item spacing" style="color:#FFFFFF;" href="article.jsp">文章</a>
        <a class="item spacing" style="color:#FFFFFF;">问题</a>
        <a class="item spacing" style="color:#FFFFFF;">历程</a>
        <div class="right menu">
            <div class="item">
                <a class="ui green button spacing">登录</a>
            </div>
            <div class="item">
                <a class="ui green button spacing">注册</a>
            </div>
        </div>
    </div>
</div>

<!-- Sidebar Menu -->
<div class="ui vertical inverted sidebar menu">
    <a class="active item spacing">主页</a>
    <a class="item spacing" href="article.jsp">文章</a>
    <a class="item spacing">问题</a>
    <a class="item spacing">历程</a>
    <a class="item spacing">登录</a>
    <a class="item spacing">注册</a>
</div>
<!-- Page Contents -->
<div class="pusher">

    <div class="ui inverted vertical masthead center aligned segment" style="background: url('/static/imgs/bg1.jpg')">
        <div class="ui large secondary inverted network menu" >
            <div class="ui container">
                <a class="toc item">
                    <i class="sidebar icon"></i>
                </a>
                <a class="active item spacing">主页</a>
                <a class="item spacing" href="/articles/article">文章</a>
                <a class="item spacing">问题</a>
                <a class="item spacing">历程</a>
                <div class="right item">
                    <a class="ui inverted button spacing">登录</a>
                    <a class="ui inverted button spacing">注册</a>
                </div>
            </div>
        </div>
        <div class="ui text container">
            <h1 class="ui inverted header">
                Welcome To Jason's Blog
            </h1>
            <h2>Do whatever you want when you want to.</h2>
            <!--<div class="ui huge primary button">Get Started <i class="right arrow icon"></i></div>-->
        </div>

    </div>
    <div class="ui vertical stripe segment">
        <div class="ui middle aligned stackable grid container">
            <div class="row">
                <div class="eight wide column">
                    <h3 class="ui header">Android</h3>
                    <p>Android是一种基于Linux的自由及开放源代码的操作系统，主要使用于移动设备，如智能手机和平板电脑，由Google公司和开放手机联盟领导及开发。</p>
                    <h3 class="ui header">Android Studio</h3>
                    <p>Android Studio 是一个Android集成开发工具，基于IntelliJ IDEA. 类似 Eclipse ADT，Android Studio 提供了集成的 Android 开发工具用于开发和调试。</p>
                </div>
                <div class="six wide right floated column">
                    <img src="static/imgs/android.jpg" class="ui large bordered rounded image">
                </div>
            </div>
            <div class="row">
                <div class="center aligned column">
                    <a class="ui huge green button">Learn More</a>
                </div>
            </div>
        </div>
    </div>


    <div class="ui vertical stripe quote segment">
        <div class="ui equal width stackable internally celled grid">
            <div class="center aligned row">
                <div class="column">
                    <h3>Windows</h3>
                    <p><img src="static/imgs/windows.jpg" class="ui avatar image">美国微软公司研发的一套操作系统，它问世于1985年</p>
                </div>
                <div class="column">
                    <h3>Linux</h3>
                    <p>
                        <img src="static/imgs/linux.png" class="ui avatar image">一套免费使用和自由传播的类Unix操作系统
                    </p>
                </div>
                <div class="column">
                    <h3>Mac</h3>
                    <p>
                        <img src="static/imgs/mac.jpg" class="ui avatar image">苹果公司自1984年起以“Macintosh”开始开发的个人消费型计算机
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="ui vertical stripe segment">
        <div class="ui text container">
            <h3 class="ui header">SpringMVC+Spring+Mybatis</h3>
            <p>SSM（Spring+SpringMVC+MyBatis）框架集由Spring、SpringMVC、MyBatis三个开源框架整合而成，常作为数据源较简单的web项目的框架。</p>
            <a class="ui large green button">Read More</a>
            <h4 class="ui horizontal header divider">
                <a href="#">Dividing Line</a>
            </h4>
            <h3 class="ui header">Semantic UI</h3>
            <p>User Interface is the language of the web</p>
            <a class="ui large green button">Read More</a>
        </div>
    </div>


    <div class="ui inverted vertical footer segment">
        <div class="ui container">
            <div class="ui stackable inverted divided equal height centered grid">
                <div class="three wide column">
                    <h4 class="ui inverted header">About Me</h4>
                    <div class="ui inverted link list">
                        <a href="#" class="item">Github</a>
                        <a href="#" class="item">知乎</a>
                        <a href="#" class="item">CSDN</a>
                        <a href="#" class="item">慕课</a>
                    </div>
                </div>
                <div class="three wide column">
                    <h4 class="ui inverted header">Links</h4>
                    <div class="ui inverted link list">
                        <a href="#" class="item">Github</a>
                        <a href="#" class="item">CSDN</a>
                        <a href="#" class="item">慕课</a>
                        <a href="#" class="item">w3school</a>
                    </div>
                </div>
                <div class="seven wide column">
                    <h4 class="ui inverted header">Footer Header</h4>
                    <p>&copy; CopyRight By LinXu</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>