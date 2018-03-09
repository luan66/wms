$(function () {
    //新增按钮
    $(".btn_input").click(function () {
        window.location.href = $(this).data("url");
    });
    //翻页按钮的操作
    $(".bt_page").click(function () {
        var pageNo = $(this).data("page") || $(":input[name='currentPage']") || 1;
        $(":input[name='currentPage']").val(pageNo);
        $("#searchForm").submit();

    });

    //pagesize的表单提交
    $("#pageSize").change(function () {
        //回到第一页
        $(":input[name='currentPage']").val(1);
        $("#searchForm").submit();
    });

    //artDialog
    $(".btn_delete").click(function () {
        //获取要删除的id
        var del_id = $(this).data("id");
        var del_URL = $(this).data("url");
        $.dialog(
            {
                title: "消息",
                content: "亲,确定要删除吗",
                icon: "face-smile",
                cancel: true,
                cancelVal: "取消",
                ok: function () {
                    $.get(
                        del_URL + del_id, function (data) {
                            if (data.flag) {
                                $.dialog({
                                        title: "温馨提示",
                                        content: "删除成功",
                                        ok: function () {
                                            window.location.reload();
                                            $(":input [name='currentPage']").val(1);
                                            $("#searchForm").submit();
                                        },
                                        okValue: "我懂了"
                                    }
                                );
                            }else {
                                $.dialog({
                                        title: "温馨提示",
                                        content: data.message,
                                        ok: true
                                    }
                                );
                            }
                        }
                    );
                },

            }
        );

    });
    $(".btn_auditor").click(function () {
        var auditorUrl=$(this).data("auditor");
        console.log(auditorUrl);
        $.dialog(
            {
                title: "消息",
                content: "亲,确定要审核吗",
                icon: "face-smile",
                cancel: true,
                cancelVal: "取消",
                ok: function () {
                    $.get(
                        auditorUrl, function (data) {
                            if (data.flag) {
                                $.dialog({
                                        title: "温馨提示",
                                        content: "审核成功",
                                        ok: function () {
                                            window.location.reload();
                                        },
                                        okValue: "我懂了"
                                    }
                                );
                            }else {
                                $.dialog({
                                        title: "温馨提示",
                                        content: data.message,
                                        ok: true
                                    }
                                );
                            }
                        }
                    );
                },

            }
        );
    });



});
