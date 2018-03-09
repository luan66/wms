//加载当前日期
function loadDate() {
    var time = new Date();
    var myYear = time.getFullYear();
    var myMonth = time.getMonth() + 1;
    var myDay = time.getDate();
    if (myMonth < 10) {
        myMonth = "0" + myMonth;
    }
    document.getElementById("day_day").innerHTML = myYear + "." + myMonth + "." + myDay;

}

/**
 * 隐藏或者显示侧边栏
 *
 **/
function switchSysBar(flag) {
    var side = $('#side');
    var left_menu_cnt = $('#left_menu_cnt');
    if (flag == true) {	// flag==true
        left_menu_cnt.show(500, 'linear');
        side.css({width: '280px'});
        $('#top_nav').css({width: '77%', left: '304px'});
        $('#main').css({left: '280px'});
    } else {
        if (left_menu_cnt.is(":visible")) {
            left_menu_cnt.hide(10, 'linear');
            side.css({width: '60px'});
            $('#top_nav').css({width: '100%', left: '60px', 'padding-left': '28px'});
            $('#main').css({left: '60px'});
            $("#show_hide_btn").find('img').attr('src', 'images/common/nav_show.png');
        } else {
            left_menu_cnt.show(500, 'linear');
            side.css({width: '280px'});
            $('#top_nav').css({width: '77%', left: '304px', 'padding-left': '0px'});
            $('#main').css({left: '280px'});
            $("#show_hide_btn").find('img').attr('src', 'images/common/nav_hide.png');
        }
    }
}

$(function () {
    loadDate();

    // 显示隐藏侧边栏
    $("#show_hide_btn").click(function () {
        switchSysBar();
    });

    //操作左边的菜单栏,点击事件换图片
    $("#TabPage2 li").click(function () {
        //点击之前删除所有的样式
        $.each($("#TabPage2 li"), function (index, item) {
            //删除以前的
            $(item).removeClass("selected");
            $(item).children("img").prop("src", "/images/common/" + ($(this).index() + 1) + ".jpg");
        })
        //为当前点击的添加样式
        $(this).addClass("selected");
        //为当前样式添加图片 /images/common/1_hover.jpg
        $(this).children("img").prop("src", "/images/common/" + ($(this).index() + 1) + "_hover.jpg");
        //切换模块的图片 /images/common/module_1.png
        $("#nav_module").children("img").prop("src", "/images/common/module_" + ($(this).index() + 1) + ".png");
        var rootmenu = $(this).data("rootmenu");
        $.fn.zTree.init($(".ztree"), setting, zNodes[rootmenu]);
    });
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        }, async: {
            enable: true,
            url: "/systemMenu/selectMenuByParentSn.do",
            //这里就是修改了sn的别名
            autoParam: ["sn=parentSn"],

        },
        callback: {
            //这里是把每一个树下面的子节点的controller植入到iframe的src中.这里的controller是动态的从数据库中查询出来的
            onClick: function (event, treeId, treeNode) {
                $("#rightMain").prop("src", treeNode.controller);
            }
        }
    };
    //动态的植入子菜单
    /*var business = [
        {id: 1, pId: 0, name: "业务模块",isParent:true},
        {id: 11, pId: 1, name: "品牌管理"},
        {id: 111, pId: 1, name: "商品管理"},
        {id: 112, pId: 1, name: "仓库管理"},
        {id: 113, pId: 1, name: "客户管理"},
        {id: 114, pId: 1, name: "采购订单管理"},
        {id: 12, pId: 1, name: "采购入库单管理"},
        {id: 121, pId: 1, name: "销售出库单管理"},

    ];
    var system = [
        {id: 1, pId: 0, name: "系统模块",isParent:true,isParent:true},
        {id: 11, pId: 1, name: "部门管理", controller: "/department/query.do"},
        {id: 111, pId: 1, name: "员工管理", controller: "/employee/query.do"},
        {id: 112, pId: 1, name: "权限管理", controller: "/permission/query.do"},
        {id: 113, pId: 1, name: "角色管理", controller: "/role/query.do"},
        {id: 114, pId: 1, name: "系统菜单管理", controller: "/systemMenu/query.do"},

    ];
    var chart = [
        {id: 1, pId: 0, name: "报表管理",isParent:true},
        {id: 11, pId: 1, name: "即时库存表"},
        {id: 111, pId: 1, name: "订货报表"},
        {id: 112, pId: 1, name: "销售报表"},
    ];*/
    var zNodes = {
        //前台页面应该返回的子菜单应该是一个json的格式,{id: 114, pId: 1, name: "系统菜单管理", controller: "/systemMenu/query.do"}
        business: {id: 1, pId: 0, name: "业务模块", isParent: true, sn: "business"},
        system: {id: 1, pId: 0, name: "系统模块", isParent: true, sn: "system"},
        chart: {id: 1, pId: 0, name: "报表管理", isParent: true, sn: "chart"}
    }
    $.fn.zTree.init($(".ztree"), setting, zNodes["business"]);

});