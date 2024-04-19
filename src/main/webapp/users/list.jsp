<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<%@include file="header.jsp"%>

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
                                                    rowspan="1" colspan="1" style="width: 60px;" aria-sort="ascending"
                                                    aria-label="Name: activate to sort column descending">Id
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1"
                                                    colspan="1" style="width: 100px;"
                                                    aria-label="Position: activate to sort column ascending">Nazwa
                                                    użytkownika
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1"
                                                    colspan="1" style="width: 120px;"
                                                    aria-label="Office: activate to sort column ascending">Email
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1"
                                                    colspan="1" style="width: 180px;"
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
                                                    <td class="row-cols">
                                                        <div class="d-flex gap-2">
                                                            <a class="mr-3" href="${pageContext.request.contextPath}/users/show?id=${user.id}">
                                                                <button type="button" class="btn btn-outline-primary btn-sm">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                         height="16" fill="currentColor"
                                                                         class="bi bi-info-square" viewBox="0 0 16 16">
                                                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"></path>
                                                                        <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0"></path>
                                                                    </svg>
                                                                    Pokaż
                                                                </button>
                                                            </a>
                                                            <a class="mr-3" href="${pageContext.request.contextPath}/users/edit?id=${user.id}">
                                                                <button type="button" class="btn btn-outline-primary btn-sm">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
                                                                        <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001m-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708z"></path>
                                                                    </svg>
                                                                    Edytuj
                                                                </button>
                                                            </a>
                                                            <a class="mr-3" href="${pageContext.request.contextPath}/users/delete?id=${user.id}">
                                                                <button type="button" class="btn btn-outline-primary btn-sm">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                         height="16" fill="currentColor"
                                                                         class="bi bi-trash3" viewBox="0 0 16 16">
                                                                        <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47M8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"></path>
                                                                    </svg>
                                                                    Usuń
                                                                </button>
                                                            </a>
                                                        </div>
                                                    </td>
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
                                                            Showing ${(pageIndex - 1) * recordNumberByPage}
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
                                                                href="${pageContext.request.contextPath}/users/list?pageIndex=${pageIndex - 1}"
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
                                                                    <a href="${pageContext.request.contextPath}/users/list?pageIndex=${number}"
                                                                       aria-controls="dataTable" data-dt-idx="${number}"
                                                                       tabindex="0"
                                                                       class="page-link">${number}</a></li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="paginate_button page-item">
                                                                    <a href="${pageContext.request.contextPath}/users/list?pageIndex=${number}"
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
                                                               href="${pageContext.request.contextPath}/users/list?pageIndex=${pageIndex + 1}">Next</a>
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




</body>

</html>