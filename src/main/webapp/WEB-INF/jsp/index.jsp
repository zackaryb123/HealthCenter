<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="jQuery" value="/resources/javascript/jQuery.js" />
<c:url var="bootstrapJs" value="/resources/javascript/bootstrap.min.js"/>
<c:url value="/resources/style/bootstrap.min.css" var="bootstrapCss"/>
<c:url var="medical_symbol" value="../../resources/assets/medical-symbol.jpg"/>

<html>
<head>
    <link rel="stylesheet" href="${bootstrapCss}" />
    <script type="text/javascript" src="${jQuery}"></script>
    <script type="text/javascript" src="${bootstrapJs}"></script>
</head>
<body class="bg-light" cz-shortcut-listen="true">
<header class="masthead mb-auto">
</header>
<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="${medical_symbol}" alt="medical symbol" width="72" height="72">
        <h2>Health Care</h2>
        <p class="lead">Add a patient below or view available drugs and there details.</p>
        <button class="btn btn-sm btn-outline-secondary">
            <a class="nav-link" href="/patient/view">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                Details
            </a>
        </button>
    </div>

    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Drug List</span>
                <span class="badge badge-secondary badge-pill">${drugs.size()}</span>
            </h4>

            <form action="" method="get" class="card p-2">
                <div class="input-group">
                    <input name="dSearch" type="text" class="form-control"  placeholder="Drug Name"/>
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">Search</button>
                    </div>
                </div>
            </form>

            <ul class="list-group mb-3" style="overflow-y: scroll; max-height: 381px">
                <c:forEach var="i" begin="0" end="${drugs.size()-1}">
                    <li class="list-group-item">
                        <div>
                            <h6 class="my-0">${drugs.get(i).dname}</h6>
                            <small class="text-muted">${drugs.get(i).exp_date}</small>
                        </div>
                        <span class="text-muted">${drugs.get(i).price}</span>
                    </li>
                </c:forEach>
            </ul>

            <hr class="mb-4">
            <f:form action="/drug/add" method="post" modelAttribute="drug" class="card p-2">
                <div class="mb-3 text-center">
                    <f:input path="dname" type="text" class="form-control"  placeholder="Drug Name"/>
                    <br>
                    <f:input path="exp_date" placeholder="Expire Date" class="form-control"/>
                    <br>
                    <f:input path="price" type="text" placeholder="Price" class="form-control" />
                    <br>
                    <f:input path="instock" type="text" value="y" hidden="true" />
                    <button type="submit" class="btn btn-secondary">Add</button>
                </div>
            </f:form>


        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Add Patient</h4>
            <f:form action="/patient/add" method="post" class="needs-validation" modelAttribute="patient">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <f:label path="id">ID</f:label>
                        <f:input type="text" cssClass="form-control" path="id" placeholder="" value="" required="true"/>
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
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
                <button class="btn btn-primary btn-lg btn-block" type="submit">Add Patient</button>

            </f:form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">© 2017-2018 Health Care</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
    </footer>
</div>
</body>
</body>
</html>
