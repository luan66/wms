<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/style/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="/style/common_style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/commonAll.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.validate.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="/js/jquery/dialog/iframeTools.js"></script>
    <title>叩丁狼教育PSS（演示版）-商品管理</title>
    <style>
        .alt td {
            background: black !important;
        }
    </style>
    <script type="text/javascript" src="/js/common_js/commonJs.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".left2right").click(function () {
                var json = $(this).data("json");
                    $.dialog.data("json", json); //将值存起来，供父页面读取
                    $.dialog.close();//关闭窗口
            });

        })
    </script>
</head>
<body>

<div class="ui_content">
    <div class="ui_tb">
        <table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
            <tr>
                <th width="30"><input type="checkbox" id="all"/></th>
                <th>商品图片</th>
                <th>商品名称</th>
                <th>商品编码</th>
                <th>商品品牌</th>
                <th>成本价格</th>
                <th>销售价格</th>
                <th></th>
            </tr>
            <tbody>
            <c:forEach items="${result}" var="d">
                <tr>
                    <td><input type="checkbox" name="IDCheck" class="acb"/></td>
                    <td><img src="${d.smallImagePath}" alt="商品图片" class="list_img_min"/></td>
                    <td>${d.name}</td>
                    <td>${d.sn}</td>
                    <td>${d.brandName}</td>
                    <td>${d.costPrice}</td>
                    <td>${d.salePrice}</td>
                    <td>
                            <%--把数据封装到resulet中,一个map中--%>
                        <input type="button" class="left2right" value="选择商品" data-json='${d.jsonStrng}'>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
</div>
</body>
</html>

