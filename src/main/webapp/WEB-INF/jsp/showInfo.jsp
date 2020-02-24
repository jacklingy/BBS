<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/20
  Time: 22:13
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
    <title>用户信息</title>
    <link rel="stylesheet" href="../../statics/css/layui.css">
</head>
<body>
<%@include file="header.jsp" %>

<table class="layui-table" style="width: 96%;margin: 2%">
    <thead>
    <tr>
        <th>用户id</th>
        <th>用户名</th>
        <th>身份</th>
        <th>积分</th>
        <%--<th>最后访问</th>--%>
        <th>最后访问IP</th>
        <th>邮箱</th>
        <th>电话</th>
        <th>性别</th>
        <th>封禁解封</th>
        <th>删除用户</th>
        <%--<th>设置身份</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${infoList}" var="info">
        <tr>
            <td>
                    ${info.user.userId}
            </td>
            <td>
                <a href="/user/detail/${info.user.userId}" target="_blank">
                        ${info.user.userName}
                </a>
            </td>
            <td>
                <a href="">
                        ${info.user.userType}
                </a>
            </td>
            <td>
                    ${info.user.credit}
            </td>
            <%--<td>--%>
                    <%--${info.user.lastVisit}--%>
            <%--</td>--%>
            <td>
                    ${info.user.lastIp}
            </td>


            <td>
                <a href="mailto:${info.userDetailed.eMail}">
                        ${info.userDetailed.eMail}
                </a>
            </td>

            <td>
                    ${info.userDetailed.phoneNumber}
            </td>

            <td>
                    ${info.userDetailed.sex}
            </td>

            <td>
                <c:if test="${info.user.locked==1}">
                    <form action="/UnLockUser" method="POST">
                        <input class="layui-btn layui-btn-radius layui-btn-normal" type="submit" name="forbidden"
                               value="解封" onclick=""/>
                        <input type="hidden" name="name" value="${info.user.userName}">
                    </form>
                </c:if>
                <c:if test="${info.user.locked==0}">
                    <form action="/LockUser" method="POST">
                        <input class="layui-btn layui-btn-radius layui-btn-danger" type="submit" name="forbidden"
                               value="封禁" onclick=""/>
                        <input type="hidden" name="name" value="${info.user.userName}">
                    </form>
                </c:if>
            </td>
            <td>
                <form action="/deleteUser" method="post">
                    <input type="hidden" name="userId" value=" ${info.user.userId}">
                    <input class="layui-btn layui-btn-radius layui-btn-danger"
                           type="submit" name="" value="删除用户">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>


</table>


<%--<ul>--%>
<%--<c:forEach items="${users}" var="users">--%>

<%--<li>--%>
<%--${users.userId},${users.userName},${users.password},${users.userType}--%>
<%--,${users.locked},${users.credit}--%>
<%--</li>--%>
<%--</c:forEach>--%>
<%--</ul>--%>
<%@include file="footer.jsp" %>
</body>
</html>
