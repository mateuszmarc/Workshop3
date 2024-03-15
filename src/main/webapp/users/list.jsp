<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/users/list">
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
                    <a href="${pageContext.request.contextPath}/users/add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-download fa-sm text-white-50"></i> Dodaj użytkownika</a>
                </div>

                <!-- Content Row -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Lista użytkowników</h6>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-bordered dataTable" id="dataTable" width="100%"
                                               cellspacing="0" role="grid" aria-describedby="dataTable_info"
                                               style="width: 100%;">
                                            <thead>
                                            <tr role="row">
                                                <th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable"
                                                    rowspan="1" colspan="1" style="width: 145px;" aria-sort="ascending"
                                                    aria-label="Name: activate to sort column descending">Id
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1"
                                                    colspan="1" style="width: 225px;"
                                                    aria-label="Position: activate to sort column ascending">Nazwa
                                                    użytkownika
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1"
                                                    colspan="1" style="width: 102px;"
                                                    aria-label="Office: activate to sort column ascending">Email
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1"
                                                    colspan="1" style="width: 86px;"
                                                    aria-label="Salary: activate to sort column ascending">Akcja
                                                </th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th rowspan="1" colspan="1">Id</th>
                                                <th rowspan="1" colspan="1">Nazwa użytkownika</th>
                                                <th rowspan="1" colspan="1">Email</th>
                                                <th rowspan="1" colspan="1">Akcja</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <c:forEach items="${retrievedUsers}" var="user">
                                                <tr>
                                                    <td>${user.id}</td>
                                                    <td>${user.username}</td>
                                                    <td>${user.email}</td>
                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-5">
                                        <c:choose>
                                            <c:when test="${pageIndex == 1}">
                                                <c:choose>
                                                    <c:when test="${numberOfUsers < recordNumberByPage}">
                                                        <div class="dataTables_info" id="dataTable_info" role="status"
                                                             aria-live="polite">Showing ${pageIndex} to ${numberOfUsers}
                                                            of ${numberOfUsers}
                                                            entries
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dataTables_info" id="dataTable_info" role="status"
                                                             aria-live="polite">Showing ${pageIndex}
                                                            to ${pageIndex * recordNumberByPage} of ${numberOfUsers}
                                                            entries
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${(pageIndex * recordNumberByPage) > numberOfUsers}">
                                                        <div class="dataTables_info" id="dataTable_info" role="status"
                                                             aria-live="polite">
                                                            Showing ${(pageIndex - 1) * recordNumberByPage}
                                                            to ${numberOfUsers} of ${numberOfUsers}
                                                            entries
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dataTables_info" id="dataTable_info" role="status"
                                                             aria-live="polite">
                                                            Showing ${(pageIndex - 1) * recordNumberBYPage}
                                                            to ${pageIndex * recordNumberByPage} of ${numberOfUsers}
                                                            entries
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                    <div class="col-sm-12 col-md-7">
                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                            <ul class="pagination">
                                                <c:choose>
                                                    <c:when test="${pageIndex > 1}">
                                                        <li class="paginate_button page-item previous"
                                                            id="dataTable_previous"><a
                                                                href="${pageContext.request.contextPath}/users/list?page=${pageIndex - 1}"
                                                                aria-controls="dataTable"
                                                                data-dt-idx="0" tabindex="0"
                                                                class="page-link">Previous</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item disabled">
                                                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <ul class="pagination">

                                                    <c:forEach begin="1" end="${numberOfPages}" var="number">
                                                        <c:choose>
                                                            <c:when test="${pageIndex == number}">
                                                                <li class="paginate_button page-item active">
                                                                    <a href="${pageContext.request.contextPath}/users/list?page=${number}"
                                                                       aria-controls="dataTable" data-dt-idx="${number}"
                                                                       tabindex="0"
                                                                       class="page-link">${number}</a></li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="paginate_button page-item">
                                                                    <a href="${pageContext.request.contextPath}/users/list?page=${number}"
                                                                       aria-controls="dataTable" data-dt-idx="${number}"
                                                                       tabindex="0"
                                                                       class="page-link">${number}</a></li>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </c:forEach>
                                                </ul>

                                                <c:choose>
                                                    <c:when test="${pageIndex < numberOfPages}">
                                                        <li class="page-item">
                                                            <a class="page-link"
                                                               href="${pageContext.request.contextPath}/users/list?page=${pageIndex + 1}">Next</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item disabled">
                                                            <a class="page-link" href="#" tabindex="-1">Next</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/chart-area-demo.js"></script>
<script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>