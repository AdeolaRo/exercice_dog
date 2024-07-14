<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="bootstrapImports.html" %>
    <title>Add Dog</title>
</head>
<body>

<div class="container">

    <h2>- Add Dog -</h2>

    <div class="col-8 offset-2 text-bg-dark p-3">
        <form action="${pageContext.request.contextPath}/dog/add" method="post">
            <div class="mb-3">
                <label for="name">Nom :</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="breed">Race :</label>
                <input type="text" id="breed" name="breed" required>
            </div>
            <div class="mb-3">
                <label for="dateOfBirth">Date de Naissance :</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" required>
            </div>
            <button type="submit" class="btn btn-primary">Ajouter</button>
        </form>
    </div>

</div>

</body>
</html>
