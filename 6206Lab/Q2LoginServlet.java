package servlets;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.AccountDBAO;


/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		this.doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        req = request;
        resp = response;
        
		String email = request.getParameter("email"); // 拿到要验证的数据
		String password = request.getParameter("password");
        boolean result = false ; // 标志数据库里是否存在
        try {
			AccountDBAO account = new AccountDBAO();
			result = account.authenticate(id, password);
		}
		catch (Exception e)
		{
		 e.printStackTrace();
			
        }	
        if (result){

			System.out.print("result true!");
			request.getRequestDispatcher("/verifyOTP.jsp").forward(request,response);
			return;
		
		}
		else {
            resp.getWriter().print("false"); 		
			response.sendRedirect("login.jsp");
			return;
		}
	}

}
