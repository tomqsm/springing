<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<ul class="menu">
    <li><a href="<s:url value="/cennik?lang=en"/>">Pricelist</a></li>
    <li><a href="<s:url value="/kontakt?lang=en"/>">Contact</a></li>
    <li><a href="<s:url value="#"/>">Firm</a></li>
</ul>
