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

<div id="pricesDiv">sdsdsd</div>
<!-- BEGIN: Underscore Template Definition. -->
    <script type="text/template" class="prices">
        czesc <@= json[0].service @>
      <table id="created" style="float:right; padding: 3px 3px 3px 3px">
        <@_.each(json, function(item, iter){ @>
        <tr>
            <td style="float:right; padding: 3px 3px 3px 3px"><@=iter+1@>)</td>
            <td><@=item.service@></td>
            <td style="float:right"><@=item.priceMax@></td>
            <td>PLN</td>
            <td style="float:right"><sup><@=item.unit@></sup></td>
        </tr>
        <@});@>
      </table>
    </script>
    <!-- END: Underscore Template Definition. -->