<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<div class="breadCrumbsContainer">
    <c:forEach var="href" items="${breadcrumbList}" varStatus="loop">
        <c:if test="${loop.first}">&#9733;</c:if>
        <a  href="<s:url value="${fn:substringAfter(href, '|')}${('en' eq pageContext.response.locale) ? '?lang=en' : ''}"/>">${fn:substringBefore(href, '|')}</a> 
        <c:if test="${!loop.last}">
            &#8658;
        </c:if>
    </c:forEach> 
    <t:insertAttribute name="menu" ignore="true"/>
</div>
