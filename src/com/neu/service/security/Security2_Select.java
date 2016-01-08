package com.neu.service.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Security2_Select extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		    this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("gb2312");
    
		String cleaner_num=request.getParameter("cleaner_num").split(" ")[0];
		
		String work_content=request.getParameter("work_content");
			
		String tools= request.getParameter("tools");
		String work_time= request.getParameter("work_time");
	
		//������session�б���
    	HttpSession session = request.getSession();
    	session.setAttribute("cleaner_num",cleaner_num);
        session.setAttribute("work_content",work_content);
        session.setAttribute("tools",tools);
        session.setAttribute("work_time",work_time);
        
        session.setAttribute("cleaner_num_tran",cleaner_num);//��ѯ��ʱ�����ڴ���ֵ��jspȥ��ʾ
        session.setAttribute("work_content_tran",work_content);
        session.setAttribute("tools_tran",tools);
        session.setAttribute("work_time_tran",work_time);
        
		request.getRequestDispatcher("../servlet/Security2?jump_type=first").forward(request,
				response);
		
	}

}

