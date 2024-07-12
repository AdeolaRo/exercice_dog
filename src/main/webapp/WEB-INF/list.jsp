<%@ page import="org.example.exercice_dog.model.Dog" %>
<jsp:useBean id="dogs" type="java.util.ArrayList<org.example.exercice_dog.model.Dog>" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" integrity="sha384-4LISF5TTJX/fLmGSxO53rV4miRxdg84mZsxmO8Rx5jGtp/LbrixFETvWa5a6sESd" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
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
    <a href="${pageContext.request.contextPath}/dog/form" class="btn btn-primary"><i class="bi bi-plus-circle"></i> Add a Dog</a>


</div>
</body>
</html>
