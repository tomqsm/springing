<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<% pageContext.setAttribute("now", new DateTime());%>
<img src="resources/images/logo.png">
<p><joda:format value="${now}" style="SM" /></p>
<p>welcome: ${welcome}</p>