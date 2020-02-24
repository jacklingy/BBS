<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/20
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="../../statics/css/layui.css">
<!-- 引入 Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 包括所有已编译的插件 -->
<script src="../../statics/js/bootstrap.min.js"></script>
<script src="../../statics/layui.js"></script>

<html>
<head>
    <title>显示所有帖子</title>
    <link rel="stylesheet" href="../../statics/css/layui.css">
    <script src="../../statics/layui.js"></script>
    <style>
        /*td {*/
        /*margin: 20px;*/
        /*}*/
        .tinfo {
            max-width: 50px;
        }

        th {
            text-align: center;
        }
    </style>
</head>
<body>
<%--<h1>Here would be all of the topics</h1>--%>
<%@include file="header.jsp" %>

<table class="layui-table" style="width: 85%;margin: 2%">
    <%--<colgroup>--%>
    <%--<col width="150">--%>
    <%--<col width="200">--%>
    <%--<col>--%>
    <%--</colgroup>--%>
    <thead>
    <tr>
        <th class="tinfo">帖子id</th>
        <th class="tinfo">板块号</th>
        <th>标题</th>
        <th>用户id</th>
        <th>创建时间</th>
        <th>阅读量</th>
        <th>回复量</th>
        <th>是否加精</th>
        <th>是否置顶</th>
        <th>加精/取消</th>
        <th>置顶/取消</th>
        <th>删除</th>

    </tr>
    </thead>
    <tbody>
    <C:forEach items="${topics}" var="topics">
        <tr>
            <td>
                    ${topics.topicId}
            </td>
            <td>
                <a href="/board/${topics.boardId}" target="_blank">
                        ${topics.boardId}
                </a>
            </td>
            <td>
                <a href="/article/${topics.topicId}" target="_blank">
                        ${topics.topicTitle}
                </a>
            </td>
            <td>
                <a href="/user/detail/${topics.userId}" target="_blank">
                        ${topics.userId}
                </a>
            </td>
            <td>
                    ${topics.createTime}
            </td>
            <td>
                    ${topics.topicViews}
            </td>
            <td>
                    ${topics.topicReplies}
            </td>
            <td>
                <c:if test="${topics.digest==1}">
                    <span class="layui-badge">精</span>

                </c:if>
                <c:if test="${topics.digest==0}">
                    <span></span>
                </c:if>
            </td>
            <td>
                <c:if test="${topics.istop==1}">
                    <span class="layui-badge">顶</span>

                </c:if>
                <c:if test="${topics.istop==0}">
                    <span></span>
                </c:if>
            </td>
            <td>
                <c:if test="${topics.digest==0}">
                    <form action="/jiajing" method="post">
                        <input class="layui-btn layui-btn-radius layui-btn-warm" type="submit" name="hot"
                               value="加精"/>
                        <input type="hidden" name="topic_id" value="${topics.topicId}">
                    </form>
                </c:if>
                <c:if test="${topics.digest==1}">
                    <form action="/canceljiajing" method="post">
                        <input class="layui-btn layui-btn-radius layui-btn-normal" type="submit" name="unhot"
                               value="取消"/>
                        <input type="hidden" name="topic_id" value="${topics.topicId}">
                    </form>
                </c:if>
            </td>
            <td>
                <c:if test="${topics.istop==0}">
                    <form action="/top" method="post">
                        <input class="layui-btn layui-btn-radius layui-btn-warm" type="submit" name="hot"
                               value="置顶"/>
                        <input type="hidden" name="topic_id" value="${topics.topicId}">
                    </form>
                </c:if>
                <c:if test="${topics.istop==1}">
                    <form action="/canceltop" method="post">
                        <input class="layui-btn layui-btn-radius layui-btn-normal" type="submit" name="unhot"
                               value="取消"/>
                        <input type="hidden" name="topic_id" value="${topics.topicId}">
                    </form>
                </c:if>
            </td>
            <td>
                <form action="/DeleteTopic" method="post">
                    <input class="layui-btn layui-btn-radius layui-btn-danger" type="submit" name="unhot"
                           value="删除"/>
                    <input type="hidden" name="topic_id" value="${topics.topicId}">
                </form>
            </td>

        </tr>
    </C:forEach>

    </tbody>
</table>


<!--怎样绑定按钮的和topic的id
插件看管理员删帖部分的删除功能是怎样实现的-->

<%--<ol>--%>

<%--<c:forEach items="${topics}" var="topics">--%>


<%--<li>--%>
<%--${topics.topicId},${topics.boardId},${topics.topicTitle},--%>
<%--${topics.userId},${topics.createTime},${topics.topicViews}--%>
<%--,${topics.topicReplies},${topics.digest},--%>
<%--</li>--%>
<%--</c:forEach>--%>
<%--</ol>--%>

<%@include file="footer.jsp" %>
</body>


</html>
<script>
    layui.use(['jquery', 'layer'], function () {
        var $ = layui.$;
        var layer = layui.layer;
        var id_btn =

            $(document).ready(function () {
                $("#" + btn_zhiding).click(function () {
                    layer.msg("ni");
                })
            })
    })

    function show() {
        // layer.msg("操作成功")

    }

    // layer.msg("设置成功");

</script>
