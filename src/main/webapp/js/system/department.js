$(function () {
    $("#deptDataGrid").datagrid({
        fit: true,
        fitColumns: true,
        striped: true,
        singleSelect: true,
        pagination: true,
        pageSize: 3,
        pageList: [3, 5, 10],
        url: '/department/queryJson.do',
        columns: [[
            {field: 'id', title: '编号', width: 100, align: 'center'},
            {field: 'name', title: '部门名称', width: 100, align: 'center'},
            {field: 'sn', title: '部门编码', width: 100, align: 'center'}
        ]],
        toolbar:
            [{
                iconCls: 'icon-add',
                text: '新增',
                handler: function () {
                    $("#dialogAdd").form("clear");
                    $("#dialogAdd").dialog("open");
                }
            }, {
                iconCls: 'icon-edit',
                text: '编辑',
                handler: function () {
                    var row = $("#deptDataGrid").datagrid('getSelected');
                    //如果没有选中行,提示选中要删除的行
                    if (!row) {
                        $.messager.alert('温馨提示', '请选择要编辑的数据', 'warning');
                        return;
                    }
                    $("#dialogAdd").form("clear");
                    $("#form_add").form('load',row);
                    $("#dialogAdd").dialog("open");


                }
            }, {
                iconCls: 'icon-remove',
                text: '删除',
                handler: function () {
                    var row = $("#deptDataGrid").datagrid('getSelected');
                    //如果没有选中行,提示选中要删除的行
                    if (!row) {
                        $.messager.alert('温馨提示', '请选择要删除的数据', 'warning');
                        return;
                    }
                    //提示是否要删除数据
                    $.messager.confirm('温馨提示', '您确定要删除该数据?', function (r) {
                        if (r) {
                            $.get('/department/delete.do', {id: row.id}, function (data) {
                                if (data.flag) {
                                    //提示删除成功,并刷新页面
                                    $.messager.alert('温馨提示', '删除成功', 'ok', function () {
                                        $("#deptDataGrid").datagrid('reload');
                                    });
                                }
                            })
                        }
                    });
                }
            }, {
                iconCls: 'icon-reload',
                text: '刷新',
                handler: function () {
                    $("#deptDataGrid").datagrid('reload');
                }
            }]

    });

    /*新增/编辑对话框*/
    $("#dialogAdd").dialog({
        width: 300,
        height: 200,
        closed: true,
        buttons: [{
            text: '保存',
            iconCls: 'icon-ok',
            handler: function () {
                //提交数据
                $("#form_add").form('submit', {
                    success: function (data) {
                        data = $.parseJSON(data);
                        if (data.flag) {
                            //点击关闭窗口
                            $("#dialogAdd").dialog("close");
                            //提示信息
                            $.messager.alert('温馨提示', '保存成功', 'info', function () {
                                $("#deptDataGrid").datagrid('reload');
                            });
                        } else {
                            $.messager.alert('温馨提示', '保存失败', 'info');
                        }
                    }
                });
            }
        }, {
            text: '取消',
            iconCls: 'icon-cancel',
            handler: function () {
                //关闭对话框
                $("#dialogAdd").dialog("close");
            }
        }]
    });

});
