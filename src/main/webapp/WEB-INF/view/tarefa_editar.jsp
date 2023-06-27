<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style><%@include file="/WEB-INF/view/styles.css"%></style>
<title>Editar Tarefa</title>
</head>
<body>
<header>
     <nav>
    	<div class="menu">
                <a class="function" onclick="location.href='/AgendaVirtual/Lista';">Lista</a>
                <a class="logout" onclick="location.href='/AgendaVirtual/Logout';">Logout</a>
        </div>
    </nav>
</header>
<fieldset>
		<form action="<%=request.getContextPath()%>/EditarTarefa" method="post">
		<div style="margin:auto;text-align:left;width:fit-content">
			<p>
				<span>Título:</span> <input class="text-input" type="text" name="titulo" value=<%= request.getAttribute("titulo") %> />
			</p>
			<p>
				<span>Descrição:</span> <input class="text-input" type="text" name="descricao" value=<%= request.getAttribute("descricao") %> />
			</p>
			<p>
				<span class="span_left">Início:</span> <input class="text-input" type="date" name="data_criacao" value=<%= request.getAttribute("data_criacao") %> />
			</p>
			<p>
				<span class="span_left">Conclusão:</span> <input class="text-input" type="date" name="data_conclusao" value=<%= request.getAttribute("data_conclusao") %> />
			</p>
			<% String status = (String) request.getAttribute("status"); %>
			<p>
				<span class="span_left">Status:</span>
				<select class="text-input" name = "status">
					<% if(status.equals("nao_iniciada")){ %>
						<option value="nao_iniciada" selected>Não Iniciada</option>
					<% } else { %>
						<option value="nao_iniciada">Não Iniciada</option>
					<% } %>
					
					<% if(status.equals("em_andamento")){ %>
						<option value="em_andamento" selected>Em Andamento</option>
					<% } else { %>
						<option value="em_andamento">Em Andamento</option>
					<% } %>
					
					<% if(status.equals("concluida")){ %>
						<option value="concluida" selected>Concluída</option>
					<% } else { %>
						<option value="concluida">Concluída</option>
					<% } %>
				</select>
			</p>
			</div>
			<p>
				<input style="margin-top:40px" class = "botao" type="submit" value="Enviar" />
			</p>
		</form>
</fieldset>
</body>
</html>