package com.neu.service.clean;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neu.bean.Clean1_Info;
import com.neu.dao.Clean1_DAO;

public class Clean1 extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	
	}

	//ˢ�µ�����
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		
		HttpSession session = request.getSession();
		
		String temp_cleaner_num=(String) session.getAttribute("cleaner_num");
		int cleaner_num=0;
		if(temp_cleaner_num!=null&&!temp_cleaner_num.isEmpty())
		 cleaner_num=Integer.parseInt(temp_cleaner_num);//��¼���
		//System.out.println("cleaner:"+cleaner_num);
		String name = (String) session.getAttribute("name");           //����
		String position = (String) session.getAttribute("position");             //ְλ
		String work_range = (String) session.getAttribute("work_range");             //��������
		
		
		
		Clean1_DAO c1_dao = new Clean1_DAO();
		List<Clean1_Info> resultList = c1_dao.select(cleaner_num,name,position,work_range);
		//��ѯ���
		
		/*****��ҳ����******/
		//����Ҫ��ѯ��ҳ��
		int currentPage = (Integer)session.getAttribute("currentPage");
		if(request.getParameter("jump_type").equals("first")){
			currentPage = 1;
		}
		else if(request.getParameter("jump_type").equals("back")){
			if(((Integer)session.getAttribute("currentPage")).intValue()>=2)
				currentPage = ((Integer)session.getAttribute("currentPage")).intValue()-1;
		}
		else if(request.getParameter("jump_type").equals("next")){
			 if(((Integer)session.getAttribute("currentPage")).intValue()<((Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0)))
				currentPage =((Integer)session.getAttribute("currentPage")).intValue()+1;
		}
		else if(request.getParameter("jump_type").equals("last")){
			currentPage = ((Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0));
		}
		else{
			currentPage = Integer.parseInt(request.getParameter("to_page"));
			System.out.println("page" + currentPage);
		}
		session.setAttribute("currentPage",currentPage);
		
		//��ѯ�ļ�¼������
		session.setAttribute("pageCount",resultList.size());
		//��ѯ�����һҳ
		List<Clean1_Info> list = resultList.subList((currentPage-1)*15,(currentPage*15<resultList.size()-1)?currentPage*15:resultList.size());
		
		request.setAttribute("list",list);   
		request.getRequestDispatcher("../clean/clean1.jsp").forward(request,
				response);
		 
	}


}
