<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/style/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="/style/common_style.css" rel="stylesheet" type="text/css">
    <link href="/js/jquery/fancyBox/helpers/jquery.fancybox-thumbs.css"  type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/commonAll.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.validate.js"></script>
    <script type="text/javascript" src="/js/jquery/fancyBox/helpers/jquery.fancybox-thumbs.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.artDialog.js?skin=blue"></script>

    <title>叩丁狼教育PSS（演示版）-商品管理</title>
    <style>
        .alt td {
            background: black !important;
        }
    </style>
    <script type="text/javascript" src="/js/common_js/commonJs.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".fancybox-thumbs").fancybox({
                prevEffect : 'none',
                nextEffect : 'none',

                closeBtn  : true,
                arrows    : true,
                nextClick : true,

                helpers : {
                    thumbs : {
                        width  : 30,
                        height : 30
                    }
                }
            });
        });

    </script>
</head>
<body>
<form id="searchForm" action="/product/query.do" method="post">
    <div id="container">
        <div class="ui_content">
            <div class="ui_text_indent">
                <div id="box_border">
                    <div id="box_top">搜索</div>
                    <div id="box_center">
                        关键字
                        <input type="text" class="ui_input_txt02" name="keyword" value="${qo.keyword}"/>
                        所属部门
                        <select class="ui_select01" name="brandId">
                            <option value="-1"> ---请选择---</option>
                            <c:forEach items="${brands}" var="brand">
                                <option value="${brand.id}" ${qo.brandId==brand.id?'selected':''}>${brand.name}</option>
                            </c:forEach>
                        </select>

                    </div>
                    <div id="box_bottom">
                        <input type="submit" value="查询" class="ui_input_btn01"/>
                        <input type="button" value="新增" class="ui_input_btn01 btn_input"
                               data-url="/product/input.do"/>
                    </div>
                </div>
            </div>
        </div>
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
                    <c:forEach items="${result.data}" var="d">
                        <tr>
                            <td><input type="checkbox" name="IDCheck" class="acb"/></td>
                            <td> <a class="fancybox-thumbs list_img" data-fancybox-group="thumb" href="${d.imagePath}" title="${d.name}">
                                <img src="${d.smallImagePath}" alt="商品图片" class="list_img_min"/></a>
                            </td>
                            <td>${d.name}</td>
                            <td>${d.sn}</td>
                            <td>${d.brandName}</td>
                            <td>${d.costPrice}</td>
                            <td>${d.salePrice}</td>
                            <td>
                                <a href="/product/input.do?id=${d.id}">编辑</a>

                                <a href="javascript:;" data-id="${d.id}&imagePath=${d.imagePath}" class="btn_delete"
                                   data-url="/product/delete.do?id="
                                >删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <%--分页操作--%>
            <jsp:include page="/WEB-INF/views/commonPage/commonPage.jsp"></jsp:include>
        </div>
    </div>
</form>
</body>
</html>

