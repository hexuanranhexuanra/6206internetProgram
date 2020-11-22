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
public class VerifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyServlet() {
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
        
        String OPT = request.getParameter("OPT");
        String id = req.getParameter("id"); // 拿到要验证的数据
        boolean result = false ; // 标志数据库里是否存在
        try {
			AccountDBAO account = new DBCController();
			result = account.verifyOTP(id, OPT);
		}
		catch (Exception e)
		{
		 e.printStackTrace();
			
        }	
        if (result){

            resp.getWriter().print("result:true"); 
            resp.getWriter().print("id:'tutor'"); 
			// request.getRequestDispatcher("/verifyOTP.jsp").forward(request,response);
			return;
		
		}
		else {
            resp.getWriter().print("result:false"); 	
			response.sendRedirect("login.jsp");
			return;
		}
	}

}
