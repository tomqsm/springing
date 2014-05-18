<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<% pageContext.setAttribute("now", new DateTime());%>
<ul>
    
<c:forEach items="${users}" var="u" varStatus="i">
    <joda:parseDateTime var="parsed" value="${u.inserted}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
    <li>${i.count}) ${u.fname} &nbsp; ${u.lname} &nbsp;&#9; <joda:format value="${parsed}" style="SM"/></li>
</c:forEach>
</ul>
