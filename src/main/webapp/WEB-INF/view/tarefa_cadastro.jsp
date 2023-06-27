<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Criar Tarefa</title>
<style><%@include file="/WEB-INF/view/styles.css"%></style>
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
		<form  action="<%=request.getContextPath()%>/NovaTarefa" method="post">
		<div style="margin:auto;text-align:left;width:fit-content">
			<p>
				<span>Título:</span> <input class="text-input" type="text" name="titulo" required="required" />
			</p>
			<p>
				<span>Descrição:</span> <input class="text-input" type="text" name="descricao" />
			</p>
			<p>
				<span>Início:</span> <input class="text-input" type="date" name="data_criacao"/>
			</p>
			<p>
				<span >Conclusão:</span> <input class="text-input" type="date" name="data_conclusao"  />
			</p>
			<p>
				<span >Status:</span>
				<select name = "status" class="text-input">
					<option value="nao_iniciada">Não Iniciada</option>
					<option value="em_andamento">Em Andamento</option>
					<option value="concluida">Concluída</option>
				</select>
			</p>
		</div>
			<p>
				<input style="margin-top:40px" class = "botao" type="submit" value="Criar" />
			</p>
		</form>
	</fieldset>
</body>
</html>