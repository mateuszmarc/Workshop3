<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<%@include file="header.jsp"%>

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
<script src="../theme/js/edit-and-add-user.js"></script>
</body>

</html>