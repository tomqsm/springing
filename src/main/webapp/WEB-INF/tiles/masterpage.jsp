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
        <link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/reset.css"/>" />
        <link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/standard.css"/>" />
        <link rel="stylesheet" type="text/css" media="screen" href="${localised_css_url}" />
        <script src="${jquery_core}"></script>
        <script src="${jquery_ui}"></script>
        <script src="${jquery_cookie}"></script>
        <script src="${jquery_innerfade}"></script>
        <script src="${underscore}"></script>
        <script src="<s:url value="/resources/scripts/lib/hashchange.js"/>"></script>
        <script src="<s:url value="/resources/scripts/lib/jquery.easytabs.min.js"/>"></script>
        <!--pagejs section-->
        <c:if test="${not empty pagejs}" >
            <!--<script src="${pagejs}"></script>-->
        </c:if>
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
                $('#ajaxer').getJson({url: 'ajax'});
            });
        </script>
    </head>
    <body>
        <div class="container cookiesAlert">Strona lukasfloor.com używa plików 'cookies' aby 1) umożliwić zmianę języka strony 2) tworzyć statystki odwiedzin 3) umożliwić kontinuum konwersacji z serwerem (tworzyć sesję). Jeśli nie zgadzasz się na używanie 'cookies' prosimy je zablokować w ustawieniach przeglądarki.<br/><a href="#">więcej informacji</a>
            <a id="cookiesLegalNoteCloser" href="#"><span style="float: right; padding: 5px; margin-top: 5px;" class="close border">zamknij</span></a>
        </div>
        <div class="container" style="height: 300px;"> 
            <div id="topLeftImages" style="float: left">
                <img src="<s:url value="/resources/images/leftTop/pokuj1.jpg"/>" width="300" height="240"/>
                <img src="<s:url value="/resources/images/leftTop/pokuj2.jpg"/>" width="300" height="240"/>
                <img style="" src="data:image/jpeg;base64,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" width="300" height="240"/>
                <img style="" src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSdQdXCytSoXljeTiXgC4rZFVFvFxsWpYEoa1FZQOj2Wqt3QnNybQ" width="300" height="240"/>
                <img style="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjN60Uy3QiQe3s7ldRp50shlMA-L4xQSum0mgWOpF65FedSDtf" width="300" height="240"/>
                <img style="" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTUQmDihNq-5eBlk9DVTVFRfsknQCFcHVkVO_Zy2c6Mf6GMcb32jQ" width="300" height="240"/>
                <img style="" src="http://www.100percentstainless.co.uk/wordpress/wp-content/gallery/balustrade-with-wooden-handrails/A%20A,%20Balustrade%20with%20a%20large%20Iroko%20handrail%20&%20privacy%20screen%20(Torquay).jpg" width="300" height="240"/>
                <img style="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHG6dU_vqDOZ5GXklRyZdJIaMVn0iJYuM20BS8WomUgCkz0icB" width="300" height="240"/>
            </div>
            <div class="flashAdvert" >
                <t:insertAttribute name="flashAdvert" />
            </div>         
            <a href="<s:url value="/"/>${'en' eq pageContext.response.locale ? '?lang=en' : ''}">
                <img class="" style="position: relative; top: 100px; z-index: 10;" src="<s:url value="/resources/images/logo.png"/>"/>
            </a>
        </div>
        <div class="container" style="position: relative; top: -90px;">
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
        <div class="container">
            <div id="ajaxer">kliknij tutaj</div>
        </div>
        <script src="${app_min}"></script>
    </body>
    <!-- BEGIN: Underscore Template Definition. -->
    <script type="text/template" class="template">
        czesc <@= name @>
        <ul>
        <@_.each(items, function(i, iter){ @>
        <li>
        <@=iter@>)<@=i@>  
        </li>
        <@});@>
        </ul>
    </script>
    <!-- END: Underscore Template Definition. -->
</html>
