<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="f" uri="http://lukasfloor.com/tags" %>
<c:forEach var="menuLineIdx" items="${menuList}" varStatus="loop">
    <c:if test="${!loop.first}">
        <li onclick="window.location.href = '<s:url value="${f:psvParser(menuList,loop.count-1,'URL')}${('en' eq pageContext.response.locale) ? '?lang=en' : ''}"/>';">
            <a  id="${f:psvParser(menuList,loop.count-1,'ID')}" class="" href="<s:url value="${f:psvParser(menuList,loop.count-1,'URL')}${('en' eq pageContext.response.locale) ? '?lang=en' : ''}"/>">${f:psvParser(menuList,loop.count-1,'MENU_DISPLAY')}</a>
        </li>
    </c:if>
</c:forEach>
