package cn.wolfcode.wms.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Collections;
import java.util.List;

/**
 * 分页查询的结果
 *
 * @author include
 */
@Getter
@Setter
@ToString

@SuppressWarnings("all")
public class PageResult {
    public static final PageResult EMPTY_PAGE = new PageResult(1, 3, 0, Collections.EMPTY_LIST);

    private int currentPage;
    private int pageSize;
    private int prevPage;
    private int nextPage;
    private int totalPage;
    private int totalCount;
    private List<?> data;

    public PageResult(int currentPage, int pageSize, int totalCount, List<?> data) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.data = data;
        this.totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
        this.totalPage = (totalPage == 0 ? 1 : totalPage);
        this.prevPage = currentPage - 1 > 0 ? currentPage - 1 : 1;
        this.nextPage = currentPage + 1 > totalPage ? currentPage : currentPage + 1;
    }

}



