<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="sidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="topbar.jsp" %>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <%@include file="page-heading.jsp" %>
                <!-- Content Row -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Dodaj użytkownika</h6>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${isUserAdded == false}">
                                <%@include file="user-creation-edition-failure-information.jsp" %>
                            </c:when>
                            <c:when test="${isUserAdded == true}">
                                <div class="alert alert-success" role="alert">
                                    <strong>Sukces!</strong> Użytkownik dodany pomyślnie
                                    <div>
                                        <a href="${pageContext.request.contextPath}/users/list"
                                           class="btn btn-success">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                            <span class="text">Zobacz listę użytkowników</span>
                                        </a>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                        <form method="post" action="${pageContext.request.contextPath}/users/add">
                            <%@include file="add-edit-user-form-template.jsp" %>
                        </form>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="footer.jsp" %>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->
</body>

</html>