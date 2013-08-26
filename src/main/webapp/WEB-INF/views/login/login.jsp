<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page session="false" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<% pageContext.setAttribute("now", new DateTime());%>

<s:url var="logoutUrl" value="/j_spring_security_logout" />
<h1>Login page</h1>
<p></p>

<div id="userinfo">
    <sec:authorize access="isAuthenticated()">labelWelcome
        <sec:authentication property="principal.username" />
        <br/>
        <a href="${logoutUrl}">labelLogout</a>
    </sec:authorize>
</div>

<s:url var="loginUrl" value="/j_spring_security_check" />

<h3>menuHeaderText</h3>
<sec:authorize access="hasRole('ROLE_USER')">
    <a href="addContactUrl"><h3>menuAddContact</h3></a>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
    <div id="login">
        <form name="loginForm" action="${loginUrl}" method="post">
            <table>
                <caption align="left">Login:</caption>
                <tr>
                    <td>User Name:</td>
                    <td><input type="text" name="j_username"/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="j_password"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input name="submit" type="submit"
                                                          value="Login"/></td>
                </tr>
            </table>
        </form>
    </div>
</sec:authorize>
</div>