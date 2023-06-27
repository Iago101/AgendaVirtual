package model;

public class Usuario {
	private int id;
	private String login;
	private String senha;
	private String name;
	private String email;
	
	public Usuario(int id, String login, String senha, String name, String email) {
		this.id = id;
		this.login = login;
		this.senha = senha;
		this.name = name;
		this.email = email;
	}
	
	public Usuario(String login, String senha, String name, String email) {
		this.login = login;
		this.senha = senha;
		this.name = name;
		this.email = email;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
