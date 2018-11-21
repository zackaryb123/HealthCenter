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
<div class="container" style="max-width: 500px">
<div class="col-md-12 order-md-1 text-center">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Edit Patient ${id}</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <button class="btn btn-sm btn-outline-secondary">
                <a class="nav-link active" href="/patient/modalAttr">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                    Dashboard <span class="sr-only">(current)</span>
                </a>
            </button>
        </div>
    </div>
<f:form action="/patient/update" method="post" class="needs-validation" modelAttribute="patient">
    <f:input path="id" value="${id}" hidden="true"/>
    <div class="row">
        <div class="col-md-12 mb-3">
            <f:label path="name">Name</f:label>
            <f:input type="text" cssClass="form-control" path="name" placeholder="" value="" required="true"/>
            <div class="invalid-feedback">
                Valid last name is required.
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-5 mb-3">
            <f:label path="type">Type</f:label>
            <f:select path="type" cssClass="custom-select d-block w-100" id="country" required="true">
                <f:option value="">Choose...</f:option>
                <f:option value="in">In-Patient</f:option>
                <f:option value="out">Out-Patient</f:option>
            </f:select>
            <div class="invalid-feedback">
                Please select a valid country.
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <f:label path="category">Category</f:label>
            <f:select path="category" cssClass="custom-select d-block w-100" id="state" required="true">
                <f:option value="">Choose...</f:option>
                <f:option value="Student">Student</f:option>
                <f:option value="Employee">Employee</f:option>
                <f:option value=" Beneficiary">Beneficiary</f:option>
            </f:select>
            <div class="invalid-feedback">
                Please provide a valid state.
            </div>
        </div>
        <div class="col-md-3 mb-3">
            <f:label path="days">Days</f:label>
            <f:input type="number" cssClass="form-control" path="days" placeholder="" required="true"/>
            <div class="invalid-feedback">
                Please enter your shipping address.
            </div>
        </div>

    </div>
    <hr class="mb-4">
    <div class="">
        <f:checkbox value="true" path="xrays"/>
        <f:label path="xrays">Xrays</f:label>
    </div>

    <div class="">
        <f:checkbox value="true" path="scanning"/>
        <f:label path="scanning">Scanning</f:label>
    </div>

    <hr class="mb-4">
    <button class="btn btn-primary btn-lg btn-block" type="submit">Update Patient</button>

</f:form>
</div>
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
