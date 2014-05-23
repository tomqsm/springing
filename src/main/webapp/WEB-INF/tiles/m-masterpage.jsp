<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<s:url var="jquery_core" value="/resources/scripts/lib/jquery-1.10.2.min.js"  />

<!DOCTYPE html>
<html lang="pl">
    <t:importAttribute name="pagejs" toName="pagejs"/>
    <head>
        <link rel="shortcut icon" href="<s:url value="/resources/favicon.ico"/>" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=8" />
        <link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/reset.css"/>" />
        <link rel="stylesheet" type="text/css" media="screen" href="<s:url value="/resources/styles/m-standard.css"/>" />
        <title><t:getAsString name="title" /></title>
        <script src="${jquery_core}"></script>
        <script src="<s:url value="/resources/scripts/lib/jquery.easytabs.min.js"/>"></script>
    <script>
        $(document).ready(function() {
            $('#tab-container').easytabs();
        });
    </script>
</head>
<body>
    <div class="container"> 
        <img class="" src="<s:url value="/resources/images/logo.png"/>"/>
    </div>
    <div class="container">
        <h1><t:getAsString name="title" /></h1>
    </div>

        <t:insertAttribute name="menu" ignore="true"/>
    <div class="container">
        <t:insertAttribute name="body" />
    </div>
</body>
</html>
