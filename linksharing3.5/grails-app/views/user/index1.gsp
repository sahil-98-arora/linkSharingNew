<%--
  Created by IntelliJ IDEA.
  User: sahil-arora
  Date: 08/03/21
  Time: 2:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<table border="black">
    <tr>
        <th>FirstName</th>
        <th>LastName</th>
        <th>Email</th>
        <th>Username</th>
        <th>Date created</th>
        <th>Last updated</th>
    </tr>
    <g:each in="${allusers}" var="num">
        <tr>
            <td>${num.firstName}</td>
            <td>${num.lastName}</td>
            <td>${num.email}</td>
            <td>${num.userName}</td>
            <td>${num.dateCreated}</td>
            <td>${num.lastUpdated}</td>
        </tr>
    </g:each>
</table>


</body>
</html>