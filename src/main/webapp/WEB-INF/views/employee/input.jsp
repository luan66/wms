<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="/js/commonAll.js"></script>
    <script type="text/javascript" src="/js/common_js/savePopup.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#editForm").validate({
                    rules:{
                        name:{required:true,minlength:3},
                        password:{required:true,minlength:5},
                        repassword:{equalTo:"#password"},
                        email:{email:true},
                        age:{required:true,min:10}
                    },
                    messages:{
                        name:{required:"请输入用户名",minlength:"用户名的长度不能小于3"},
                        password:{required:"密码不能为空",minlength:"密码不能小于6位"},
                        repassword:"两次输入的密码必须一致",
                        email:"邮箱格式错误",
                        age:{required:"年龄必填",min:"年龄不能小于10岁"}
                    }

                }
            );
            //从左全部移动到右边
            $("#selectAll").click(function () {
                $(".allRoles option").appendTo($(".selectedRoles"));
            });
            //右边移动到左边
            $("#deselectAll").click(function () {
                $(".selectedRoles option").appendTo($(".allRoles"));
            });
            //选中的从左移动到右边
            $("#select").click(function () {
                $(".allRoles option:selected").appendTo($(".selectedRoles"));
            });
            //选中的从左到右边
            $("#deselect").click(function () {
                $(".selectedRoles option:selected").appendTo($(".allRoles"));
            });
            //对于右边的选择框,选中的进行提交
            $("#editForm").submit(function () {
                //遍历出右边所有选中的权限并设置为true
                $.each($(".selectedRoles option"),function (index, item) {
                    $(item).prop("selected",true);
                });
            });
            //删除左边框的权限名字和右边存在的权限名字重复的权限名字
            //1.取出右边所有的权限列表
            var ids=new Array();
            $.each($(".selectedRoles option"),function (index,item) {
                //向数组中设置值
                ids[index]=$(item).val();
            })
            //2.取出右边所有的权限列表,删除和左边重复的元素
            $.each($(".allRoles option"),function (index,item) {
                if ($.inArray($(item).val(),ids)!=-1){
                    $(item).remove();
                }
            })    
                
        })

    </script>
</head>
<body>
<form name="editForm" action="/employee/saveOrUpdate.do" method="post" id="editForm">
    <input type="hidden" name="id" value="${employee.id}">
    <div id="container">
        <div id="nav_links">
            <span style="color: #1A5CC6;">用户编辑</span>
            <div id="page_close">
                <a>
                    <img src="/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
                </a>
            </div>
        </div>
        <div class="ui_content">
            <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                <tr>
                    <td class="ui_text_rt" width="140">用户名</td>
                    <td class="ui_text_lt">
                        <input name="name" value="${employee.name}" class="ui_input_txt02"/>
                    </td>
                </tr>
                <c:if test="${employee.id==null}">
                    <tr>
                        <td class="ui_text_rt" width="140">密码</td>
                        <td class="ui_text_lt">
                            <input type="password" name="password" id="password" class="ui_input_txt02"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="ui_text_rt" width="140">验证密码</td>
                        <td class="ui_text_lt">
                            <input name="repassword" type="password" class="ui_input_txt02"/>
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td class="ui_text_rt" width="140">Email</td>
                    <td class="ui_text_lt">
                        <input name="email" value="${employee.email}" class="ui_input_txt02"/>
                    </td>
                </tr>
                <tr>
                    <td class="ui_text_rt" width="140">年龄</td>
                    <td class="ui_text_lt">
                        <input name="age" value="${employee.age}" class="ui_input_txt02"/>
                    </td>
                </tr>
                <tr>
                    <td class="ui_text_rt" width="140">所属部门</td>

                    <td class="ui_text_lt">

                        <select id="deptId" name="dept.id" class="ui_select01">
                            <option value="-1"> ---请选择---</option>
                            <c:forEach items="${depts}" var="d">
                                <option value="${d.id}"> ${d.name}</option>
                            </c:forEach>
                        </select>
                        <c:if test="${not empty employee}">
                            <script type="text/javascript">
                                $(function () {
                                    $("#deptId option").each(function (index, item) {
                                        if ($(item).val() ==${employee.dept.id}) {
                                            item.selected = true;
                                        }
                                    });
                                });
                            </script>

                        </c:if>
                    </td>

                </tr>
                <tr>
                    <td class="ui_text_rt" width="140">超级管理员</td>
                    <td class="ui_text_lt">
                        <input type="checkbox" value="${employee.admin}" onclick="presson()"
                               name="admin" class="ui_checkbox01" ${employee.admin==true?'checked':''}>
                    </td>
                    <script type="text/javascript">
                        function presson() {
                           if($(":input[name='admin']").prop("checked")){
                               $(":input[name='admin']").val(true)
                           }
                        }
                    </script>
                </tr>
                  <tr>
                      <td class="ui_text_rt" width="140">角色</td>
                      <td class="ui_text_lt">
                          <table>
                              <tr>
                                  <td>
                                      <select multiple="true" class="ui_multiselect01 allRoles">
                                          <c:forEach items="${roles}" var="role">
                                              <option value="${role.id}">${role.name}</option>
                                          </c:forEach>
                                      </select>
                                  </td>
                                  <td align="center">
                                      <input type="button" id="select" value="-->" class="left2right"/><br/>
                                      <input type="button" id="selectAll" value="==>" class="left2right"/><br/>
                                      <input type="button" id="deselect" value="<--" class="left2right"/><br/>
                                      <input type="button" id="deselectAll" value="<==" class="left2right"/>
                                  </td>
                                  <td>
                                      <select multiple="true" class="ui_multiselect01 selectedRoles" name="ids">
                                          <c:forEach items="${employee.roles}" var="role">
                                              <option value="${role.id}">${role.name}</option>
                                          </c:forEach>
                                      </select>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                <tr>
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