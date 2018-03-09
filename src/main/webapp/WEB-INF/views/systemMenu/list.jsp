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
    <title>叩丁狼教育PSS（演示版）-菜单管理</title>
    <style>
        .alt td {
            background: black !important;
        }
    </style>
    <script type="text/javascript" src="/js/common_js/commonJs.js"></script>
    <%--解决点了下一页,又回到根目录页面的问题--%>
</head>
<body>
<form id="searchForm" action="/systemMenu/query.do" method="post">
    <input type="hidden" name="parentId" value="${qo.parentId}">
    <div id="container">
        <div class="ui_content">
            <div class="ui_text_indent">
                <div id="box_border">
                    <div id="box_bottom">
                        <input type="button" value="新增" class="ui_input_btn01 btn_input"
                               data-url="/systemMenu/input.do?parentId=${qo.parentId}"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui_content">
            当前菜单:
            <a href="/systemMenu/query.do">根目录</a>
            <c:forEach items="${parents}" var="parent">
                ><a href="/systemMenu/query.do?parentId=${parent.id}">${parent.name}</a>
            </c:forEach>
            <div class="ui_tb">
                <table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <th width="30"><input type="checkbox" id="all"/></th>
                        <th>编号</th>
                        <th>菜单名称</th>
                        <th>菜单编码</th>
                        <th>父级菜单</th>
                        <th>URL</th>
                        <th></th>
                    </tr>
                    <tbody>
                    <c:forEach items="${result.data}" var="d">
                        <tr>
                            <td><input type="checkbox" name="IDCheck" class="acb"/></td>
                            <td>${d.id}</td>
                            <td>${d.name}</td>
                            <td>${d.sn}</td>
                            <td>${d.parent.name}</td>
                            <td>${d.url}</td>
                            <td>
                                <a href="/systemMenu/input.do?id=${d.id}&parentId=${qo.parentId}">编辑</a>
                                <a href="javascript:;" data-id="${d.id}" class="btn_delete"
                                            data-url="/systemMenu/delete.do?id="
                            >删除</a>
                                <a href="/systemMenu/query.do?parentId=${d.id}">查看下一级</a>
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

