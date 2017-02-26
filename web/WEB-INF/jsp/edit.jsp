<%--
  Created by IntelliJ IDEA.
  User: Денис
  Date: 20.02.2017
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <title>Customers</title>
  <c:if test="${empty customer}">
    <jsp:useBean id="customer" class="domain.Customer"/>
  </c:if>
  <style>
  .inputs{
    width: 150px;
  }
  </style>
</head>
<body>
<center>
<DIV class="customer">
  <c:if test="${not empty customer.id}">
  <c:url var="saveUrl" value="/save.html"/>
  <FORM action="${saveUrl}" method="post">
    <div class="inputs">
    <c:if test="${not empty customer.id}">
      <INPUT type="text" name="id" value="${customer.id}">
    </c:if>
    <BR>

    Name:<BR>
    <INPUT type="text" name="name" class="form-control" value="${customer.name}">
    Adress:<BR>
    <INPUT type="text" name="second_name" class="form-control" value="${customer.adress}">
    Number of projects:<BR>
    <INPUT type="text" name="middle_name" class="form-control" value="${customer.number_of_projects}">
    Finished projects:<BR>
    <INPUT type="text" name="login" class="form-control" value="${customer.finished_projects}"><BR>
    </div>
    <BUTTON type="submit" class="btn btn-success" >Save</BUTTON>
    <BUTTON type="reset" class="btn btn-warning">Reset</BUTTON><BR>
  </FORM>
  </c:if>
    <c:if test="${not empty customer.id}">
    <c:url var="deleteUrl" value="/delete.html"/>
    <form method="post" action="${deleteUrl}">
      <input type="text" name="id" value="${customer.id}">
      <button type="submit" class="btn btn-danger">Delete</button>
    </form>

  </c:if>
  <c:url var="indexUrl" value="/index.html"/>
  <A href="${indexUrl}">back</A>

</DIV>
</center>
</body>
</html>
