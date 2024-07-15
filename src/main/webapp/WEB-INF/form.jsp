<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 12/07/2024
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%@ include file="bootstapImports.html" %>

    <title>Add Dog</title>

</head>
<body>
<div class="container">
    <h2>- Add Dog -</h2>
     <div class="col-8 offset-2 text-bg-dark p-3">
        <form action="${pageContext.request.contextPath}/dog/list" method="post">

            <div class="mb-3">
                <label for="id">Id :</label>
                <input type="number" id="id" name="id">
            </div>

            <div class="mb-3">
                <label for="name">Nom :</label>
                <input type="text" id="name" name="name">
            </div>

            <div class="mb-3">
                <label for="breed">Race :</label>
                <input type="text" id="breed" name="breed">
            </div>

            <div class="mb-3">
                <label for="dateOfBirth">Date de Naissance :</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth">
            </div>

            <button class="text-end">Ajouter</button>

        </form>
    </div>


</div>
</body>
</html>
