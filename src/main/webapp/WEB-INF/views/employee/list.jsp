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
    <title>叩丁狼教育PSS（演示版）-员工管理</title>
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
                            $.get("/employee/batchDelete.do", {ids: ids}, function (data) {
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
<form id="searchForm" action="/employee/query.do" method="post">
    <div id="container">
        <div class="ui_content">
            <div class="ui_text_indent">
                <div id="box_border">
                    <div id="box_top">搜索</div>
                    <div id="box_center">
                        姓名/邮箱
                        <input type="text" class="ui_input_txt02" name="keyword" value="${qo.keyword}"/>
                        所属部门
                        <select class="ui_select01" name="deptId">
                            <option value="-1"> ---请选择---</option>
                            <c:forEach items="${depts}" var="d">
                                <option value="${d.id}" ${qo.deptId==d.id?'selected':''}>${d.name}</option>
                            </c:forEach>
                        </select>

                    </div>
                    <div id="box_bottom">
                        <input type="submit" value="查询" class="ui_input_btn01"/>
                        <input type="button" value="批量删除" class="ui_input_btn01 batchDelete"/>
                        <input type="button" value="新增" class="ui_input_btn01 btn_input" data-url="/employee/input.do"/>
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
                        <th>用户名</th>
                        <th>EMAIL</th>
                        <th>年龄</th>
                        <th>所属部门</th>
                        <%-- <th>角色</th>--%>
                        <th></th>
                    </tr>
                    <tbody>
                    <c:forEach items="${result.data}" var="list">
                        <tr>
                            <td><input type="checkbox" name="IDCheck" class="acb" data-id="${list.id}"/></td>
                            <td>${list.id}</td>
                            <td>${list.name}</td>
                            <td>${list.email}</td>
                            <td>${list.age}</td>
                            <td>${list.dept.name}</td>
                                <%--<td>${list.admin}</td>--%>
                            <td>
                                <a href="/employee/input.do?id=${list.id}">编辑</a>
                                <a href="javascript:;" data-id="${list.id}"
                                   class="btn_delete" data-url="/employee/delete.do?id="
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
