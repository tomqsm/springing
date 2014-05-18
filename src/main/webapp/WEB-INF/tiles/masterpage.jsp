<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<s:theme var="app_css" code="styleSheet"  />
<s:url var="app_css_url" value="/${app_css}"  />
<s:url var="jquery_core" value="/resources/scripts/lib/jquery-1.10.2.min.js"  />
<s:url var="jquery_ui" value="http://code.jquery.com/ui/1.10.3/jquery-ui.js"  />
<s:url var="jquery_ui_css" value="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"  />
<s:url var="app_min" value="/resources/scripts/app-min.js"  />
<s:url var="widgets" value="/resources/scripts/widgets.js"  />

<!DOCTYPE html>
<html lang="pl">
    <t:importAttribute name="pagejs" toName="pagejs"/>
    <head> 
        <link rel="stylesheet" type="text/css" media="screen" href="${app_css_url}" />
        <link rel="stylesheet" type="text/css" media="screen" href="${jquery_ui_css}" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=8" />
        <script src="${jquery_core}"></script>
        <script src="${jquery_ui}"></script>
        <!--pagejs section-->
        <c:if test="${not empty pagejs}" >
            <script src="${pagejs}"></script>
        </c:if>
        <title><t:insertAttribute name="title" flush="false"/></title>

    </head>
    <body>
        <t:insertAttribute name="lang" />
        <p>pagejs: ${pagejss}</p>
        English: <s:message code="welcome" />
        <t:insertAttribute name="header" />
        <t:insertAttribute name="body" />
        <h1>Hello World default template! ${jquery_core}</h1>
        <script src="${app_min}"></script>
        <!--<script src="${widgets}"></script>-->
    </body>
</html>
