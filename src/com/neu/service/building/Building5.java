package com.neu.service.building;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neu.bean.Building2_Info;
import com.neu.bean.Building4_Info;
import com.neu.bean.Building5_Info;
import com.neu.dao.Building5_DAO;


public class Building5 extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

	this.doPost(request, response);

	}
	
	//ˢ�µ�����
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	
		request.setCharacterEncoding("gb2312");
		
		HttpSession session = request.getSession();
		//���õ�ǰλ��
		session.setAttribute("Present_Location","[��������]-[�ۺ���Ϣ����]");
		//��ʼ����ѯ����
		if(request.getParameter("init")!= null){
	
			 session.setAttribute("com_name","0");
             session.setAttribute("build_num","0");
             session.setAttribute("unit_num","0");    
             session.setAttribute("room_num","");		
		}
		
		//��session��ȡ��ѯ����
		String com_name = (String) session.getAttribute("com_name");
		String build_num = (String) session.getAttribute("build_num");
		String unit_num = (String) session.getAttribute("unit_num");
		String room_num = (String)session.getAttribute("room_num");
		
		Building5_DAO b5_dao = new Building5_DAO();
		List<Building5_Info> resultList = b5_dao.select(com_name,build_num,unit_num,room_num);
		
		
		/*******************************************��ҳ����(�̶�����)*******************************************/
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
			 if(((Integer)session.getAttribute("currentPage")).intValue()<(Integer)session.getAttribute("pageCount"))
				currentPage = ((Integer)session.getAttribute("currentPage")).intValue()+1;
		}
		else if(request.getParameter("jump_type").equals("last")){
			currentPage = (Integer)session.getAttribute("pageCount");
		}
		else{
			currentPage = Integer.parseInt(request.getParameter("to_page"));
		}
		session.setAttribute("currentPage",currentPage);
		/*******************************************��ҳ����(�̶�����)*******************************************/
		
		//��ѯ�ļ�¼������
		session.setAttribute("recordCount",resultList.size());
		//��¼��ҳ��(15��/ҳ)
		session.setAttribute("pageCount",resultList.size()/15+ (resultList.size()%15!=0?1:0));
		
		List<Building5_Info> list = null;
		if(resultList.size()!=0)
			 list = resultList.subList((currentPage-1)*15,(currentPage*15<=resultList.size()-1)?currentPage*15:resultList.size());
	
		//��ѯ�����һҳ
		session.setAttribute("list",list);
		
		request.getRequestDispatcher("../building/building5.jsp").forward(request,response);
	
	}

}
