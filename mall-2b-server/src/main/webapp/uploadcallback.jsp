<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>callback</title>
</head>
<body>
<%
String jsonstr = (String)request.getParameter("jsonstr");
// jsonstr = new String(jsonstr.getBytes("ISO-8859-1"),"utf-8");
out.print(jsonstr);
 %>
<script type="text/javascript">
	var jsonstr = '<%=jsonstr%>';
	window.callback_jsonstr=jsonstr;
	parent.window.callback_jsonstr = jsonstr;
	if(parent.window.fileupload_callback){
		parent.window.fileupload_callback(jsonstr);
	}
</script>
 <input type="hidden" id="jsonstr" value="">
</body>
</html>