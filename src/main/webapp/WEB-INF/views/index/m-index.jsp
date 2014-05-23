<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<% pageContext.setAttribute("now", new DateTime());%>
<div id="tab-container" class="tab-container">
    <ul class='etabs'>
        <li class='tab'><a href="#podłogi">Podłogi</a></li>
        <li class='tab'><a href="#cyklinowanie">Cyklinowanie</a></li>
        <li class='tab'><a href="#schody">Schody</a></li>
        <li class='tab'><a href="#drzwi">Drzwi</a></li>
        <li class='tab'><a href="#balustrady">Balustrady</a></li>
    </ul>
    <div id="podłogi">
        <h2>Robię super podłogi.</h2>
        <p>Podłoga – element wykańczający górną część stropu; posadzka jest elementem składowym podłogi. Zapewnia izolację termiczną, akustyczną i przeciwwilgociową, przenosi obciążenia równomiernie rozłożone i skupione, jest płaska i przystosowana do tego, aby mógł po niej odbywać się ruch.</p>
    </div>
    <div id="cyklinowanie">
        <h1>Robię super cyklinowanie</h1>
        <!-- content -->
    </div>
    <div id="schody">
        <h2>Robię super schody</h2>
        <!-- content -->
    </div>
    <div id="drzwi">
        <h2>Robię super drzwi</h2>
        <!-- content -->
    </div>
    <div id="balustrady">
        <h2>Robię super balustrady</h2>
        <!-- content -->
    </div>
</div>