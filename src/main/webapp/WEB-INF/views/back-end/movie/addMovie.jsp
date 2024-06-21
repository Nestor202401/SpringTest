<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Movie</title>
</head>
<body>
    <h2>Add Movie</h2>
    <form action="<c:url value='/movie/insert' />" method="post">
        <table>
            <tr>
                <td>Movie Name:</td>
                <td><input type="text" name="movieName" required></td>
            </tr>
            <tr>
                <td>Rating:</td>
                <td>
                    <select name="movieRating">
                        <option value="1">´¶¹M¯Å</option>
                        <option value="2">«OÅ@¯Å</option>
                        <option value="3">»²¾É¯Å</option>
                        <option value="4">­­¨î¯Å</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Director:</td>
                <td><input type="text" name="director" required></td>
            </tr>
            <tr>
                <td>Actor:</td>
                <td><input type="text" name="actor" required></td>
            </tr>
            <tr>
                <td>Release Date:</td>
                <td><input type="date" name="releaseDate" required></td>
            </tr>
            <tr>
                <td>End Date:</td>
                <td><input type="date" name="endDate" required></td>
            </tr>
            <tr>
                <td>Runtime:</td>
                <td><input type="number" name="runtime" required></td>
            </tr>
            <tr>
                <td>Introduction:</td>
                <td><textarea name="introduction" required></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Add Movie"></td>
            </tr>
        </table>
    </form>
    <br>
    <a href="<c:url value='/movie/listAllMovies' />">Back to Movie List</a>
</body>
</html>
