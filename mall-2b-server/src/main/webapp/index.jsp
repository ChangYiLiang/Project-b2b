<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setAttribute("from_index.jsp", true);
	request.getRequestDispatcher("/index.do").forward(request, response);
%>