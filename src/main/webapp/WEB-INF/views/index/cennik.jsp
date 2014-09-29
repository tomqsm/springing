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
<div>
    <ol>
        <c:forEach var="price" items="${prices}" varStatus="loop">
            <li>${loop.count}) ${price.service} - ${price.unit} - ${price.price} PLN</li>
        </c:forEach> 
    </ol>
</div>