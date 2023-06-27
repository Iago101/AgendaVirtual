package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;

import java.io.IOException;
import java.text.ParseException;

import dao.TarefaDAO;

@WebServlet("/lista")
public class Lista extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TarefaDAO tdao = new TarefaDAO();

    public Lista() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = (String) request.getSession().getAttribute("usuario");
		if(usuario != null) {
			ServletContext sc = getServletContext();
			Usuario user = (Usuario) sc.getAttribute("usuario");
			try {
				tdao.buscarTarefas(user.getId());
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("lista_tarefas", tdao.getTarefasUsuario());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_tarefas.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_login.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = (String) request.getSession().getAttribute("usuario");
		if(usuario != null) {
			ServletContext sc = getServletContext();
			Usuario u = (Usuario) sc.getAttribute("usuario");
			
			if(request.getParameter("id_excluir") != null) {
				int id_tarefa = Integer.parseInt(request.getParameter("id_excluir"));
				try {
					 tdao.excluirTarefa(id_tarefa);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				
				try {
					tdao.buscarTarefas(u.getId());
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("lista_tarefas", tdao.getTarefasUsuario());
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_tarefas.jsp");
				dispatcher.forward(request, response);
			} else{
			
				String tituloBuscar = (String) request.getParameter("titulo");
				try {
					if(tituloBuscar.equals("") || tituloBuscar.equals(null)) {
						try {
							tdao.buscarTarefas(u.getId());
							} catch (ClassNotFoundException e) {
								e.printStackTrace();
							}
							request.setAttribute("lista_tarefas", tdao.getTarefasUsuario());
							RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_tarefas.jsp");
							dispatcher.forward(request, response);
						} 
						else if(!tituloBuscar.isEmpty()) {
							request.setAttribute("lista_tarefas", tdao.pesquisarTarefa(tituloBuscar, u.getId()));
							RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_tarefas.jsp");
							dispatcher.forward(request, response);
						}
					
					}catch(ClassNotFoundException e) {
						e.printStackTrace();
					}

			
			}
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
