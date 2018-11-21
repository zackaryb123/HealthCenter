<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="jQuery" value="/resources/javascript/jQuery.js" />
<c:url var="bootstrapJs" value="/resources/javascript/bootstrap.min.js"/>
<c:url value="/resources/style/bootstrap.min.css" var="bootstrapCss"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${bootstrapCss}" />
    <script type="text/javascript" src="${jQuery}"></script>
    <script type="text/javascript" src="${bootstrapJs}"></script>
</head>
<body>
<div class="container text-center" style="max-width: 350px">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Edit ${dname}</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <button class="btn btn-sm btn-outline-secondary">
                <a class="nav-link active" href="/patient/modalAttr">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                    Dashboard <span class="sr-only">(current)</span>
                </a>
            </button>
        </div>
    </div>
<f:form action="/drug/update" method="post" modelAttribute="drug" class="card p-2">
    <div class="mb-3 text-center">
        <f:input path="dname" value="${dname}" hidden="true"/>
        <f:label path="exp_date">Expire Date</f:label>
        <f:input path="exp_date" placeholder="Expire Date" class="form-control"/>
        <br>
        <f:label path="price">Price</f:label>
        <f:input path="price" type="text" placeholder="Price" class="form-control" />
        <br>
        <f:label path="instock">In Stock</f:label>
        <f:checkbox value="y" path="instock"/>
        <button style="display: block; margin: 0 auto;" type="submit" class="btn btn-primary btn-lg btn-block">Update Drug</button>
    </div>
</f:form>
</div>
<div class="text-center">
    <c:if test="${msg != null}">
        <h4 class="text-success">${msg}</h4>
    </c:if>
</div>
<div class="text-center">
    <c:if test="${error != null}">
        <h4 class="text-danger">${error}</h4>
    </c:if>
</div>
</body>
</html>
