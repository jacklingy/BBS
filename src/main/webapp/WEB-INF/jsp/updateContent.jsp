<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/23
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>编辑帖子内容</title>
</head>
<body>
<%@include file="header.jsp" %>


<h1>在下方编辑帖子内容</h1>

<!--需要获取post_id,检查当前登录用户是否和post的user_id一致,
不一致给出提示信息
-->

<div style="height: 50px"></div>

<form class="layui-form" action="/updatestore" style="width: 60%;" method="POST">
    <%--<input type="hidden" name="userId" value="${user.userId}">--%>

    <%--<label class="layui-form-label">选择板块</label>--%>
    <%--<div class="layui-input-block" style="width: 80px">--%>
    <%--<select name="boardId" lay-filter="sel">--%>
    <%--<c:forEach items="${boardList}" var="b">--%>
    <%--<option value="${b.boardId}">${b.boardName}</option>--%>
    <%--</c:forEach>--%>
    <%--</select>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
    <%--<label class="layui-form-label">标题:</label>--%>
    <%--<div class="layui-input-block">--%>
    <%--<input type="text" id="title" name="title" placeholder="请输入帖子标题"--%>
    <%--autocomplete="off" class="layui-input">--%>
    <%--</div>--%>
    <%--</div>--%>

    <div class="layui-form-item">
        <textarea id="demo" name="post_text" style="display: none;width: 60%">${post_text}</textarea>

    </div>
    <div class="layui-form-item">
        <div style="width: 120px;float: right">
            <input type="hidden" name="post_id" value=${post_id}>
            <!--      <input type="hidden" name="post_text" value=" ">
            -->
            <input type="submit" id="put" class="layui-btn  layui-btn-fluid">
        </div>
    </div>
        <%--<div class="layui-form-item">--%>
            <%--<input type="hidden" name="topic_ip" value="1248">--%>

        <%--</div>--%>



    <%--只需要传一个post_id,和post内容;--%>

</form>


<%--<div>--%>
    <%--这是post_id: ${post_id};--%>
    <%--<br>--%>
    <%--这是post_text: ${post_text};--%>
<%--</div>--%>


<%@include file="footer.jsp" %>

</body>
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
        index = layedit.build('demo', {height:600}); //建立编辑器

    });
    var post_text;
    // var select;
    layui.use('layedit', function () {
        var layedit = layui.layedit;
        post_text = layedit.getContent(index);

    }); //获取内容
    // layui.use('form', function () {
    //     // var form = layui.form;
    //     // form.on('select(sel)', function (data) {
    //     //     select = data.value;
    //     // });
    // });
    // layui.use('form',function () {
    //     var form=layui.form;
    //     form.on('submit',)
    //
    // })
</script>
</html>
