<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="f" uri="http://lukasfloor.com/tags" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<div class="breadCrumbsContainer">
    <c:forEach var="menuLineIdx" items="${breadcrumbList}" varStatus="loop">
        <c:if test="${loop.first}">&#9733;&nbsp;</c:if>
        <a  class="" href="<s:url value="${f:psvParser(menuList,menuLineIdx,'URL')}${('en' eq pageContext.response.locale) ? '?lang=en' : ''}"/>">${f:psvParser(menuList,menuLineIdx,'BREADCRUMB_DISPLAY')}</a>
        <c:if test="${!loop.last}">&#8658;&nbsp;</c:if>
    </c:forEach> 
</div>