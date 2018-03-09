<%--
  Created by IntelliJ IDEA.
  User: cc450
  Date: 17/12/08/0008
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/js/jquery/echarts/build/dist/echarts.js"></script>
</head>
<body>
<div id="main" style="height:550px;width:800px"></div>
<script type="text/javascript">
    // 路径配置
    require.config({
        paths: {
            echarts: '/js/jquery/echarts/build/dist'
        }
    });

    // 使用
    require(
        [
            'echarts',
            'echarts/chart/pie', // 使用柱状图就加载bar模块，按需加载
            'echarts/chart/funnel' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('main'));

            var option = {
                title : {
                    text: '销售总额',
                    subtext: '${groupBy}',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient : 'vertical',
                    x : 'left',
                    data:${groupByNames}
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {
                            show: true,
                            type: ['pie', 'funnel'],
                            option: {
                                funnel: {
                                    x: '25%',
                                    width: '50%',
                                    funnelAlign: 'left',
                                    max: ${max}
                                }
                            }
                        },
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                series : [
                    {
                        name:'销售额',
                        type:'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:${list}
                    }
                ]
            };


            // 为echarts对象加载数据
            myChart.setOption(option);
        }
    );
</script>
</body>
</html>
