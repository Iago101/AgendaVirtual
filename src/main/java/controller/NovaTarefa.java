package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tarefa;
import model.Usuario;

import java.io.IOException;
import java.text.ParseException;

import dao.TarefaDAO;

@WebServlet("/new-task")
public class NovaTarefa extends HttpServlet {
	private static final long serialVersionUID = 1L;
    TarefaDAO tdao = new TarefaDAO();
    
    public NovaTarefa() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = (String) request.getSession().getAttribute("usuario");
		if(usuario != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/tarefa_cadastro.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_login.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = (String) request.getSession().getAttribute("usuario");
		if(usuario != null) {
			String titulo = request.getParameter("titulo");
			String descricao = request.getParameter("descricao");
			String data_criacao = request.getParameter("data_criacao");
			String data_conclusao = request.getParameter("data_conclusao");
			String status = request.getParameter("status");
			
			Tarefa t = new Tarefa();
			t.setTitulo(titulo);
			t.setDescricao(descricao);
			t.setStatus(status);
			
			ServletContext sc = getServletContext();
			Usuario user = (Usuario) sc.getAttribute("usuario");
			t.setUser(user);
			
			java.text.DateFormat fmt = new java.text.SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date data_criacaoSQL;
			java.sql.Date data_conclusaoSQL;
			
			try {
				data_criacaoSQL = new java.sql.Date(fmt.parse(data_criacao).getTime());
				t.setData_criacao(data_criacaoSQL);
				data_conclusaoSQL = new java.sql.Date(fmt.parse(data_conclusao).getTime());
				t.setData_conclusao(data_conclusaoSQL);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			try {
				tdao.cadastrarTarefa(t);
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("lista_tarefas", tdao.getTarefasUsuario());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_tarefas.jsp");
			dispatcher.forward(request, response);
			
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
