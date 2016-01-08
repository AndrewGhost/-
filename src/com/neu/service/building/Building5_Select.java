package com.neu.service.building;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Building5_Select extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("gb2312");
		
		String com_name = request.getParameter("com_name");
		String build_num = request.getParameter("build_num");
		String unit_num = request.getParameter("unit_num");
		String room_num = request.getParameter("room_num");
		String owner_name = (String) request.getAttribute("owner_name");
		
		//������session�б���
    	HttpSession session = request.getSession();
    	session.setAttribute("com_name",com_name);
    	session.setAttribute("build_num",build_num);
    	session.setAttribute("unit_num",unit_num);
    	session.setAttribute("room_num",room_num);
    	session.setAttribute("owner_name",owner_name);
    	
		request.getRequestDispatcher("../servlet/Building5?jump_type=first").forward(request,
				response);
		
	}

}
