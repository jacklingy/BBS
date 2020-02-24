<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/26
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>统计图表</title>
    <script src="../../statics/echarts.js"></script>
    <link rel="stylesheet" href="../../statics/css/layui.css">
    <script src="../../statics/layui.js"></script>
    <style>
        body {
            width: 100%;
        }

        .left {
            position: relative;
            width: 600px;
            height: 600px;
            float: left;
        }

        .right {
            width: 600px;
            height: 600px;
        }

        .l {
            position: relative;

            float: left;

        }

        .r {
            position: relative;

            float: right;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>


<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md6" style="text-align: center">

            <div>
                <div id="main" class="left"></div>
                <div><h2>帖子分类占比</h2></div>
            </div>

        </div>
        <div class="layui-col-md6" style="text-align: center">
            <div>
                <div id="main2" class="right"></div>
                <div><h2>男女比</h2>
                </div>

            </div>

        </div>
    </div>

</div>


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        series: [
            {
                name: '帖子占比',
                type: 'pie',
                radius: '55%',
                roseType: 'angle',
                data: [
                    {value: ${b1}, name: '生活'},
                    {value: ${b2}, name: '情感'},
                    {value: ${b3}, name: '大学'},
                    {value: ${b4}, name: '旅游'},
                    {value: ${b5}, name: '美食'},
                    {value: ${b99}, name: '问答'}
                ]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);


    var myChart2 = echarts.init(document.getElementById('main2'),'light');

    // 指定图表的配置项和数据
    var option2 = {
        series: [
            {
                name: '访问来源',
                type: 'pie',
                radius: '55%',
                roseType: 'angle',
                data: [
                    {value: ${male}, name: '男'},
                    {value: ${female}, name: '女'},

                ]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart2.setOption(option2);


</script>

<%@include file="footer.jsp" %>

</body>
</html>
