<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.exercice_dog.model.Dog" %>
<jsp:useBean id="dog" type="org.example.exercice_dog.model.Dog" scope="request"/>
<html>
<head>
    <%@ include file="bootstrapImports.html" %>
    <title>Dog Detail</title>
</head>
<body>

<div class="container">
    <h2>- Dog Details -</h2>
    <% if (dog != null) { %>
    <div class="card">
        <div class="card-header">
            <h3><%= dog.getName() %></h3>
        </div>
        <div class="card-body">
            <p><strong>ID:</strong> <%= dog.getId() %></p>
            <p><strong>Race:</strong> <%= dog.getBreed() %></p>
            <p><strong>Date de Naissance:</strong> <%= dog.getDateOfBirth() %></p>
        </div>
    </div>
    <% } else { %>
    <p>Le chien demandé n'existe pas.</p>
    <% } %>
    <a href="${pageContext.request.contextPath}/dog/list" class="btn btn-secondary">Back to List</a>
</div>

</body>
</html>
