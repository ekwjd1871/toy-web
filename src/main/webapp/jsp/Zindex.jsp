<%-- jsp 에서는 아래 태그를 추가해주어야 jsp 로 인식함--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    <head></head>
    <body>
        <h1>index.jsp !!</h1>
        <%-- Go --%>
        <button type="button" onclick="location.href='/Go'">1. Go Hello</button>
        <a href="/Go">2. Go Hello</a>
    </body>
</html>