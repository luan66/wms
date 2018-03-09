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
    <title>叩丁狼教育PSS（演示版）-即使库存报表</title>
    <style>
        .alt td {
            background: black !important;
        }
    </style>
    <script type="text/javascript" src="/js/common_js/commonJs.js"></script>
    <%--js代码--%>
    <script type="text/javascript">
        //选中所有的复选框并提交到后台,用ajax请求去删除
        $(function () {
            //监听复选框改变就触发一个事件
            $("#all").change(function () {
                //选中所有的复选框
                $(".acb").prop("checked", this.checked);

            });
            //取出需要删除的数据放到数组中
            var ids = [];
            $(".batchDelete").click(function () {
                $.each($(".acb:checked"), function (index, item) {
                    ids[index] = $(item).data("id");
                })
                //如果数组的中没有数据
                if ($(ids).size() == 0) {
                    $.dialog({
                        title: "温馨提示",
                        content: "亲,请选中需要删除的选项",
                        ok: true
                    });
                } else {
                    $.dialog({
                        title: "温馨提示",
                        content: "亲确定要批量删除吗?删除之后无法恢复",
                        ok: function () {
                            //绑定一个点击事件,发送ajax请求
                            $.get("/productStock/batchDelete.do", {ids: ids}, function (data) {
                                if (data.flag) {
                                    window.location.reload();
                                }else {
                                    $.dialog({
                                        title: "温馨提示",
                                        content:"删除失败"
                                    })
                                }
                            });
                        },
                        cancel: true,

                    });

                }

            });
        });
    </script>
</head>
<body>
<form id="searchForm" action="/productStock/query.do" method="post">
    <div id="container">
        <div class="ui_content">
            <div class="ui_text_indent">
                <div id="box_border">
                    <div id="box_top">搜索</div>
                    <div id="box_center">
                        货品名称或编码
                        <input type="text" class="ui_input_txt02" name="keyword" value="${qo.keyword}"/>
                        所在仓库
                        <select class="ui_select01" name="depotId">
                            <option value="-1"> ---请选择---</option>
                            <c:forEach items="${depots}" var="d">
                                <option value="${d.id}" ${qo.depotId==d.id?'selected':''}>${d.name}</option>
                            </c:forEach>
                        </select>
                        货品品牌
                        <select class="ui_select01" name="brandId">
                            <option value="-1"> ---请选择---</option>
                            <c:forEach items="${brands}" var="brand">
                                <option value="${brand.id}" ${qo.brandId==brand.id?'selected':''}>${brand.name}</option>
                            </c:forEach>
                        </select>
                        库存阈值
                        <input type="text" class="ui_input_txt02" name="maxNumber" value="${qo.maxNumber}"/>
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
                        <th>仓库</th>
                        <th>货品名称</th>
                        <th>品牌</th>
                        <th>库存数量</th>
                        <th>成本</th>
                        <th>库存汇总</th>
                    </tr>
                    <tbody>
                    <c:forEach items="${result.data}" var="list">
                        <tr>
                            <td>${list.depot.name}</td>
                            <td>${list.product.name}</td>
                            <td>${list.product.brandName}</td>
                            <td>${list.storeNumber}</td>
                            <td>${list.price}</td>
                            <td>${list.amount}</td>
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
