<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("now", new DateTime());%>
<img src="<s:url value="/resources/images/logo.png"/>">
<p><joda:format value="${now}" style="SM" /></p>
<div id="header"></div>
<script>
    $(document).ready(function() {
        $('#header').test();
    });
</script>