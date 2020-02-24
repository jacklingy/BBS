
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<!-- 引入 Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 包括所有已编译的插件 -->
<script src="../../statics/js/bootstrap.min.js"></script>
<script src="../../statics/layui.js"></script>
<script src="loginCheck.js"></script>
<html>
<head>
    <title>欢迎来到NCU BBS!</title>
</head>
<body>
<%@include file="header.jsp" %>

<div class="layui-container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>
            <span class="layui-badge">快捷导航</span></legend>
    </fieldset>
    <div class="layui-anim layui-anim-up">
        <span class="layui-breadcrumb" lay-separator="/">
            <a href="/">全部</a>
            <c:forEach items="${boardList}" var="board">
                <a href="/board/${board.boardId}">${board.boardName}</a>
            </c:forEach>
</span>
    </div>

    <div style="height: 20px"></div>
    <div class="layui-row layui-col-space10" style="height: 1200px">
        <div class="layui-col-md9">

            <!--置顶-->
            <div class="grid-demo grid-demo-bg1">
                <fieldset class="layui-elem-field">
                    <legend>置顶帖</legend>
                    <table class="table table-striped" style="background-color: white">
                        <tbody>
                        <c:forEach items="${topList}" var="top">
                            <tr>
                                <td style="font-size: 15px">
                                    <span class="layui-badge">顶</span>
                                        <%--<c:if test="${top.isTop==1}">--%>
                                        <%--&lt;%&ndash;<span class="layui-badge">顶</span> &nbsp;&nbsp;&ndash;%&gt;--%>
                                        <%--</c:if>--%>

                                    <a href="/article/${top.topicId}">${top.topicTitle}</a>
                                    &nbsp;&nbsp;
                                    <i style="font-size: 12px;color: gray">-<fmt:formatDate value="${top.createTime}"
                                                                                            type="date"/></i>
                                    <div style="float: right">${top.topicViews}</div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </div>

            <div class="grid-demo grid-demo-bg1">

                <!--修改了高度-->

                <fieldset class="layui-elem-field" style="">
                    <legend>近期热帖</legend>
                    <table class="table table-striped" style="background-color: white">
                        <tbody>
                        <c:forEach items="${hotList}" var="t">
                            <tr>
                                <td style="font-size: 15px">
                                    <c:if test="${t.digest==1}">
                                        <span class="layui-badge">精</span> &nbsp;&nbsp;
                                    </c:if>
                                    <a href="/article/${t.topicId}">${t.topicTitle}</a>
                                    &nbsp;&nbsp;
                                    <i style="font-size: 12px;color: gray">-<fmt:formatDate value="${t.createTime}"
                                                                                            type="date"/></i>
                                    <div style="float: right">${t.topicViews}</div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </div>
            <div class="grid-demo grid-demo-bg1">

                <!--修改了高度-->


                <fieldset class="layui-elem-field" style="height: auto">
                    <legend>新贴榜</legend>
                    <table class="table table-striped" style="background-color: white">
                        <tbody>
                        <c:forEach items="${newList}" var="t">
                            <tr>
                                <td style="font-size: 15px">
                                    <c:if test="${t.digest==1}">
                                        <span class="layui-badge">精</span> &nbsp;&nbsp;
                                    </c:if>
                                    <c:if test="${t.isneed==1}">
                                        <span class="layui-badge  layui-bg-orange">赏</span>
                                        &nbsp;&nbsp;
                                    </c:if>
                                    <a href="/article/${t.topicId}">${t.topicTitle}</a>
                                    &nbsp;&nbsp;
                                    <i style="font-size: 12px;color: gray">-<fmt:formatDate value="${t.createTime}"
                                                                                            type="date"/></i>
                                    <div style="float: right">${t.topicViews}</div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </div>

            <div class="grid-demo grid-demo-bg1">
                <fieldset class="layui-elem-field">
                    <legend>近期新用户</legend>
                    <div class="layui-field-box">
                        <c:forEach items="${recentUser}" var="r">
                            <div style="width: 60px ;height: 70px;float: left ;margin-right: 15px ;margin-bottom: 15px">
                                <img src="${r.imagePath}" onerror=this.src="/userPic/pic.jpg"
                                     style="width: 65px; height: 65px">
                                <a align="center" href="/user/detail/${r.userId}"><p align="center">${r.userName}</p>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="layui-col-md3">

            <c:if test="${empty user}">
                <div class="grid-demo">
                    <fieldset class="layui-elem-field">
                        请登录
                    </fieldset>
                    <div style="height: auto;margin: 0 auto;">
                        <form class="layui-form" action="/loginSuccess" method="post">
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="float: left;width:30%">用户名:</label>
                                <div class="layui-input-inline" style="float: right;width: 60%">
                                    <input type="text" name="username" id="username" required lay-verify="required"
                                           placeholder="请输入用户名" autocomplete="off" class="layui-input">
                                </div>
                                    <%--<div id="checkUN" class="layui-form-mid layui-word-aux" style="clear: both"></div>--%>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label" style="float: left;width: 30%;">密码:</label>
                                <div class="layui-input-inline" style="float: right;width: 60%">
                                    <input type="password" name="password" id="password" required lay-verify="required"
                                           placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" id="submit" lay-submit lay-filter="formDemo">登录</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </c:if>
            <c:if test="${!empty user}">
                <div class="grid-demo">

                    <a href="/user/detail/${user.userId}" target="_blank">
                        <fieldset class="layui-elem-field">欢迎用户：
                                ${user.userName} !

                            <div style="height: auto;margin: 0px;">
                                    <%--<img style="padding: 5% 10%; max-width:250px " src="${userDetail.imagePath}" alt="头像被火星人抢走了">--%>
                                <c:if test="${!empty userDetail.imagePath}">
                                    <img style="padding: 5% 10%; max-width:250px " src="${userDetail.imagePath}"
                                         alt="头像被火星人抢走了">
                                </c:if>
                                <c:if test="${empty userDetail.imagePath}">
                                    <img style="padding: 5% 10%;width: 200px; max-width:250px ;
                                    border-radius: 100%" src="/userPic/pic.jpg"
                                         alt="头像被火星人抢走了">
                                </c:if>
                            </div>
                        </fieldset>
                    </a>


                    <br/>
                    <br/>
                        <%--<p style="text-align: center">--%>
                        <%--签名:${}--%>
                        <%--</p>--%>
                        <%--<p style="text-align: center">--%>
                        <%--联系我:<a href="mailto:${userDetail.eMail}">${userDetail.eMail}</a>--%>
                        <%--</p>--%>
                </div>
                <br/>
                <br/>
                <br/>
                <%--<button id="new" class="layui-btn  layui-btn-fluid">--%>
                <%--<i class="layui-icon">&#xe608;</i> 发帖--%>
                <%--</button>--%>


                <div>
                    <button class="layui-btn  layui-btn-fluid" id="new" style="width: 48%; float: left;
margin-top: 20px;">
                        <i class="layui-icon"></i> 发帖
                    </button>
                    <button class="layui-btn  layui-btn-fluid" id="help" style="width: 48%; float: right;
margin-top: 20px;">
                        <i class="layui-icon"></i>求助
                    </button>
                    <div style="clear: both"></div>
                </div>
            </c:if>


            <c:if test="${!empty helpList}">
                <div class="grid-demo grid-demo-bg1">
                    <fieldset class="layui-elem-field" style="height: auto">
                        <legend style="text-align: center">悬赏</legend>
                        <table class="table table-striped" style="background-color: white">
                            <tbody>
                            <c:forEach items="${helpList}" var="help">
                                <tr>
                                    <c:if test="${help.isneed==1}">
                                        <td style="font-size: 15px">
                                            <span class="layui-badge  layui-bg-orange">赏</span>
                                            &nbsp;&nbsp;
                                            <a href="/article/${help.topicId}">${help.topicTitle}</a> &nbsp;&nbsp;
                                            <i style="font-size: 12px;color: gray">-
                                                <fmt:formatDate value="${help.createTime}" type="date"/>
                                            </i>
                                            <div style="float: right">${help.topicViews}</div>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </fieldset>
                </div>
            </c:if>


            <%--<br/>--%>
            <%--<button id="new" class="layui-btn  layui-btn-fluid">--%>
            <%--<i class="layui-icon">&#xe608;</i> 发帖--%>
            <%--</button>--%>


            <br/>
            <br/>
            <div class="grid-demo">
                <fieldset class="layui-elem-field">
                    <legend>论坛公告</legend>
                    <div class="layui-field-box" style="height: 400px">
                        欢迎来到NCU BBS，这里是NCU的非官方BBS，请大家遵守BBS规则，文明发言！

                    </div>
                </fieldset>
            </div>

        </div>
    </div>

</div>
<%@include file="footer.jsp" %>
</body>
<script>
    layui.use(['jquery', 'layer'], function () {
        var $ = layui.$ //重点处
            , layer = layui.layer;
        $(document).ready(function () {
            $("#new").click(function () {
                if (${empty user}) {
                    layer.msg("请先登录！");
                } else {
                    window.location.href = "/addTopic";
                }
            });
        });

        $(document).ready(function () {
            $("#help").click(function () {
                if (${empty user}) {
                    layer.msg("请先登录！");
                } else {
                    window.location.href = "/enterneed";
                }
            });
        });
    })
    layui.use(['form', 'layer', 'jquery'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        form.on('submit(formDemo)', function () {
            var name = $('#username').val();
            var pwd = $('#password').val();
            var flag = 0;
            $.ajax({
                url: "/checkLogin",
                type: "post",
                data: {"username": name, "password": pwd},
                dataType: "json",
                async: false,
                success: function (data) {
                    flag = data;
                }
            });
            switch (flag) {
                case 0:
                    return true;
                case 1:
                    layer.msg("用户被锁定！");
                    return false;
                case 2:
                    layer.msg("密码错误！");
                    return false;
                case 3:

                    layer.msg("用户名不存在！");
                    return false;
            }
        });
    });

    //判断用户名是否存在
    layui.use(['jquery', 'layer'], function () {
        var $ = layui.$ //重点处
            , layer = layui.layer;
        $(document).ready(function () {
            check();
        });

        function check() {
            $('#username').blur(function () {
                var name = $('#username').val();

                $.ajax({
                    url: "/checkUser",
                    type: "post",
                    data: {"userName": name},
                    dataType: "json",
                    success: function (data) {
                        if (data === true) {
                            document.getElementById("checkUN").innerHTML = "    <i class=\"layui-icon layui-icon-ok-circle\" style=\"font-size: 30px; color: #39ac47;\"></i>\n";

                        } else {
                            document.getElementById("checkUN").innerHTML = "用户名不存在";

                        }
                    }
                });


            });
        }
    });
</script>
</html>
