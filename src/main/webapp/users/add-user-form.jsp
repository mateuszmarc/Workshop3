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
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="index.html">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
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
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
                    <a href="${pageContext.request.contextPath}/users/list"
                       class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-download fa-sm text-white-50"></i> Lista użytkowników</a>
                </div>

                <!-- Content Row -->
                <div class="card shadow mb-4">

                    <form method="post" action="${pageContext.request.contextPath}/users/add">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Dodaj użytkownika</h6>
                        </div>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${isUserAdded == false}">
                                    <div class="alert alert-warning" role="alert">
                                        <strong>Niepowodzenie!</strong> Wpisane dane nie spełniają wymagań lub podany
                                        email jest już przypisany do innego użytkownika.
                                    </div>
                                </c:when>
                                <c:when test="${isUserAdded == true}">
                                    <div class="alert alert-success" role="alert">
                                        <strong>Sukces!</strong> Użytkownik dodany pomyślnie
                                        <div>
                                            <a href="/users/list" class="btn btn-success">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                                <span class="text">Zobacz listę użytkowników</span>
                                            </a>
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>

                            <div class="form-group">
                                <label for="username">Nazwa</label><br>
                                <input id="username" class="form-control form-control-user " type="text" name="username"
                                       required>
                                <div>
                                    ${usernameRequirement}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label><br>
                                <input id="email" class="form-control form-control-user" type="text" name="email"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="password">Hasło</label><br>
                                <input id="password" class="form-control form-control-user" type="password"
                                       id="password"
                                       name="password" required>
                                <div>
                                    ${passwordRequirement}
                                </div>
                            </div>

                            <button class="btn btn-primary" type="submit">Zapisz</button>
                        </div>
                    </form>

                </div>

                <div class="row">
                </div>


            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="footer.jsp" %>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->


</body>

</html>
