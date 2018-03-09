/*保存之后弹窗提示保存成功
* */
$(function () {
    $("#editForm").ajaxForm(function (data) {
        //在表单提交完成之后执行回调函数
        if (data.flag){
            $.dialog({
                title:"温馨提示",
                content:"保存成功",
                icon:"face-smile",
                ok:function () {
                    window.location.href="/"+data.mark+"/query.do"
                },
                okValue:"朕知道了"
            })
        }

    })
})