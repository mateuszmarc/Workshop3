<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<%@include file="header.jsp"%>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <%@include file="page-heading.jsp" %>

                <!-- Content Row -->
                <div class="card shadow mb-4">

                </div>
                <c:choose>
                    <c:when test="${isDeleted == false}">
                        <%@include file="no-user-with-id-information.jsp" %>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-success" role="alert">
                            <strong>Sukces!</strong> Użytkownik usunięty pomyślnie
                            <a href="${pageContext.request.contextPath}/users/list">
                            <div>
                                <button type="button" class="btn btn-primary">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                              d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"></path>
                                    </svg>
                                    Wróć
                                </button>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>

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