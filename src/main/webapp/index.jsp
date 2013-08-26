<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%
    String redirectURL = "http://localhost:8080/lukasfloorspring/index";
    response.sendRedirect(redirectURL);
%>
