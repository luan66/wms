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
    <title>叩丁狼教育PSS（演示版）-权限管理</title>
    <style>
        .alt td {
            background: black !important;
        }
    </style>
    <script type="text/javascript" src="/js/common_js/commonJs.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".reload_permissions").click(function () {
                var reloadURL = $(this).data("url");
                $.dialog({
                    title:"温馨提示",
                    content:"加载权限可能耗费很长的时间,亲确定要加载吗?",
                    icon:"face-smile",
                    cancel:true,
                    cancelVal: "取消",
                    ok:function(){
                        $.get(reloadURL,function(data){
                            if(data.flag){
                                $.dialog({
                                    title:"温馨提示",
                                    content:"加载成功",
                                    ok:function () {
                                        window.location.reload()
                                    }
                                })
                            }else{
                                $.dialog({
                                    title:"温馨提示",
                                    content:"失败",
                                    ok:true
                                })
                            }

                        },"json")
                    }
                });
            });
        });
    </script>
</head>
<body>
<form id="searchForm" action="/permission/query.do" method="post">
    <div id="container">
        <div class="ui_content">
            <div class="ui_text_indent">
                <div id="box_border">
                    <div id="box_bottom">
                        <input type="button" value="加载权限" class="ui_input_btn01 reload_permissions"
                               data-url="/permission/reload.do"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui_content">
            <div class="ui_tb">
                <table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <th width="30"><input type="checkbox" id="all"/></th>
                        <th>编号</th>
                        <th>权限表达式</th>
                        <th>权限名称</th>
                        <th></th>
                    </tr>
                    <tbody>
                    <c:forEach items="${result.data}" var="d">
                        <tr>
                            <td><input type="checkbox" name="IDCheck" class="acb"/></td>
                            <td>${d.id}</td>
                            <td>${d.expression}</td>
                            <td>${d.name}</td>
                            <td>
                                <a href="javascript:;" data-id="${d.id}" class="btn_delete"
                                   data-url="/permission/delete.do?id="
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

