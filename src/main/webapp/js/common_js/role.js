$(function () {
    //权限
    //从左全部移动到右边
    $("#selectAll").click(function () {
        $(".allPermission option").appendTo($(".selectedPermission"));
    });
    //右边移动到左边
    $("#deselectAll").click(function () {
        $(".selectedPermission option").appendTo($(".allPermission"));
    });
    //选中的从左移动到右边
    $("#select").click(function () {
        $(".allPermission option:selected").appendTo($(".selectedPermission"));
    });
    //选中的从左到右边
    $("#deselect").click(function () {
        $(".selectedPermission option:selected").appendTo($(".allPermission"));
    });
    //对于右边的选择框,选中的进行提交
    $("#editForm").submit(function () {
        //遍历出右边所有选中的权限并设置为true
        $.each($(".selectedPermission option"), function (index, item) {
            $(item).prop("selected", true);
        });
    });
    //删除左边框的权限名字和右边存在的权限名字重复的权限名字
    //1.取出右边所有的权限列表
    var ids = new Array();
    $.each($(".selectedPermission option"), function (index, item) {
        //向数组中设置值
        ids[index] = $(item).val();
    })
    //2.取出右边所有的权限列表,删除和左边重复的元素
    $.each($(".allPermission option"), function (index, item) {
        if ($.inArray($(item).val(), ids) != -1) {
            $(item).remove();
        }
    })

});
$(function () {
    //----------------------
    //系统菜单
    $("#mselectAll").click(function () {
        $(".allMenus option").appendTo($(".selectedMenus"));
    });
    //右边移动到左边
    $("#mdeselectAll").click(function () {
        $(".selectedMenus option").appendTo($(".allMenus"));
    });
    //选中的从左移动到右边
    $("#mselect").click(function () {
        $(".allMenus option:selected").appendTo($(".selectedMenus"));
    });
    //选中的从左到右边
    $("#mdeselect").click(function () {
        $(".selectedMenus option:selected").appendTo($(".allMenus"));
    });
    //对于右边的选择框,选中的进行提交
    $("#editForm").submit(function () {
        //遍历出右边所有选中的权限并设置为true
        $.each($(".selectedMenus option"), function (index, item) {
            $(item).prop("selected", true);
        });
    });
    //删除左边框的权限名字和右边存在的权限名字重复的权限名字
    //1.取出右边所有的权限列表
    var ids = new Array();
    $.each($(".selectedMenus option"), function (index, item) {
        //向数组中设置值
        ids[index] = $(item).val();
    })
    //2.取出右边所有的权限列表,删除和左边重复的元素
    $.each($(".allMenus option"), function (index, item) {
        if ($.inArray($(item).val(), ids) != -1) {
            $(item).remove();
        }
    })
})