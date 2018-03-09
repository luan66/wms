<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script type="text/javascript" src="/js/jquery/My97DatePicker/WdatePicker.js"></script>

    <title>叩丁狼教育PSS（演示版）-订货报表</title>
    <style>
        .alt td {
            background: black !important;
        }
    </style>
    <script type="text/javascript" src="/js/common_js/commonJs.js"></script>
</head>
<body>
<form id="searchForm" action="/chart/order.do" method="post">
    <div id="container">
        <div class="ui_content">
            <div class="ui_text_indent">
                <div id="box_border">
                    <div id="box_top">搜索</div>
                    <div id="box_center">
                        时间

                        <input type="text" class="ui_input_txt02" name="beginTime" id="beginTime" onclick="WdatePicker"
                               value="<fmt:formatDate value="${qo.beginTime}" pattern="yyyy-MM-dd"/>"/>
                        ~
                        <input type="text" class="ui_input_txt02" name="endTime" onclick="WdatePicker"
                               value="<fmt:formatDate value="${qo.endTime}" pattern="yyyy-MM-dd"/>"/>
                        货品
                        <input type="text" class="ui_input_txt02" name="productName" value="${qo.productName}"/>
                        供应商
                        <select class="ui_select01" name="supplierId">
                            <option value="-1"> ---请选择---</option>
                            <c:forEach items="${suppliers}" var="supplier">
                                <option value="${supplier.id}" ${qo.supplierId==supplier.id?'selected':''}>${supplier.name}</option>
                            </c:forEach>
                        </select>
                        品牌
                        <select class="ui_select01" name="brandId">
                            <option value="-1"> ---请选择---</option>
                            <c:forEach items="${brands}" var="brand">
                                <option value="${brand.id}" ${qo.brandId==brand.id?'selected':''}>${brand.name}</option>
                            </c:forEach>
                        </select>
                        分组
                        <select class="ui_select01" name="groupBy">
                            <c:forEach items="${qo.groupByMap}" var="map">
                                <option value="${map.key}" ${qo.groupBy==map.key?'selected':''}>${map.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div id="box_bottom">
                        <input type="submit" value="查询" class="ui_input_btn01"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui_content">
            <div class="ui_tb">
                <table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <th>分组类型</th>
                        <th>总数量</th>
                        <th>总金额</th>
                    </tr>
                    <tbody>
                    <c:forEach items="${lists}" var="list">
                        <tr>
                            <td>${list.groupByName}</td>
                            <td>${list.totalNumber}</td>
                            <td>${list.totalAmount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</form>
</body>
</html>
