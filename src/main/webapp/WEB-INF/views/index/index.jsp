<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<% pageContext.setAttribute("now", new DateTime());%>
<h1>Index page</h1>
<p>retrieved from db: ${user.fname}</p>

