<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Movie</title>
</head>
<body>
    <h2>Update Movie</h2>
    <form action="<c:url value='/movie/update' />" method="post">
        <table>
            <tr>
                <td>Movie ID:</td>
                <td><input type="text" name="movieId" value="${movieVO.movieId}" readonly></td>
            </tr>
            <tr>
                <td>Movie Name:</td>
                <td><input type="text" name="movieName" value="${movieVO.movieName}" required></td>
            </tr>
            <tr>
                <td>Rating:</td>
                <td>
                    <select name="movieRating">
                        <option value="1" ${movieVO.movieRating == 1 ? 'selected' : ''}>´¶¹M¯Å</option>
                        <option value="2" ${movieVO.movieRating == 2 ? 'selected' : ''}>«OÅ@¯Å</option>
                        <option value="3" ${movieVO.movieRating == 3 ? 'selected' : ''}>»²¾É¯Å</option>
                        <option value="4" ${movieVO.movieRating == 4 ? 'selected' : ''}>­­¨î¯Å</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Director:</td>
                <td><input type="text" name="director" value="${movieVO.director}" required></td>
            </tr>
            <tr>
                <td>Actor:</td>
                <td><input type="text" name="actor" value="${movieVO.actor}" required></td>
            </tr>
            <tr>
                <td>Release Date:</td>
                <td><input type="date" name="releaseDate" value="${movieVO.releaseDate}" required></td>
            </tr>
            <tr>
                <td>End Date:</td>
                <td><input type="date" name="endDate" value="${movieVO.endDate}" required></td>
            </tr>
            <tr>
                <td>Runtime:</td>
                <td><input type="number" name="runtime" value="${movieVO.runtime}" required></td>
            </tr>
            <tr>
                <td>Introduction:</td>
                <td><textarea name="introduction" required>${movieVO.introduction}</textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update Movie"></td>
            </tr>
        </table>
    </form>
    <br>
    <a href="<c:url value='/movie/listAllMovies' />">Back to Movie List</a>
</body>
</html>
