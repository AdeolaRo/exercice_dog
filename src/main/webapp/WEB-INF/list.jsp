<%@ page import="org.example.exercice_dog.model.Dog" %>
<jsp:useBean id="dogs" type="java.util.ArrayList<org.example.exercice_dog.model.Dog>" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

   <%@ include file="bootstapImports.html"%>

    <title>Chiens</title>
</head>
<body>

<div class="container">
<header>
    <h1>- Dogs List -</h1>
</header>
<hr>
<main class="container">
    <% if (!dogs.isEmpty()) { %>
    <table class="table table-dark text-center align-middle">
        <thead>
        <tr>
            <th>#</th>
            <th>Nom</th>
            <th>Race</th>
            <th>date de naissance</th>
        </tr>
        </thead>
        <tbody>
        <% for (Dog d : dogs) { %>
        <tr>
            <td><%= d.getId() %>
            </td>
            <td><%= d.getName() %>
            </td>
            <td><%= d.getBreed() %>
            </td>
            <td><%= d.getDateOfBirth().getDayOfMonth() + "/" + d.getDateOfBirth().getMonthValue() + "/" + d.getDateOfBirth().getYear() %>
            </td>
            <td>
                <a href="detail?id=<%=d.getId()%>" class="btn btn-success text-end"><i class="bi bi-eye"></i> Detail </a> >
            </td>
        </tr>
        <% } %>
        </tbody>

    </table>
    <% } else { %>
    <p>Vous n'avez aucun chat dans votre liste !!!</p>
    <% } %>
    <hr>
</main>

<%--    <a class="btn btn-light" href="form.jsp"><i class="bi bi-plus-circle-fill"></i>Add a Dog</a>--%>
    <a href="${pageContext.request.contextPath}/dog/add" class="btn btn-secondary col-3 offset-8 d-grid gap-2 d-md-flex justify-content-md-end"><i class="bi bi-plus-circle"></i> Add a Dog</a>


</div>
</body>
</html>
