<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="jQuery" value="/resources/javascript/jQuery.js" />
<c:url var="bootstrapJs" value="/resources/javascript/bootstrap.min.js"/>
<c:url value="/resources/style/bootstrap.min.css" var="bootstrapCss"/>
<c:url var="nav" value="/resources/javascript/nav.js"/>
<c:url var="medical_symbol" value="../../resources/assets/medical-symbol.jpg"/>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <link rel="stylesheet" href="${bootstrapCss}" />
    <script type="text/javascript" src="${jQuery}"></script>
    <script type="text/javascript" src="${bootstrapJs}"></script>
    <script type="text/javascript" src="${nav}"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a id="PatientLink" class="nav-link" href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            Patients
                        </a>
                    </li>
                    <li class="nav-item">
                        <a id="DrugLink" class="nav-link" href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                            Drugs
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <%--<h1 class="h2">Charts</h1>--%>
                <img class="d-block mx-auto mb-4" src="${medical_symbol}" alt="medical symbol" width="72" height="72">
                <div class="btn-toolbar mb-2 mb-md-0">
                    <button class="btn btn-sm btn-outline-secondary">
                        <a class="nav-link active" href="/patient/modalAttr">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                            Dashboard <span class="sr-only">(current)</span>
                        </a>
                    </button>
                </div>
            </div>

            <h2 id="SectionTitle">Patient List</h2>
            <div class="table-responsive">
                <table id="PatientTable" class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>TYPE</th>
                            <th>CATEGORY</th>
                            <th>DAYS</th>
                            <th>XRAYS</th>
                            <th>SCANNING</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="i" begin="0" end="${patients.size()-1}">
                        <tr>
                            <td>${patients.get(i).id}</td>
                            <td>${patients.get(i).name}</td>
                            <td>${patients.get(i).type}</td>
                            <td>${patients.get(i).category}</td>
                            <td>${patients.get(i).days}</td>
                            <td>${patients.get(i).xrays}</td>
                            <td>${patients.get(i).scanning}</td>
                            <td>
                                <form style="margin: 0" action="/patient/edit" method="get">
                                    <%--<f:form action="/patient/edit" method="get" modelAttribute="patient">--%>
                                    <input name="id" value="${patients.get(i).id}" hidden/>
                                    <%--<f:input path="id" value="${patients.get(i).id}" hidden="true"/>--%>
                                    <button class="btn btn-sm btn-outline-secondary" type="submit">
                                    <a class="nav-link ">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                                    </a>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <table id="DrugTable" class="table table-striped table-sm" hidden>
                    <thead>
                    <tr>
                        <th>NAME</th>
                        <th>EXP DATE</th>
                        <th>INSTOCK</th>
                        <th>PRICE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="i" begin="0" end="${drugs.size()-1}">
                        <tr>
                            <td>${drugs.get(i).dname}</td>
                            <td>${drugs.get(i).exp_date}</td>
                            <td>${drugs.get(i).instock}</td>
                            <td>${drugs.get(i).price}</td>
                            <td>
                                <%--<f:form action="/drug/edit" method="get" modelAttribute="drug">--%>
                                <form style="margin: 0" action="/drug/edit" method="get">
                                <input  name="dname"  value="${drugs.get(i).dname}" hidden/>
                                <%--<f:input  path="dname"  value="${drugs.get(i).dname}" hidden="true"/>--%>
                                <button class="btn btn-sm btn-outline-secondary" type="submit">
                                    <a class="nav-link">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                                    </a>
                                </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>
</body>
</html>
