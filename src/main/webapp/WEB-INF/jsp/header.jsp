
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../../statics/css/layui.css">
<script src="../../statics/layui.js"></script>

<header class="layui-header ">
    <ul class="layui-nav layui-bg-green">
        <li class="layui-nav-item  layui-unselect layui-this" id="a"><a href="/">
            NCU BBS</a></li>
        <!--     <li class="layui-nav-item  layui-unselect "><a href="/">主页</a></li>       -->
        <%--<li class="layui-nav-item" id="b"><a href="/board">板块</a></li>--%>
        <%--<li class="layui-nav-item" id="c"><a href="/">问答</a></li>--%>
        <li class="layui-nav-item">
            <a href="javascript:;">关于</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="">关于本项目</a></dd>
                <dd><a href="">问题反馈</a></dd>
                <dd><a href=""></a></dd>
            </dl>
        </li>
        <%--判断用户是否登录--%>
        <c:if test="${empty user}">
            <li class="layui-nav-item" style="float: right"><a href="/user/register">注册</a></li>
            <li class="layui-nav-item" style="float: right"><a href="/user/login">
                <i class="layui-icon layui-icon-username"></i>登录</a></li>
        </c:if>
        <c:if test="${!empty user}">
            <li class="layui-nav-item" style="float: right">
                <a href=""><i class="layui-icon layui-icon-username">&nbsp;</i>${user.userName}</a>
                <dl class="layui-nav-child">
                    <dd><a href="/user/detail/${user.userId
               }">个人中心</a> </dd>
                    <dd><a href="javascript:signout_confirm()">退出</a></dd>
                </dl>
            </li>

        </c:if>
    </ul>
</header>


<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use(['element','jquery'], function(){
        var element = layui.element;
        var $=layui.$;
        $("#b").click(function(){
            $("#a").removeClass("layui-this ");
            $("#b").addClass("layui-this");

        });
    });
    function signout_confirm()
    {
        layui.use('layer', function(){
            var layer = layui.layer;

            layer.confirm('确定退出?', {icon: 3, title:'提示'}, function(index){
                window.location.href="/user/logout";
                layer.close(index);
            });
        });


    }
</script>
