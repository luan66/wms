<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>信息管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="/style/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="/style/common_style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.validate.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.form.min.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery.artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="/js/jquery/dialog/iframeTools.js"></script>
    <script type="text/javascript" src="/js/commonAll.js"></script>
    <script type="text/javascript">
        $(function () {
            $(":input").prop("readonly", true);
        });
    </script>
</head>
<body>

<div id="container">
    <div id="nav_links">
        <span style="color: #1A5CC6;">订单查看</span>
        <div id="page_close">
            <a>
                <img src="/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
            </a>
        </div>
    </div>
    <div class="ui_content">
        <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
            <tr>
                <td class="ui_text_rt" width="140">订单编码</td>
                <td class="ui_text_lt">
                    <input name="sn" value="${stockInComeBill.id}" class="ui_input_txt02"/>
                </td>
            </tr>

            <tr>
                <td class="ui_text_rt" width="140">仓库</td>
                <td class="ui_text_lt">
                    <select id="depotId" name="depot.id" class="ui_select02" disabled>
                        <c:forEach items="${depots}" var="depot">
                            <option value="${depot.id}">${depot.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="ui_text_rt" width="140">业务时间</td>
                <td class="ui_text_lt">

                    <input name="vdate"
                           value="<fmt:formatDate value="${stockInComeBill.vdate}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                           class="ui_input_txt02"/>
                </td>
            </tr>
            <tr>
                <td class="ui_text_rt" width="140">单据明细</td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <table class="edit_table" cellspacing="0" cellpadding="0" border="0" style="width: auto">
                        <thead>
                        <tr>
                            <th width="10"></th>
                            <th width="200">货品</th>
                            <th width="120">品牌</th>
                            <th width="80">价格</th>
                            <th width="80">数量</th>
                            <th width="80">金额小计</th>
                            <th width="150">备注</th>
                            <th width="60"></th>
                        </tr>
                        </thead>
                        <tbody id="edit_table_body">
                        <c:forEach items="${stockInComeBill.items}" var="item">
                            <tr>
                                <td></td>
                                <td>
                                    <input disabled="true" readonly="true" class="ui_input_txt02" tag="name"
                                           name="items[0].product.name" value="${item.product.name}"/>
                                    <img src="/images/common/search.png" class="searchproduct"/>
                                    <input type="hidden" value="${item.product.id}" name="items[0].product.id"
                                           tag="pid"/>
                                </td>
                                <td><span tag="brand">${item.product.brandName}</span></td>
                                <td><input tag="costPrice" name="items[0].costPrice"
                                           class="ui_input_txt02 costPrice" value="${item.costPrice}"/>
                                </td>
                                <td><input tag="number" name="items[0].number"
                                           value="${item.number}" class="ui_input_txt02 number"/></td>
                                <td><span tag="amount">${item.amount}</span></td>
                                <td><input tag="remark" name="items[0].remark"
                                           value="${item.remark}" class="ui_input_txt02"/></td>
                                <td>
                                    <a href="javascript:;" class="removeItem">删除明细</a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </td>
            </tr>
            <td>&nbsp;</td>
            <td class="ui_text_lt">
                &nbsp;<input type="submit" value="返回列表" readonly="" class="ui_input_btn01"
                             onclick="window.history.back()"/>

            </td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>