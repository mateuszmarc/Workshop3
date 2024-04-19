<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<%@include file="commonViewParts/header.jsp"%>
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <%@include file="commonViewParts/page-heading.jsp" %>
                <!-- Content Row -->
                <div class="card shadow mb-4">
                     <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Edytuj użytkownika</h6>
                     </div>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${isUserUpdated == false}">
                                    <%@include file="commonViewParts/user-creation-edition-failure-information.jsp" %>
                                </c:when>
                                <c:when test="${isUserUpdated == true}">
                                    <%@include file="commonViewParts/user-creation-edition-success-information.jsp" %>
                                </c:when>
                            </c:choose>
                            <c:choose>
                            <c:when test="${user == null}">
                                <%@include file="commonViewParts/no-user-with-id-information.jsp" %>
                            </c:when>
                            <c:otherwise>
                            <form method="post" action="${pageContext.request.contextPath}/users/edit?id=${user.id}">
                                <%@include file="commonViewParts/add-edit-user-form-template.jsp" %>
                            </form>
                        </div>
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="commonViewParts/footer.jsp" %>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->
<script src="../theme/js/edit-and-add-user.js"></script>
</body>
</html>