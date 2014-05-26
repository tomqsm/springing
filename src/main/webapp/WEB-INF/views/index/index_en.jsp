<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<% pageContext.setAttribute("now", new DateTime());%>
<h1>${pageTitle}</h1>
<div id="tab-positioner">
    <div id="tab-container" class="tab-container">
        <ul class='etabs'>
            <li class='tab'><a href="#floors">Floors</a></li>
            <li class='tab'><a href="#sanding">Sanding</a></li>
            <li class='tab'><a href="#stairs">Stairs</a></li>
            <li class='tab'><a href="#doors">Doors</a></li>
            <li class='tab'><a href="#handrails">Handrails</a></li>
        </ul>
        <div id="floors">
            <h2>Floors</h2>
            <p>Some English content about wonderful stairs.</p>
        </div>
        <div id="sanding">
            <h1>Sanding</h1>
            <!-- content -->
        </div>
        <div id="stairs">
            <h2>Stairs</h2>
            <!-- content -->
        </div>
        <div id="doors">
            <h2>Doors</h2>
            <!-- content -->
        </div>
        <div id="handrails">
            <h2>Handrails</h2>
            <!-- content -->
        </div>
    </div>
</div>