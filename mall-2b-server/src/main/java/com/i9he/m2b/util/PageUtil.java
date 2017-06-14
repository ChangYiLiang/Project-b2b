package com.i9he.m2b.util;

public class PageUtil {
	public String getPageCode(Integer page, int totalNum,Integer pageSize, String projectContext,String param) {
		StringBuffer pageCode = new StringBuffer();
		// 得到总页数
		int totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;
		if (totalNum == 0) {
			return "";
		} else {
			pageCode.append("<nav>");
			pageCode.append("<ul class='pager'>");
			if (page > 1) {
				pageCode.append("<li><a href='" + projectContext + "/concern/list.do?pageNo=" + (page-1) +""+ param+"'>上一页</a></li>"+page);
			} else {
				pageCode.append("<li class='disabled'><a>上一页</a></li>"+page);
			}
			
			if (page < totalPage) {
				pageCode.append("<li><a href='" + projectContext + "/concern/list.do?pageNo=" + (page+1) +""+ param+"'>下一页</a></li>"+"共"+totalPage+"页");
			} else {
				pageCode.append("<li class='disabled'><a>下一页</a></li>");
			}

			pageCode.append("</ul>");
			pageCode.append("</nav>");

		}

		return pageCode.toString();
	}

}
