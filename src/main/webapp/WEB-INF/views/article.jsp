<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-11-21
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>博客</title>
    <link rel="stylesheet" type="text/css" href="/static/semantic.css">
    <style type="text/css">
        body {
            background-color: #FFFFFF;
        }

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

        .ui.vertical.stripe h3 {
            font-size: 2em;
        }

        .ui.vertical.stripe .button + h3,
        .ui.vertical.stripe p + h3 {
            margin-top: 3em;
        }

        .ui.vertical.stripe p {
            font-size: 1.33em;
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
    <script type="application/javascript" src="/static/jquery.min.js"></script>
    <script type="application/javascript" src="/static/semantic.js"></script>
    <script type="application/javascript" src="/static/semantic.min.js"></script>
    <script src="/static/components/visibility.js"></script>
    <script src="/static/components/sidebar.js"></script>
    <script src="/static/components/transition.js"></script>
    <script>
        $(document)
            .ready(function() {
                $('.ui.accordion').accordion();
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
                $('.ui.sidebar')
                    .sidebar('attach events', '.toc.item');
            });
    </script>
</head>
<body>
<!-- Following Menu -->
<div class="ui large secondary top fixed hidden menu" style="background: url('/static/imgs/bg1.jpg');padding: 2rem;">
    <div class="ui container">
        <a class="item spacing"  style="color:#FFFFFF;">主页</a>
        <a class="active item spacing" style="color:#FFFFFF;" href="#">文章</a>
        <a class="item spacing" style="color:#FFFFFF;">项目</a>
        <a class="item spacing" style="color:#FFFFFF;">资源</a>
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
    <a class="item spacing">主页</a>
    <a class="active item spacing" href="#">文章</a>
    <a class="item spacing">项目</a>
    <a class="item spacing">资源</a>
    <a class="item spacing">登录</a>
    <a class="item spacing">注册</a>
</div>
<!-- Page Contents -->
<div class="pusher">
    <div class="ui inverted vertical masthead center aligned segment" style="background: url('/static/imgs/bg1.jpg');background-repeat:no-repeat;">

        <div class="ui large secondary inverted network menu" >
            <div class="ui container">
                <a class="toc item">
                    <i class="sidebar icon"></i>
                </a>
                <a class="item spacing" href="../">主页</a>
                <a class="active item spacing" href="#">文章</a>
                <a class="item spacing">项目</a>
                <a class="item spacing">资源</a>
                <div class="right item">
                    <a class="ui inverted button spacing">登录</a>
                    <a class="ui inverted button spacing">注册</a>
                </div>
            </div>
        </div>
        <div class="ui container">
            <div class="ui container segment" style="margin-top: 50px" style=" background-color: #FFFFFF;">

                <div class="ui grid container">
                    <div class="three wide column left aligned" style="margin-top: 40px">
                        <h3>文章列表</h3>
                        <div class="ui styled fluid accordion">
                            <div class="title"><i class="dropdown icon"></i>Android </div>
                            <div class="content" >
                                <div class="ui animated list" style="margin-left: 1.5rem">
                                    <div class="item">
                                        <div class="item">Activity</div>
                                    </div>
                                    <div class="item">
                                        <div class="item">Service</div>
                                    </div>
                                    <div class="item">
                                        <div class="item">Content Provider</div>
                                    </div>
                                </div>
                            </div>
                            <div class="title"><i class="dropdown icon"></i> Spring </div>
                            <div class="content">
                                <div class="ui animated list" style="margin-left: 1.5rem">
                                    <div class="item">
                                        <div class="item">SpringMVC</div>
                                    </div>
                                    <div class="item">
                                        <div class="item">Spring Android</div>
                                    </div>
                                    <div class="item">
                                        <div class="item">Spring Framwork</div>
                                    </div>
                                </div>
                            </div>
                            <div class="title"><i class="dropdown icon"></i>Mybatis </div>
                            <div class="content">
                                <div class="ui animated list" style="margin-left: 1.5rem">
                                    <div class="item">
                                        <div class="item">Mybatis2</div>
                                    </div>
                                    <div class="item">
                                        <div class="item">Mybatis3</div>
                                    </div>
                                    <div class="item">
                                        <div class="item">ibatis</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="thirteen wide column" style="margin-top: 3rem;">
                    <c:forEach items="${articles}" var="item">
                        <div class="ui left aligned container segment">
                            <h2 class="ui header"><a href="${item.link}">${item.title}</a></h2>
                            <p>${item.introduction}</p>
                        </div>
                    </c:forEach>

                    <%--<div class="ui left aligned container segment">--%>
                        <%--<h2 class="ui header">Dogs Roles with Humans</h2>--%>
                        <%--<p>Domestic dogs inherited complex behaviors, such as bite inhibition, from their wolf ancestors, which would have been pack hunters with complex body language. These sophisticated forms of social cognition and communication may account for their trainability, playfulness, and ability to fit into human households and social situations, and these attributes have given dogs a relationship with humans that has enabled them to become one of the most successful species on the planet today.</p>--%>
                    <%--</div>--%>
                    <%--<div class="ui left aligned container segment" style="margin-top: 50px">--%>
                        <%--<h2 class="ui header">Dogs Roles with Humans</h2>--%>
                        <%--<p>Domestic dogs inherited complex behaviors, such as bite inhibition, from their wolf ancestors, which would have been pack hunters with complex body language. These sophisticated forms of social cognition and communication may account for their trainability, playfulness, and ability to fit into human households and social situations, and these attributes have given dogs a relationship with humans that has enabled them to become one of the most successful species on the planet today.</p>--%>
                    <%--</div>--%>
                    <%--<div class="ui left aligned container segment" style="margin-top: 50px">--%>
                        <%--<h2 class="ui header">Dogs Roles with Humans</h2>--%>
                        <%--<p>Domestic dogs inherited complex behaviors, such as bite inhibition, from their wolf ancestors, which would have been pack hunters with complex body language. These sophisticated forms of social cognition and communication may account for their trainability, playfulness, and ability to fit into human households and social situations, and these attributes have given dogs a relationship with humans that has enabled them to become one of the most successful species on the planet today.</p>--%>
                    <%--</div>--%>
                    <%--<div class="ui left aligned container segment" style="margin-top: 50px">--%>
                        <%--<h2 class="ui header">Dogs Roles with Humans</h2>--%>
                        <%--<p>Domestic dogs inherited complex behaviors, such as bite inhibition, from their wolf ancestors, which would have been pack hunters with complex body language. These sophisticated forms of social cognition and communication may account for their trainability, playfulness, and ability to fit into human households and social situations, and these attributes have given dogs a relationship with humans that has enabled them to become one of the most successful species on the planet today.</p>--%>
                    <%--</div>--%>
                    <%--<div class="ui left aligned container segment" style="margin-top: 50px">--%>
                        <%--<h2 class="ui header">Dogs Roles with Humans</h2>--%>
                        <%--<p>Domestic dogs inherited complex behaviors, such as bite inhibition, from their wolf ancestors, which would have been pack hunters with complex body language. These sophisticated forms of social cognition and communication may account for their trainability, playfulness, and ability to fit into human households and social situations, and these attributes have given dogs a relationship with humans that has enabled them to become one of the most successful species on the planet today.</p>--%>
                    <%--</div>--%>
                    <%--<div class="ui left aligned container segment" style="margin-top: 50px">--%>
                        <%--<h2 class="ui header">Dogs Roles with Humans</h2>--%>
                        <%--<p>Domestic dogs inherited complex behaviors, such as bite inhibition, from their wolf ancestors, which would have been pack hunters with complex body language. These sophisticated forms of social cognition and communication may account for their trainability, playfulness, and ability to fit into human households and social situations, and these attributes have given dogs a relationship with humans that has enabled them to become one of the most successful species on the planet today.</p>--%>
                    <%--</div>--%>
                    </div>

                </div>
                <div class="ui grid">
                    <div class="sixteen wide column">
                        <div class="green ui right floated buttons">
                            <button class="ui button active">1</button>
                            <button class="ui button">2</button>
                            <button class="ui button">3</button>
                            <button class="ui button">4</button>
                            <button class="ui button">5</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="ui inverted vertical footer segment">
        <div class="ui container">
            <div class="ui stackable inverted divided equal height centered grid">
                <div class="four wide column">
                    <h4 class="ui inverted header">About Me</h4>
                    <div class="ui inverted link list">
                        <a href="#" class="item">Github</a>
                        <a href="#" class="item">知乎</a>
                        <a href="#" class="item">CSDN</a>
                        <a href="#" class="item">慕课</a>
                    </div>
                </div>
                <div class="four wide column">
                    <h4 class="ui inverted header">Links</h4>
                    <div class="ui inverted link list">
                        <a href="#" class="item">Github</a>
                        <a href="#" class="item">CSDN</a>
                        <a href="#" class="item">慕课</a>
                        <a href="#" class="item">w3school</a>
                    </div>
                </div>
                <div class="four wide column">
                    <h4 class="ui inverted header">Footer Header</h4>
                    <p>&copy; CopyRight By LinXu</p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
