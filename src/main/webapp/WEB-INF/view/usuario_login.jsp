<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style><%@include file="/WEB-INF/view/styles.css"%></style>
</head>
<body>
<header>
<nav>
    <ul class="menu">
        <li >
            <a >Agenda Virtual</a>
        </li>
    </ul>
</nav>
</header>
<fieldset>
	<form  action="<%=request.getContextPath()%>/login" method="post">
		<div >
			<p>
				<span>Usuário:</span> <input class="text-input" type="text" name="login" />
			</p>
			<p>
				<span>Senha:</span> <input class="text-input" type="password" name="password" />
			</p>
			<p>
				<input style="margin-top:30px; margin-bottom:30px;" class = "botao" type="submit" value="Logar" />
				<br>
				<a class="advisor-text"> Não tem uma conta? Crie aqui</a> <br>
				<input style="margin-top:10px;" class = "botao" type="button" value="Criar Conta" onclick="location.href='/AgendaVirtual/Cadastro';" />
			</p>
		</div>
	</form>
</fieldset>

</body>
</html>