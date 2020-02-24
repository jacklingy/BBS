<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/21
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ShowUserDetailedInfo</title>
</head>
<body>
<h1>Hi， there. This page will show user detailed info by user_id.</h1>
<ul>
    <c:forEach items="userDetail" var="userDetsil">
        <li>${userDetail.userId},${userDetail.imagePath},${userDetail.eMail},
                ${userDetail.phoneNumber},${userDetail.userSignature},${userDetail.sex}
                ${userDetail.signTime}</li>
    </c:forEach>
    <!--signature也可以改为用户的工作单位-->
    <!--测试地址为http://localhost:8088/test/showdetail/1
    -->
</ul>
</body>
</html>
