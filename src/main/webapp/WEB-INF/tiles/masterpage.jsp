<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://lukasfloor.com/tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<s:theme var="localised_css" code="styleSheet"  />
<s:url var="localised_css_url" value="/${localised_css}"  />
<s:url var="jquery_core" value="/resources/scripts/lib/jquery-1.10.2.min.js"  />
<s:url var="jquery_ui" value="http://code.jquery.com/ui/1.10.3/jquery-ui.js"  />
<s:url var="jquery_ui_css" value="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"  />
<s:url var="app_min" value="/resources/scripts/app-min.js"  />
<s:url var="widgets" value="/resources/scripts/widgets.js"  />
<t:importAttribute name="pagejs" toName="pagejs"/>
<t:importAttribute name="title" toName="pageTitle" scope="request"/>
<t:importAttribute name="menuList" toName="menuList" scope="request"/>
<t:importAttribute name="breadcrumbList" toName="breadcrumbList" scope="request" />
<c:if test="${pageTitle eq 'default'}">
    <c:set var="pageTitle" value="${f:psvParser(menuList,breadcrumbList.get(fn:length(breadcrumbList)-1),'BREADCRUMB_DISPLAY')}" scope="request"/>
</c:if>
<!DOCTYPE html>
<html lang="pl">
    <head>
        <link rel="shortcut icon" href="<s:url value="/resources/favicon.ico"/>" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=8" />
        <!--<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>-->
        <link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/reset.css"/>" />
        <link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/standard.css"/>" />
        <link rel="stylesheet" href="<s:url value="/resources/styles/mobile.css"/>" media="handheld, only screen and (max-device-width:480px)"/>
        <link rel="stylesheet" type="text/css" media="screen" href="${localised_css_url}" />
        <link rel="stylesheet" type="text/css" media="screen" href="${jquery_ui_css}" />
        <script src="${jquery_core}"></script>
        <script src="${jquery_ui}"></script>
        <script src="<s:url value="/resources/scripts/lib/hashchange.js"/>"></script>
        <script src="<s:url value="/resources/scripts/lib/jquery.easytabs.min.js"/>"></script>
        <!--pagejs section-->
        <c:if test="${not empty pagejs}" >
            <!--<script src="${pagejs}"></script>-->
        </c:if>
        <title>${pageTitle}</title>
    <div id="header"></div>
    <script>
        $(document).ready(function() {
            $('#tab-container').easytabs();
            $("#topLeftImages img:nth-child(1)").show("fade", 500);
            $("#topLeftImages img:nth-child(1)").delay(4900).hide("slide", {direction: 'left'}, 600);
            $("#topLeftImages img:nth-child(2)").delay(5600).show("slide", {direction: 'right'}, 600);

        });
    </script>
</head>
<body>
    <div class="container" style="height: 300px;"> 
        <div id="topLeftImages" style="float: left">
            <img src="<s:url value="/resources/images/leftTop/pokuj1.jpg"/>" width="250"/>
            <img style="display: none;" src="<s:url value="/resources/images/leftTop/pokuj2.jpg"/>" width="250" height="160"/>
        </div>
        <div class="flashAdvert" >
            <t:insertAttribute name="flashAdvert" />
        </div>
            <a href="<s:url value="/"/>${'en' eq pageContext.response.locale ? '?lang=en' : ''}">
            <img class="" style="position: relative; top: -150px;" src="<s:url value="/resources/images/logo.png"/>"/>
        </a>
        <div class="langBox">
            <div class="flagLang">
                <t:insertAttribute name="lang" />
            </div>
        </div>
    </div>
    <div class="container">
        <t:insertAttribute name="breadcrumbs" ignore="false" />
        <t:insertAttribute name="menu" ignore="true"/>
    </div>

    <div class="container">
        <div style=" display: block; float: left;"><t:insertAttribute name="body" /></div>
    </div>
    <script src="${app_min}"></script>
    <!--<script src="${widgets}"></script>-->
</body>
</html>
