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
<s:url var="jquery_cookie" value="/resources/scripts/lib/jquery.cookie.js"  />
<s:url var="jquery_innerfade" value="/resources/scripts/lib/jquery.innerfade.js"  />
<s:url var="underscore" value="/resources/scripts/lib/underscore.js"  />
<s:url var="app_min" value="/resources/scripts/app.js"  />
<s:url var="widgets" value="/resources/scripts/widgets.js"  />
<t:importAttribute name="pagejs" toName="pagejs" scope="request"/>
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
        <!--<meta http-equiv="X-UA-Compatible" content="IE=8" />-->
        <meta name="description" content="Cyklinowanie, podłogi, balustrady, schody, stolarka.">
        <meta name="keywords" content="Cyklinowanie, podłogi, balustrady, schody, stolarka.">
        <meta name="author" content="Łukasz Dożak">
        <META name="ROBOTS" content="INDEX, FOLLOW">
        <link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/reset.css"/>" />
        <link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/standard.css"/>" />
        <link rel="stylesheet" type="text/css" media="screen" href="${localised_css_url}" />
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="//code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
        <script src="${jquery_innerfade}"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.7.0/underscore-min.js"></script>
        <script src="<s:url value="/resources/scripts/lib/hashchange.js"/>"></script>
        <script src="<s:url value="/resources/scripts/lib/jquery.easytabs.min.js"/>"></script>
        <title>${pageTitle}</title>
        <script>
            var app_context = '<s:url value="/"/>';
            $(document).ready(function() {
                $('#cookiesLegalNoteCloser').closeIt();
                $('#tab-container').easytabs();
                $('#topLeftImages').innerfade(
                        {
                            animationtype: 'slide',
                            speed: 1500,
                            timeout: 6000
                        });
                $('#news').innerfade({
                    animationtype: 'slide',
                    speed: 750,
                    timeout: 6000,
                    type: 'sequence',
                    containerheight: '3em'
                });
                $('#menu').menuSelector({selected: '${f:psvParser(menuList,breadcrumbList.get(fn:length(breadcrumbList)-1),'ID')}'});
            });
        </script>
        <script src="${app_min}"></script>
        <!--pagejs section-->
        <c:if test="${not empty pagejs}" >
            <script src="<s:url value="${pagejs}"/>"></script>
        </c:if>
    </head>
    <body>
        <div class="container cookiesAlert">Strona lukasfloor.com używa plików 'cookies' aby 1) umożliwić zmianę języka strony 2) tworzyć statystki odwiedzin 3) umożliwić kontinuum konwersacji z serwerem (tworzyć sesję). Jeśli nie zgadzasz się na używanie 'cookies' prosimy je zablokować w ustawieniach przeglądarki.<br/><a href="#">więcej informacji</a>
            <a id="cookiesLegalNoteCloser" href="#"><span style="float: right; padding: 5px; margin-top: 5px;" class="close border">zamknij</span></a>
        </div>
        <div class="container width950" style="height: 300px;"> 
            <div id="topLeftImages" style="float: left">
                <img src="<s:url value="/resources/images/leftTop/pokuj1.jpg"/>" width="300" height="240"/>
                <img src="<s:url value="/resources/images/leftTop/pokuj2.jpg"/>" width="300" height="240"/>
                <img style="" src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSdQdXCytSoXljeTiXgC4rZFVFvFxsWpYEoa1FZQOj2Wqt3QnNybQ" width="300" height="240"/>
                <img style="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjN60Uy3QiQe3s7ldRp50shlMA-L4xQSum0mgWOpF65FedSDtf" width="300" height="240"/>
                <img style="" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTUQmDihNq-5eBlk9DVTVFRfsknQCFcHVkVO_Zy2c6Mf6GMcb32jQ" width="300" height="240"/>
                <img style="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHG6dU_vqDOZ5GXklRyZdJIaMVn0iJYuM20BS8WomUgCkz0icB" width="300" height="240"/>
            </div>
            <div class="flashAdvert" >
                <t:insertAttribute name="flashAdvert" />
                <ul id="news">
                    <li>
                        Brązowy parkiet jest olejowany.
                    </li>
                    <li>
                        Deski wyglądają naturalnie i sprawiają wrażenie ciepła i przytulności.
                    </li>
                    <li>Wykładanie parkietu według precyzyjnych odmierzeń.</li>
                    <li>Cyklinowanie maszynami renomowanej firmy Lagler.</li>
                    <li>Schody i balustrady wewnątrz pomieszczeń.</li>
                    <li>Także balustrady wmocowane w drawno w schodach.</li>
                </ul>
            </div>
            <a href="<s:url value="/"/>${'en' eq pageContext.response.locale ? '?lang=en' : ''}">
                <img class="" style="position: relative; top: 100px; z-index: 10;" src="<s:url value="/resources/images/logo.png"/>"/>
            </a>
        </div>
        <div class="container width950" style="position: relative; top: -90px;">
            <div class="langBox">
                <div class="flagLang">
                    <t:insertAttribute name="lang" />
                </div>
            </div>
        </div>
        <div class="container width950">
            <t:insertAttribute name="breadcrumbs" ignore="false" />
            <ul id="menu" class="menu">
                <t:insertAttribute name="menu" ignore="true"/>
            </ul>
        </div>
        <div class="container" style="float:left; clear: right;">
            <t:insertAttribute name="body" />
        </div>
        <div class="container width950" style="clear: left;">
            <span class="builtDate"><t:insertAttribute name="builtDatePrefix" />&nbsp;</span>
            <span class="builtDate"><t:insertAttribute name="builtDate" /></span>
        </div>
    </body>
</html>
