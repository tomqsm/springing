<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="baseURL" value="${requestScope['javax.servlet.forward.request_uri']}" />
<s:url var="langPl" value="${baseURL}/?lang=pl"/>
<s:url var="langEn" value="${baseURL}/?lang=en"/>
<c:if test="${fn:substring(baseURL, fn:length(baseURL)-1, fn:length(baseURL)) eq '/'}">
    <c:set var="baseURL" value="${fn:substring(baseURL, 0, fn:length(baseURL)-1)}"/>
</c:if>
    <c:choose>
        <c:when test="${'en' eq pageContext.response.locale}">
            <div class="langText">
                <a href="${baseURL}/?lang=pl"><s:message code="language"/> </a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="langText">
                <a href="${baseURL}/?lang=en"><s:message code="language"/></a>            
            </div>
        </c:otherwise>
    </c:choose>