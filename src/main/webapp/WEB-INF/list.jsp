<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.exercice_dog.model.Dog" %>
<jsp:useBean id="dogs" type="java.util.ArrayList<org.example.exercice_dog.model.Dog>" scope="request"/>
<html>
<head>
    <%@ include file="bootstrapImports.html"%>
    <title>Dogs List</title>
</head>
<body>

<div class="container">
    <header>
        <h1>- Dogs List -</h1>
    </header>
    <hr>
    <main class="container">
        <% if (dogs != null && !dogs.isEmpty()) { %>
        <table class="table table-dark text-center align-middle">

            <thead>
            <tr>
                <th>#</th>
                <th>Nom</th>
                <th>Race</th>
                <th>Date de naissance</th>
                <th>Actions</th>
            </tr>
            </thead>

            <tbody>
            <% for (Dog dog : dogs) { %>
            <tr>
                <td><%= dog.getId() %></td>
                <td><%= dog.getName() %></td>
                <td><%= dog.getBreed() %></td>
                <td><%= dog.getDateOfBirth() %></td>
                <td>
                    <a href="${pageContext.request.contextPath}/dog/detail?id=<%= dog.getId() %>" class="btn btn-success"><i class="bi bi-eye"></i> Detail</a>
                </td>
            </tr>
            <% } %>
            </tbody>

        </table>
        <% } else { %>

        <p>Vous n'avez aucun chien dans votre liste !!!</p>

        <% } %>
        <hr>

    </main>

    <a href="${pageContext.request.contextPath}/dog/add" class="btn btn-secondary"><i class="bi bi-plus-circle"></i> Add a Dog</a>
</div>


</body>
</html>
