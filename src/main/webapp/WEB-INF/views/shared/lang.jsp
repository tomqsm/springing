<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<s:url var="langPl" value="/?lang=pl"/>
<s:url var="langEn" value="/?lang=en"/>
<div class="flagLang">
    <c:choose>
        <c:when test="${'en' eq pageContext.response.locale}">
            <div class="langText">
                <a href="${langPl}"><s:message code="language"/> </a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="langText">
                <a href="${langEn}"><s:message code="language"/></a>            
            </div>
        </c:otherwise>
    </c:choose>
    
</div>
