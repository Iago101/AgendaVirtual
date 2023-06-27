package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.UsuarioDAO;
import model.Criptografia;
import model.Usuario;

@WebServlet("/cadastro")
public class Cadastro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioDAO udao = new UsuarioDAO();

    public Cadastro() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_cadastro.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		
		password = Criptografia.criptografar(password);
		Usuario user = null;
		
		try {
			if(udao.verificarLogin(login)) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_cadastro_login_existente.jsp");
				dispatcher.forward(request, response);
			} else {
				user = new Usuario(login, password, nome, email);
				try {
					udao.cadastrarUsuario(user);
				}catch(ClassNotFoundException e) {
					e.printStackTrace();
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/usuario_cadastro_sucesso.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
