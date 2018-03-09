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
    <script type="text/javascript" src="/js/jquery/My97DatePicker/WdatePicker.js"></script>
    <%--<script type="text/javascript" src="/js/common_js/savePopup.js"></script>--%>
    <script type="text/javascript">


        $(function () {

            $(".searchproduct").click(function () {
                var trObject = $(this).closest("tr");
                art.dialog.open("/product/selectProduct.do", {
                        id: 'ajxxList',
                        title: '商品信息',
                        width: 650,
                        height: 460,
                        background: '#000000',
                        close: function () {
                            var json = $.dialog.data("json");
                            //把这些值设置到明细表中的每一项
                            if (json) {
                                trObject.find("[tag=name]").val(json.ProductName);
                                trObject.find("[tag=brand]").text(json.brandName);
                                trObject.find("[tag=pid]").val(json.id);
                                trObject.find("[tag=costPrice]").val(json.costPrice);
                                //用完之后清掉数据,以免下次有回显
                                $.dialog.data("json", "");

                            }
                        }
                    }
                );
            });
            //删除明细
            $(".removeItem").click(function () {
                if ($("#edit_table_body tr").size() > 1) {
                    $(this).closest("tr").remove();
                }//否则点击删除明细就把这一行清空
            });
            //提交表单的时候把订单中的每一项订单明细提交,动态的去修改每一行的name属性
            $("#editForm").submit(function () {
                $("#edit_table_body tr").each(function (index, item) {
                    $(this).find("[tag=costPrice]").prop("name", "items[" + index + "].costPrice");
                    $(this).find("[tag=pid]").prop("name", "items[" + index + "].product.id");
                    $(this).find("[tag=number]").prop("name", "items[" + index + "].number");
                    $(this).find("[tag=amount]").prop("name", "items[" + index + "].amount");
                    $(this).find("[tag=remark]").prop("name", "items[" + index + "].remark");
                })
            });
            $("#editForm").ajaxForm(function (data) {
                //在表单提交完成之后执行回调函数
                if (data.flag) {
                    $.dialog({
                        title: "温馨提示",
                        content: "保存成功",
                        icon: "face-smile",
                        ok: function () {
                            window.location.href = "/" + data.mark + "/query.do"
                        },
                        okValue: "朕知道了"
                    })
                }
            });
            //添加一行明细
            $(".appendRow").click(function () {
                //克隆一行
                var cloneTr = $("#edit_table_body tr:first").clone(true);
                //删除以前的数据
                cloneTr.find("[tag=name]").val("");
                cloneTr.find("[tag=costPrice]").val("");
                cloneTr.find("[tag=number]").val("");
                cloneTr.find("[tag=amount]").text("");
                cloneTr.find("[tag=remark]").val("");
                cloneTr.find("[tag=brand]").text("");
                cloneTr.appendTo($("#edit_table_body"));
            });
            //当我们的鼠标失去焦点,就去计算小计
            $(".costPrice,.number").blur(function () {
                var tr = $(this).closest("tr");
                var costPrice = tr.find("[tag=costPrice]").val()||0;
                var number = tr.find("[tag=number]").val()||0;
                var amount = costPrice * number;
                amount = amount.toFixed(2);
                tr.find("[tag=amount]").text(amount);

            });
        })

    </script>
</head>
<body>
<form name="editForm" action="/orderBill/saveOrUpdate.do" method="post" id="editForm">
    <input type="hidden" name="id" value="${orderBill.id}">
    <div id="container">
        <div id="nav_links">
            <span style="color: #1A5CC6;">订单编辑</span>
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
                        <input name="sn" value="${orderBill.id}" class="ui_input_txt02"/>
                    </td>
                </tr>

                <tr>
                    <td class="ui_text_rt" width="140">供应商</td>
                    <td class="ui_text_lt">
                        <select id="supplierId" name="supplier.id" class="ui_select02">
                            <c:forEach items="${suppliers}" var="supplier">
                                <option value="${supplier.id}">${supplier.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="ui_text_rt" width="140">业务时间</td>
                    <td class="ui_text_lt">

                        <input name="vdate" id="inDate" readonly onclick="WdatePicker()"
                               value="<fmt:formatDate value="${orderBill.vdate}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                               class="ui_input_txt02"/>

                    </td>
                </tr>
                <tr>
                    <td class="ui_text_rt" width="140">单据明细</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="button" value="添加明细" class="ui_input_btn01 appendRow"/>
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
                            <c:if test="${not empty orderBill}">
                                <c:forEach items="${orderBill.items}" var="item">
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
                            </c:if>
                            <c:if test="${empty orderBill}">
                                <tr>
                                    <td></td>
                                    <td>
                                        <input disabled="true" readonly="true" class="ui_input_txt02" tag="name"
                                        />
                                        <img src="/images/common/search.png" class="searchproduct"/>
                                        <input type="hidden" name="items[0].product.id"
                                               tag="pid"/>
                                    </td>
                                    <td><span tag="brand"></span></td>
                                    <td><input tag="costPrice" name="items[0].costPrice"
                                               class="ui_input_txt02 costPrice"/>
                                    </td>
                                    <td><input tag="number" name="items[0].number"
                                               class="ui_input_txt02 number"/></td>
                                    <td><span tag="amount"></span></td>
                                    <td><input tag="remark" name="items[0].remark"
                                               class="ui_input_txt02"/></td>
                                    <td>
                                        <a href="javascript:;" class="removeItem">删除明细</a>
                                    </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <td>&nbsp;</td>
                <td class="ui_text_lt">
                    &nbsp;<input type="submit" value="确定保存" class="ui_input_btn01 "/>
                    &nbsp;<input id="cancelbutton" type="button" value="重置" class="ui_input_btn01"/>
                </td>
                </tr>
            </table>
        </div>
    </div>
</form>
</body>
</html>