<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="alert alert-success" role="alert">
    <strong>Sukces!</strong> Dane użytkownika edytowanie pomyślnie
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