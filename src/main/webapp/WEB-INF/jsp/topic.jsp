<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/23
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="../../statics/css/layui.css">
<script src="../../statics/layui.js"></script>
<html>

<%--本页面是浏览每个帖子的主页面--%>
<head>
    <title>${host.topicTitle}</title>
    <style>
        img {
            max-width: 250px;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<!--页面中所有图片大小为200px-->

<div class="layui-container">
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
    <div style="height: 20px"></div>

    <div class="layui-row layui-col-space10" style="height: auto">
        <div class="layui-col-md3">
            <fieldset class="layui-elem-field">
                <div class="layui-field-box" style="min-height: 350px;background-color: white">
                    <div>
                        楼主：<a href="/user/detail/${userInfo.userId}">${hostName}</a>
                        <!--由controller传入hostname用户名-->
                    </div>
                    <div>
                        <%--<img src="${userInfo.imagePath}"--%>
                        <%--alt="测试头像" width="200px;">--%>
                        <c:if test="${!empty userInfo.imagePath}">
                            <img style="margin: 10px;max-width: 180px; " src="${userInfo.imagePath}"
                                 alt="头像被火星人抢走了">
                        </c:if>
                        <c:if test="${empty userInfo.imagePath}">
                            <img style="margin: 10px;max-width: 180px;" src="/userPic/pic.jpg" alt="头像被火星人抢走了">
                        </c:if>
                    </div>
                    <br/>
                    <br/>
                    <p style="text-align: center">
                        签名:${userInfo.userSignature}
                    </p>
                    <p style="text-align: center">
                        联系我:<a href="mailto:${userInfo.eMail}">${userInfo.eMail}</a>
                    </p>

                </div>
            </fieldset>
        </div>
        <div class="layui-col-md9">
            <fieldset class="layui-elem-field">
                <div class="layui-field-box" style="min-height: 350px;background-color: white">
                    <p style="font-size: 20px">${host.topicTitle}
                        <c:if test="${host.digest==1}">&nbsp;&nbsp;<span class="layui-badge">
                            精</span>
                        </c:if>
                    </p>
                    <br/>
                    <blockquote class="layui-elem-quote layui-quote-nm">发表于：
                        <fmt:formatDate value="${host.createTime}" type="both"
                                        dateStyle="medium"
                                        timeStyle="medium"/>
                        <div style="float: right">浏览数：${host.topicViews}</div>
                    </blockquote>
                    &nbsp;&nbsp; ${hostText}


                    <!--host的按钮-->
                    <%--${hostPostId}--%>

                    <c:if test="${host.userId==user.userId||user.userId==1}">
                        <form action="/updatepost/${hostPostId}" method="post"
                              style="position:absolute;right:50px;bottom:25px;width:50px;">
                                <%--<input type="hidden" name="_method" value="DELETE">--%>
                            <input type="hidden" name="postId" value="${hostPostId}">
                            <input type="hidden" name="topicId" value="${host.topicId}">
                            <button
                                    class="layui-btn-sm layui-btn layui-btn-normal"
                                    value="编辑">编辑
                            </button>
                        </form>
                    </c:if>

                    <c:if test="${host.userId==user.userId||user.userId==1}">

                        <%--deleteTopic--%>

                        <form action="/deleteTopic" method="post"
                              style="position:absolute;right:0px;bottom:25px;width:50px;">
                            <input type="hidden" name="_method" value="POST">
                            <input type="hidden" name="postId" value="${hostPostId}">
                            <input type="hidden" name="topicId" value="${host.topicId}">
                            <input type="submit" class="layui-btn-sm layui-btn" value="删除">
                        </form>
                    </c:if>


                </div>

            </fieldset>
        </div>
    </div>


    <c:forEach items="${pageInfo.list}" var="p">
        <div class="layui-row layui-col-space10" style="min-height: 350px">
            <div class="layui-col-md3">
                <fieldset class="layui-elem-field">
                    <div class="layui-field-box" style="min-height: 300px;background-color: white">
                        <div>
                            用户名：<a href="/user/detail/${p.userId}">${p.postTitle}</a>
                        </div>

                        <br/>
                        <div>
                            <c:if test="${!empty p.picPath}">
                                <img style=" margin: 10px;max-width: 180px; " src="${p.picPath}" alt="头像被火星人抢走了">
                            </c:if>
                            <c:if test="${empty p.picPath}">
                                <img style=" margin: 10px;max-width: 180px;" src="/userPic/pic.jpg"
                                     alt="头像被火星人抢走了">
                            </c:if>
                                <%--<img src="${p.picPath}" alt="头像加载失败"> ;--%>
                        </div>
                        <br/>
                        <br/>
                    </div>
                </fieldset>
            </div>
            <div class="layui-col-md9">
                <fieldset class="layui-elem-field">
                    <div class="layui-field-box" style="min-height: 300px;background-color: white">
                        <blockquote class="layui-elem-quote layui-quote-nm">回复于：

                            <fmt:formatDate value="${p.createTime}"
                                            type="both"
                                            dateStyle="medium"
                                            timeStyle="medium"/>
                        </blockquote>
                        &nbsp;&nbsp;
                        <!--帖子内容-->
                            ${p.postText}
                        <!--操作按钮-->

                            <%--如果是管理员或者吧主本人，显示编辑和修改按钮，其他用户测不会显示操作button--%>
                        <c:if test="${host.userId==user.userId||user.userId==1||p.userId==user.userId}">
                            <form action="/updatepost/${p.postId}" method="post"
                                  style="position:absolute;right:50px;bottom:25px;width:50px;">
                                    <%--<input type="hidden" name="_method" value="DELETE">--%>
                                <input type="hidden" name="postId" value="${p.postId}">
                                <input type="hidden" name="topicId" value="${host.topicId}">
                                <button
                                        class="layui-btn-sm layui-btn layui-btn-normal"
                                        value="编辑">编辑
                                </button>
                            </form>
                        </c:if>

                        <c:if test="${host.userId==user.userId||user.userId==1||p.userId==user.userId}">
                            <form action="/deletePost" method="post"
                                  style="position:absolute;right:0px;bottom:25px;width:50px;">
                                <input type="hidden" name="_method" value="DELETE">
                                <input type="hidden" name="postId" value="${p.postId}">
                                <input type="hidden" name="topicId" value="${host.topicId}">
                                <input type="submit" class="layui-btn-sm layui-btn" value="删除">
                            </form>
                        </c:if>
                    </div>
                </fieldset>
            </div>
        </div>
    </c:forEach>
    <div style="float: right;height: 40px">
        <p>第${pageInfo.pageNum}页,共${pageInfo.pages}页</p>
        <c:if test="${pageInfo.hasPreviousPage}">
            <a href="/article/${host.topicId}?page=${pageInfo.prePage}">上一页
                <i class="layui-icon layui-icon-prev"

                   style="font-size: 15px; color: #39ac47;"></i></a>
        </c:if>
        &nbsp;
        <c:if test="${pageInfo.hasNextPage}">
            <a href="/article/${host.topicId}?page=${pageInfo.nextPage}">下一页
                <i class="layui-icon layui-icon-next"
                   style="font-size: 15px; color: #39ac47;"></i></a>
        </c:if>
    </div>
    <div class="layui-row layui-col-space10">
        <textarea id="demo" style="display: none;"></textarea>
        <button onclick="rE()" class="layui-btn" style="float: right">回帖</button>
    </div>
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
        index = layedit.build('demo', {height: 300}); //建立编辑器
    });

    function rE() {
        var text;
        layui.use('layedit', function () {
            var layedit = layui.layedit;
            text = layedit.getContent(index);
        });
        if (${!empty user}) {
            layui.use(['jquery', 'layer'], function () {
                var ds = {};
                ds.boardId = '${host.boardId}';
                ds.topicId = '${host.topicId}';
                ds.userId = '${user.userId}';
                ds.postText = text;
                ds.postType = 0;
                var $ = layui.$ //重点处
                    , layer = layui.layer;
                $.ajax({
                    type: 'put',
                    url: '/postText',
                    contentType: 'application/json',
                    //数据格式是json串,商品信息
                    data: JSON.stringify(ds),
                    success: function (data) {//返回json结果
                        location.reload();
                    }
                });
            });

        } else {
            layer.msg("请先登录！");
        }
    }

    function al() {
        layer.open({
            title: 'testTitle',
            type: 1,
            content: 'testcontent',
            area: 'auto'//这里content是一个普通的String
        });

    }


</script>
</body>


</html>





