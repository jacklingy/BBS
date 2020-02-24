
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<script src="../../statics/layui.js"></script>
<html>
<head>
    <title>添加用户信息测试</title>
</head>
<body>
<%@ include file="header.jsp"%>

    <form action="/test/insertinfo">

       要修改的id   <input type="number" name="userId"><br>
      imagePath  <input type="text" name="imagePath"><br>
        eMail      <input type="text" name="eMail"><br>
      phoneNumber<input type="text" name="phoneNumber"><br>
        userSignature<input type="text" name="userSignature"><br>
        sex         <input type="text" name="sex"><br>

        <input type="submit" value="submit">
    </form>
</body>
</html>
