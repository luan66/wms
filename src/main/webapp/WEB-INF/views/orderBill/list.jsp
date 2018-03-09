<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>叩丁狼教育PSS（演示版）-订单管理</title>
    <style>
        .alt td {
            background: black !important;
        }
    </style>
    <script type="text/javascript" src="/js/common_js/commonJs.js"></script>
</head>
<body>
<form id="searchForm" action="/orderBill/query.do" method="post">
<div id="container">
    <div class="ui_content">
        <div class="ui_text_indent">
            <div id="box_border">
                <div id="box_top">搜索</div>
                <div id="box_center">

                    开始时间
                    <input type="text" class="ui_input_txt02" name="beginTime" id="beginTime"  readonly  onclick="WdatePicker()"
                           value="<fmt:formatDate value="${qo.beginTime}" pattern="yyyy-MM-dd"></fmt:formatDate>"/>~
                    结束时间
                    <input type="text" class="ui_input_txt02" name="endTime"  readonly onclick="WdatePicker({maxDate:new Date()})"
                           value="<fmt:formatDate value="${qo.endTime}" pattern="yyyy-MM-dd"></fmt:formatDate>"/>
                    所有供应商
                    <select class="ui_select01" name="suplierId">
                        <option value="-1"> 所有供应商</option>
                        <c:forEach items="${suppliers}" var="supplier">
                            <option value="${supplier.id}" ${qo.suplierId==supplier.id?'selected':''}>${supplier.name}</option>
                        </c:forEach>
                    </select>
                    状态
                    <select class="ui_select01" name="status">
                        <option value="-1" > 所有状态</option>
                        <option value="0" ${qo.status==0?"selected":""} > 待审核</option>
                        <option value="1" ${qo.status==1?"selected":""}> 已审核</option>

                    </select>

                </div>
                <div id="box_bottom">
                    <input type="submit" value="查询" class="ui_input_btn01"/>
                    <input type="button" value="新增" class="ui_input_btn01 btn_input" data-url="/orderBill/input.do"/>
                </div>
            </div>
        </div>
    </div>
    <div class="ui_content">
        <div class="ui_tb">
            <table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tr>
                    <th width="30"><input type="checkbox" id="all"/></th>
                    <th>订单编号</th>
                    <th>业务时间</th>
                    <th>供应商</th>
                    <th>总金额</th>
                    <th>总数量</th>
                    <th>录入人</th>
                    <th>审核人</th>
                    <th>状态</th>
                    <th></th>
                </tr>
                <tbody>
                <c:forEach items="${result.data}" var="list">
                    <tr>
                        <td><input type="checkbox" name="IDCheck" class="acb" data-id="${list.id}"/></td>
                        <td>${list.id}</td>
                        <td><fmt:formatDate value="${list.vdate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                        <td>${list.supplier.name}</td>
                        <td>${list.totalAmount}</td>
                        <td>${list.totalNumber}</td>
                        <td>${list.inputUser.name}</td>
                        <td>${list.auditor.name}</td>

                        <td>
                            <c:if test="${list.status ==0}">
                                <span style="color: #bd291d">待审核</span>
                            </c:if>
                            <c:if test="${list.status ==1}">
                                <span style="color: #58ff7f">已审核</span>
                            </c:if>
                        </td>
                        <c:if test="${list.status ==0}">
                            <td>
                                <a href="/orderBill/input.do?id=${list.id}">编辑</a>
                                <a href="javascript:;" data-id="${list.id}" class="btn_delete"
                                   data-url="/orderBill/delete.do?id="
                                >删除</a>
                                <a href="javascript:;" data-auditor="/orderBill/auditor.do?id=${list.id}"
                                   class="btn_auditor"
                                >审核</a>
                            </td>
                        </c:if>
                        <c:if test="${list.status ==1}">
                            <td>
                                <a href="/orderBill/view.do?id=${list.id}">查看</a>
                            </td>
                        </c:if>
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
