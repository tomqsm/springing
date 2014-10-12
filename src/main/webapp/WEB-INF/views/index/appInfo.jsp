<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<% pageContext.setAttribute("now", new DateTime());%>
<h1><c:out value="${pageTitle}" /></h1>
<table >
    <tr>
        <th>Property</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>servletContextName &nbsp;</td>
        <td>${pageContext.servletContext.servletContextName}</td>
    </tr>
    <tr>
        <td>majorVersion &nbsp;</td>
        <td>${pageContext.servletContext.majorVersion}</td>
    </tr>
    <tr>
        <td>classLoader &nbsp;</td>
        <td>${pageContext.servletContext.classLoader}</td>
    </tr>
    <tr>
        <td>contextPath &nbsp;</td>
        <td>${pageContext.servletContext.contextPath}</td>
    </tr>
    <tr>
        <td>getResource "/images/ajax-loader.gif" &nbsp;</td>
        <td>${pageContext.servletContext.getResource("/images/ajax-loader.gif")}</td>
    </tr>
</table>