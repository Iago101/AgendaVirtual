<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de Tarefas</title>
<style><%@include file="/WEB-INF/view/styles.css"%></style>
</head>
<body>

<header>
    <nav>
        <div class="menu">
                <a class="function" onclick="location.href='/AgendaVirtual/NovaTarefa';">Nova Tarefa</a>
                <a class="logout" onclick="location.href='/AgendaVirtual/Logout';">Logout</a>
        </div>
    </nav>
</header>

<div style="margin-top:0" class = "tabela">

<fieldset style="height:auto; margin-top:0; margin-right:0;">
	<form style="margin-top:0" action="<%=request.getContextPath()%>/Lista" method="post">
		<a style="font-size:20px; font-weight:bold">Título:</a> <input type="text" name="titulo" />
		<input name="buscar" type="submit" value="Pesquisar" />
	</form>
</fieldset>

<Div style="font-size:50px; text-align:center; font-weight:bold" >Tarefas</div>

<form action="<%=request.getContextPath()%>/Lista" method="post">
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Tarefa" %>
<table>
	<tr>
		<th>Título</th>
		<th>Descrição</th>
		<th>Data de Início</th>
		<th>Data de Conclusão</th>
		<th>Status</th>
		<th>Editar </th>
		<th>Excluir </th>
	</tr>
	<c:forEach items="${requestScope.lista_tarefas}" var="c">
		<tr>
			<td>
				${c.titulo}
			</td>
			<td>
				${c.descricao}
			</td>
			<td>
				${c.data_criacao}
			</td>
			<td>
				${c.data_conclusao}
			</td>
			<td>
				<c:choose>
				   <c:when test="${c.status=='nao_iniciada'}">Não Iniciada</c:when> 
				   <c:when test="${c.status=='em_andamento'}">Em Andamento</c:when> 
				   <c:when test="${c.status=='concluida'}">Concluída</c:when>
				</c:choose>
			</td>
			<td style="text-align:center">
				<img style="cursor:pointer" width="35" src="/assets/edit.png" onclick="location.href='/AgendaVirtual/EditarTarefa?id_tarefa=${c.id}'">
			</td>
			<td style="text-align:center">
				<input type="hidden" name="id_excluir" value="${c.id}" />
				<input width="35" src="/assets/delete.png" type="image" alt="Submit" value="Excluir" />
			</td>
		</tr>
	</c:forEach>
</table>
</form>
</div>
</body>
</html>