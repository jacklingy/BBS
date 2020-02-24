
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<script src="../../statics/layui.js"></script>
<html>
<head>
    <title>发帖</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="layui-container" style="height: 800px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>
            <span class="layui-badge">快捷导航</span></legend>
    </fieldset>
    <div class="layui-anim layui-anim-up">
         <span class="layui-breadcrumb" lay-separator="/">
  <a href="/">全部</a>
  <a href="/board/1">生活</a>
  <a href="/board/2">情感</a>
  <a href="/board/3">大学</a>
  <a href="/board/4">旅游</a>
  <a href="/board/5">美食</a>

</span>

    </div>
    <div style="height: 50px"></div>
    <form class="layui-form" action="/addTopicSuccess" style="width: 800px;" method="post">
        <input type="hidden" name="userId" value="${user.userId}">
        <div class="layui-form-item">
            <label class="layui-form-label">选择板块</label>
            <div class="layui-input-block" style="width: 80px">
                <select name="boardId" lay-filter="sel">
                    <c:forEach items="${boardList}" var="b">
                        <option value="${b.boardId}">${b.boardName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">标题:</label>
            <div class="layui-input-block">
                <input type="text" id="title" name="title" placeholder="请输入帖子标题"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <textarea id="demo" name="text" style="display: none;"></textarea>
        <div style="width: 120px;float: right">
            <input type="hidden" name="post_id" value=${post_id}>
            <input type="submit" id="put" class="layui-btn  layui-btn-fluid">
        </div>

    </form>
</div>
<%@include file="footer.jsp" %>
<script>
    var index;
    layui.use('layedit', function () {
        var layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                url: '/uploadInterface' //接口url
                , type: 'post' //默认post
            }
        });
//注意：layedit.set 一定要放在 build 前面，否则配置全局接口将无效。
        index = layedit.build('demo', {height: 500}); //建立编辑器
    });
    var text;
    var select;
    layui.use('layedit', function () {
        var layedit = layui.layedit;
        text = layedit.getContent(index);
    }); //获取内容
    layui.use('form', function () {
        var form = layui.form;
        form.on('select(sel)', function (data) {
            select = data.value;
        });
    });
</script>
</body>
</html>
