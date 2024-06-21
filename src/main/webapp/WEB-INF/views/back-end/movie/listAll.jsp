<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Movies</title>
</head>
<body>
    <h2>All Movies</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Movie ID</th>
                <th>Movie Name</th>
                <th>Rating</th>
                <th>Director</th>
                <th>Actor</th>
                <th>Release Date</th>
                <th>End Date</th>
                <th>Runtime (minutes)</th>
                <th>Introduction</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="movie" items="${movieListData}">
                <tr>
                    <td>${movie.movieId}</td>
                    <td>${movie.movieName}</td>
                    <td>
                        <c:choose>
                            <c:when test="${movie.movieRating == 1}">´¶¹M¯Å</c:when>
                            <c:when test="${movie.movieRating == 2}">«OÅ@¯Å</c:when>
                            <c:when test="${movie.movieRating == 3}">»²¾É¯Å</c:when>
                            <c:when test="${movie.movieRating == 4}">­­¨î¯Å</c:when>
                        </c:choose>
                    </td>
                    <td>${movie.director}</td>
                    <td>${movie.actor}</td>
                    <td><fmt:formatDate value="${movie.releaseDate}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${movie.endDate}" pattern="yyyy-MM-dd"/></td>
                    <td>${movie.runtime}</td>
                    <td>${movie.introduction}</td>
                    <td>
                        <form action="<c:url value='/movie/getOne_For_Update' />" method="post">
                            <input type="hidden" name="movieId" value="${movie.movieId}">
                            <input type="submit" value="Edit">
                        </form>
                        <form action="<c:url value='/movie/delete' />" method="post">
                            <input type="hidden" name="movieId" value="${movie.movieId}">
                            <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this movie?');">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <a href="<c:url value='/movie/addMovie' />">Add New Movie</a>
</body>
</html>
