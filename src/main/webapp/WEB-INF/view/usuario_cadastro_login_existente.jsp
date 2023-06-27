<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Erro de Cadastro</title>
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
<h1 class="error-page">Usuário já cadastrado, informe outras credenciais</h1> <br>
<div style="text-align:center">
	<input  class = "botao" type="button" value="Cadastro" onclick="location.href='/AgendaVirtual/Cadastro';" />
</div>

</body>
</html>