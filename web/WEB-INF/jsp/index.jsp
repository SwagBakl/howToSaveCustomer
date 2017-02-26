<%--
  Created by IntelliJ IDEA.
  User: Денис
  Date: 19.02.2017
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  </head>
  <body>
  <div class="container">
    <h2>Customers</h2>
    <p>List of customers</p>
    <table class="table table-bordered">
      <thead>
      <TR>
        <th>Name</th>
        <th>Adress</th>
        <th>Number of projects</th>
        <th>Finished projects</th>
      </TR>
      </thead>
      <tbody>
      <c:forEach var="customer" items="${customers}">
        <tr>
          <c:url var="editUrl" value="/edit.html">
            <c:param name="id" value="${customer.id}"/>
          </c:url>
          <td>
            <A href="${editUrl}">${customer.name}</A>
          </td>
          <c:set var="adress" value="${customer.adress}"/>
          <td>
              ${customer.adress}
          </td>
          <td>
            <fmt:formatNumber value="${customer.number_of_projects}"/>
          </td>
          <td>
            <fmt:formatNumber value="${customer.finished_projects}"/>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
  </body>

</html>
