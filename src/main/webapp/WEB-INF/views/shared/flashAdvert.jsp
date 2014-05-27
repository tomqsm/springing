<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<c:choose>
    <c:when test="${'en' eq pageContext.response.locale}">
        <s:url var="flashAdvertUrl" value="/resources/flash/slogans_en.swf"  />
    </c:when>
    <c:otherwise>
        <s:url var="flashAdvertUrl" value="/resources/flash/slogans.swf"  />
    </c:otherwise>
</c:choose>
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="650" height="250" id="slogans" align="middle">
    <param name="movie" value="${flashAdvertUrl}" />
    <param name="quality" value="best" />
    <param name="bgcolor" value="#999999" />
    <param name="play" value="true" />
    <param name="loop" value="true" />
    <param name="wmode" value="transparent" />
    <param name="scale" value="showall" />
    <param name="menu" value="true" />
    <param name="devicefont" value="false" />
    <param name="salign" value="" />
    <param name="allowScriptAccess" value="sameDomain" />
    <!--[if !IE]>-->
    <object type="application/x-shockwave-flash" data="${flashAdvertUrl}" width="650" height="250">
        <param name="movie" value="${flashAdvertUrl}" />
        <param name="quality" value="best" />
        <param name="bgcolor" value="#999999" />
        <param name="play" value="true" />
        <param name="loop" value="true" />
        <param name="wmode" value="transparent" />
        <param name="scale" value="showall" />
        <param name="menu" value="true" />
        <param name="devicefont" value="false" />
        <param name="salign" value="" />
        <param name="allowScriptAccess" value="sameDomain" />
        <!--<![endif]-->
        <a href="http://www.adobe.com/go/getflash">
            <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
        </a>
        <!--[if !IE]>-->
    </object>
    <!--<![endif]-->
</object>