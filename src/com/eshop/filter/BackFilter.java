package com.eshop.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.jasper.tagplugins.jstl.core.Out;

import com.eshop.bean.Admin;

public class BackFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Admin admin = (Admin)request.getSession().getAttribute("admin");
		PrintWriter out = response.getWriter();
		if(admin != null){
			arg2.doFilter(arg0, arg1);
		}else{
			//response.setHeader("refresh", "0;url=/e_shop/back/disLogin.jsp");
			out.println("<script>top.location.href='/e_shop/back/disLogin.jsp';</script>");
			
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
