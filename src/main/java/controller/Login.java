package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Criptografia;
import model.Usuario;

import java.io.IOException;

import dao.TarefaDAO;
import dao.UsuarioDAO;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioDAO udao = new UsuarioDAO();
	TarefaDAO tdao = new TarefaDAO();
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String password = Criptografia.criptografar(request.getParameter("password"));
		try {
			Usuario user = udao.buscarUsuario(login, password);
			if(user != null) {
				request.getSession().setAttribute("usuario", login);
				ServletContext sc = getServletContext();
				sc.setAttribute("login", login);
				sc.setAttribute("password", password);
				sc.setAttribute("usuario", user);
				
				try {
					tdao.buscarTarefas(user.getId());
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				request.setAttribute("lista_tarefas", tdao.getTarefasUsuario());
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_tarefas.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_login_erro.jsp");
				dispatcher.forward(request, response);
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
