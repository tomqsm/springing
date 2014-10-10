<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<% pageContext.setAttribute("now", new DateTime());%>
<h1><c:out value="${pageTitle}" /></h1>
<br/><p>Ceny nie zawierają podatku VAT 23%</p><br/>
<div id="pricesDiv">Ładuje ... </div>
<!-- BEGIN: Underscore Template Definition. -->
    <script type="text/template" class="prices">
      <table style="float:right; padding: 3px 3px 3px 3px">
      <tr><th>Lp.</th><th>Usługa</th><th>Cena PLN</th><th>Jednostka</th></tr>
        <@_.each(json, function(item, iter){ @>
        <tr>
            <td><@=iter+1@>)</td>
            <td><@=item.service@></td>
            <td>
                <@if(item.priceMin > 0){@>
                 <@=item.priceMin@>
                 <@='-'@>
                 <@}@>
                <@=item.priceMax@>
            </td>
            <td><@ if(item.unit === 'metr^2') @>
                <@='&nbsp;metr<sup>2</sup>'@>
                <@ else @>
                <@=item.unit@></td>
        </tr>
        <@});@>
      </table>
    </script>
    <!-- END: Underscore Template Definition. -->