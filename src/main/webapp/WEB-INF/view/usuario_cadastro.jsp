<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Novo cadastro</title>
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
<fieldset>
	<form action="<%=request.getContextPath()%>/Cadastro" method="post">
	<p>
		<span>Nome:</span> <input class="text-input" type="text" name="nome" required="required" />
	</p>
	<p>
		<span>E-mail:</span> <input class="text-input" type="email" name="email" required="required"/>
	</p>
	<p>
		<span>Usuário:</span> <input class="text-input" type="text" name="login" required="required" />
	</p>
	<p>
		<span>Senha:</span> <input class="text-input" type="password" name="password" required="required" />
	</p>
	<p>
		<input style="margin-top:60px; " class = "botao" type="submit" value="Registrar" />
	</p>
</form>
</fieldset>
</body>
</html>