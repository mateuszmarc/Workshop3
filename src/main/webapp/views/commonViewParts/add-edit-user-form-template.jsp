<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="form-group">
    <label for="username">Nazwa</label><br>
    <input id="username" class="form-control form-control-user " type="text" name="username"
           required value="${user.username}">
</div>
<div class="form-group">
    <label for="email">Email</label><br>
    <input id="email" class="form-control form-control-user" type="text" name="email"
           required value="${user.email}">
</div>
<div class="form-group">
    <label for="password">Hasło</label><br>
    <input id="password" class="form-control form-control-user" type="Password"
           id="password"
           name="password" required>
</div>
<button class="btn btn-primary" type="submit">Zapisz</button>