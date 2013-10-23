<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("now", new DateTime());%>
<s:message code="welcome" var="welcome"/>
<s:message code="country" var="country"/>
<s:theme code="styleSheet" var="app_css" />
<s:url value="/${app_css}" var="app_css_url" />
<s:url value="/resources/scripts/lib/jquery-1.10.2.min.js" var="jquery" />
<s:url value="/resources/scripts/header.js" var="headerapp" />
<s:url value="/resources/styles/bootstrap/css/bootstrap.min.css" var="bootstrap" />
<s:url value="/resources/styles/standard.css" var="standardCss" />
<!DOCTYPE html>
<html lang="pl">
    <html>
        <head>
            <link rel="stylesheet" type="text/css" media="screen" href="${bootstrap}" />
            <link rel="stylesheet" type="text/css" media="screen" href="${standardCss}" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=8" />
            <title><t:insertAttribute name="title" flush="false"/></title>
        </head>
        <body>
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                        <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="brand" href="#">Lukasfloor</a>
                        <div class="nav-collapse collapse">
                            <ul class="nav">
                                <li class="active"><a href="#">Home</a></li>
                                <li><a href="#about">About</a></li>
                                <li><a href="#contact">Contact</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li class="divider"></li>
                                        <li class="nav-header">Nav header</li>
                                        <li><a href="#">Separated link</a></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <form class="navbar-form pull-right">
                                <input class="span2" type="text" placeholder="Email">
                                <input class="span2" type="password" placeholder="Password">
                                <button type="submit" class="btn">Sign in</button>
                            </form>
                        </div><!--/.nav-collapse -->
                    </div>
                </div>
            </div>
            <div class="container">

                <!-- Main hero unit for a primary marketing message or call to action -->
                <div class="hero-unit">
                    <h1>Podłogi</h1>
                    <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
                    <p><a href="#" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
                </div>

                <!-- Example row of columns -->
                <div class="row">
                    <div class="span3">
                        <h2>Heading</h2>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                        <p><a class="btn" href="#">View details &raquo;</a></p>
                    </div>
                    <div class="span3">
                        <h2>Heading</h2>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                        <p><a class="btn" href="#">View details &raquo;</a></p>
                    </div>
                    <div class="span3">
                        <h2>Heading</h2>
                        <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                        <p><a class="btn" href="#">View details &raquo;</a></p>
                    </div>
                    <div class="span5">
                        <h2>Heading</h2>
                        <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                        <p><a class="btn" href="#">View details &raquo;</a></p>
                    </div>
                </div>

                <hr>

                <footer>
                    <p>&copy; Company 2013</p>
                </footer>

            </div> <!-- /container -->

            <script src="${jquery}"></script>
            <script src="${headerapp}"></script>
        </body>
    </html>


</body>
</html>

