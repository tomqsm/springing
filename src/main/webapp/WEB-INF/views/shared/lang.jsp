<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<s:url var="langPl" value="/?lang=pl"/>
<s:url var="langEn" value="/?lang=en"/>
<c:choose>
    <c:when test="${param.lang eq 'en'}">
        <a href="${langPl}"><s:message code="language.pl" /></a>
    </c:when>
    <c:when test="${param.lang eq 'pl'}">
        <a href="${langEn}"><s:message code="language.en" /></a>
    </c:when>
    <c:otherwise>
        <a href="${langEn}"><s:message code="language.en" /></a>
    </c:otherwise>
</c:choose>

