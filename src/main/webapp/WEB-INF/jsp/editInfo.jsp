<%--
  Created by IntelliJ IDEA.
  User: Cool-
  Date: 2018/12/26
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<script src="../../statics/layui.js"></script>
<html>
<head>
    <title>修改信息</title>
</head>
<body>
<%@ include file="header.jsp" %>

<%--<form action="/test/insertinfo">--%>

<%--要修改的id <input type="number" name="userId"><br>--%>
<%--imagePath <input type="text" name="imagePath"><br>--%>
<%--eMail <input type="text" name="eMail"><br>--%>
<%--phoneNumber<input type="text" name="phoneNumber"><br>--%>
<%--userSignature<input type="text" name="userSignature"><br>--%>
<%--sex <input type="text" name="sex"><br>--%>

<%--<input type="submit" value="submit">--%>
<%--</form>--%>

<div style="width: 500px;height: 500px;margin: 50px auto;">
    <div style="width: 500px;"></div>


    <form class="layui-form" action="/updateInfo" method="post">
        <%--<div class="layui-form-item">--%>
        <%--<label class="layui-form-label">用户名:</label>--%>

        <%--<div class="layui-input-inline">--%>
        <%--<input type="text" id="username" name="username"--%>
        <%--required lay-verify="required" placeholder="" autocomplete="off"--%>
        <%--class="layui-input">--%>
        <%--</div>--%>
        <%--<div id="confirm3" class="layui-form-mid layui-word-aux"></div>--%>
        <%--</div>--%>

        <%----%>
        <%--<div class="layui-form-item">--%>
        <%--<label class="layui-form-label">原密码:--%>
        <%--</label>--%>
        <%--<div class="layui-input-inline">--%>
        <%--<input type="password" name="oldpwd" id="password0" required--%>
        <%--lay-verify="required" placeholder="请输入原始密码" autocomplete="off"--%>
        <%--class="layui-input">--%>
        <%--</div>--%>
        <%--<div id="confirm0" class="layui-form-mid layui-word-aux"></div>--%>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
        <%--<label class="layui-form-label">新密码:--%>
        <%--</label>--%>
        <%--<div class="layui-input-inline">--%>
        <%--<input type="password" name="newpwd" id="password1" required--%>
        <%--lay-verify="required" placeholder="请输入新密码" autocomplete="off"--%>
        <%--class="layui-input">--%>
        <%--</div>--%>
        <%--<div id="confirm1" class="layui-form-mid layui-word-aux"></div>--%>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
        <%--<label class="layui-form-label">重复密码:</label>--%>
        <%--<div class="layui-input-inline">--%>
        <%--<input type="password" name="newpwd1" required lay-verify="required"--%>
        <%--placeholder="请确认新密码" autocomplete="off" class="layui-input">--%>
        <%--</div>--%>
        <%--<div id="confirm2" class="layui-form-mid layui-word-aux"></div>--%>
        <%--</div>--%>


        <div class="layui-form-item">
            <label class="layui-form-label">邮箱:</label>
            <div class="layui-input-inline">
                <input type="text" name="email" required lay-verify="email"
                       placeholder="输入你的邮箱" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话:</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" required
                       placeholder="输入你的手机号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">签名:</label>
            <div class="layui-input-inline">
                <input type="text" name="signature" required
                       placeholder="签名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-input-inline">
            <label class="layui-form-label  ">性别</label>
            <div class=" layui-input-inline" style="width: 80px">
                <input type="radio" name="sex" value="男" title="男">
                <input type="radio" name="sex" value="女" title="女">

            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block ">
                <input type="hidden" name="userId" value="${userInfo.user.userId}">
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="submit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>


<%@include file="footer.jsp" %>
</body>
</html>
<script>
    layui.use('form', function () {
        var form = layui.form();
        form.render();
    });
</script>
