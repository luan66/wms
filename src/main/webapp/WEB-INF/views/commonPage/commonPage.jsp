
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="ui_tb_h30">
    <div class="ui_flt" style="height: 30px; line-height: 30px;">
        共有
        <span class="ui_txt_bold04">${result.totalCount}</span>
        条记录，当前第
        <span class="ui_txt_bold04">${result.currentPage}/${result.totalPage}</span>
        页
    </div>
    <div class="ui_frt">
        <input type="button" value="首页" data-page="1" class="ui_input_btn01 bt_page"/>
        <input type="button" value="上一页" data-page="${result.prevPage}" class="ui_input_btn01 bt_page"/>
        <input type="button" value="下一页" data-page="${result.nextPage}" class="ui_input_btn01 bt_page"/>
        <input type="button" value="尾页" data-page="${result.totalPage}" class="ui_input_btn01 bt_page"/>

        <select list="{3,5,10}" id="pageSize" name="pageSize" class="ui_select02">
            <option ${result.pageSize==3?'selected':''}>3</option>
            <option ${result.pageSize==5?'selected':''}>5</option>
            <option ${result.pageSize==10?'selected':''}>10</option>
        </select>
        转到第<input type="number" min="1" max="${result.totalPage}" style="width: 70px"
                  name="currentPage" value="${result.currentPage}" class="ui_input_txt01"/>页
        <input type="submit" class="ui_input_btn01" value="跳转"/>
    </div>
</div>