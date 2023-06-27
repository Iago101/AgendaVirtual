<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Inválido</title>
<style><%@include file="/WEB-INF/view/styles.css"%></style>
</head>
<body>
<header>
	<nav>
	    <ul class="menu">
	        <li onclick="location.href='/AgendaVirtual/Login';" style="cursor: pointer;" >
	            <a >Agenda Virtual</a>
	        </li>
    	</ul>
	</nav>
</header>
<h1 class="error-page">Credenciais inváldas, tente novamente</h1> <br>
<div style="text-align:center">
	<input  class = "botao" type="button" value="Login" onclick="location.href='/AgendaVirtual/Login';" />
</div>
</body>
</html>