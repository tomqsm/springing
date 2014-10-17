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
            <li class='tab'><a href="#podłogi">Podłogi</a></li>
            <li class='tab'><a href="#cyklinowanie">Cyklinowanie</a></li>
            <li class='tab'><a href="#schody">Schody</a></li>
            <li class='tab'><a href="#drzwi">Drzwi</a></li>
            <li class='tab'><a href="#balustrady">Balustrady</a></li>
        </ul>
        <div id="podłogi">
            <h2>Podłoga.</h2>
            <p>Specjalizuję się w instalowaniu i serwisie podłóg.
                Serdecznie polecam swoim klientom podłogi drewniane.
                Podłoga taka zapewnia izolację termiczną, akustyczną, przeciwwilgociową, 
                i przenosi obciążenia równomiernie. Jest trwała i dobrze przystosowana do tego, 
                aby mógł po niej odbywać się ruch.</p>
        </div>
        <div id="cyklinowanie">
            <h2>Szpachlowanie</h2>
            <p>Gdy w Twojej podłodze są szczeliny lub innego rodzaju ubytki, 
                które Twoim zdaniem bardziej szpecą niż 
                dodają oryginalności, mogą zostać wypełnione, 
                a podłoga będzie lita jak blat stołu.</p>
            <h2>Olejowanie</h2>
            <p>Przy użyciu odpowiedniego oleju do podłogi można uzyskujemy urokliwe odcienie 
                wyszlifowanej podłogi. Można ją na przykład lekko przyciemnić nadajac 
                lub przeciwnie - rozjaśnić.</p>
            <h2>Lakierowanie</h2>
            <p>Dzięki zastosowaniu stosownych lakierów, uzyskujemy różnego rodzaju efekty połyskowe:
                matowe, pół matowe i pełno połyskowe.</p>
        </div>
        <div id="schody">
            <h2>Schody</h2>
            <p></p>
            <!-- content -->
        </div>
        <div id="drzwi">
            <h2>Drzwi</h2>
            <p>Montaż oraz poprawki zamontowanych drzwi.</p>
            <!-- content -->
        </div>
        <div id="balustrady">
            <h2>Robię super balustrady</h2>
            <!-- content -->
        </div>
    </div>
</div>