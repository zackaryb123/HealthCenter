<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="jQuery" value="/resources/javascript/jQuery.js" />
<c:url var="bootstrapJs" value="/resources/javascript/bootstrap.min.js"/>
<c:url value="/resources/style/bootstrap.min.css" var="bootstrapCss"/>
<c:url var="medical_symbol" value="/resources/assets/medical-symbol.jpg"/>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${bootstrapCss}" />
    <script type="text/javascript" src="${jQuery}"></script>
    <script type="text/javascript" src="${bootstrapJs}"></script>
</head>
<body class="text-center" cz-shortcut-listen="true">

<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto">
    </header>

    <main role="main" class="inner cover">
        <img class="d-block mx-auto mb-4" src="${medical_symbol}" alt="medical symbol" width="72" height="72">
        <h1 class="cover-heading">Health Center Management System</h1>
        <p class="lead"></p>
        <p class="lead">
            <a href="patient/modalAttr" class="btn btn-lg btn-secondary">Dashboard</a>
        </p>
    </main>

    <footer class="mastfoot mt-auto">
        <div class="inner">
            <p>Project by<a href="#">@Zack Blaylock</a>
        </div>
    </footer>
</div>
</body>
</html>
