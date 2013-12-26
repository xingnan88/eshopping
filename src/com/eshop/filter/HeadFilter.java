package com.eshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eshop.bean.Admin;
import com.eshop.bean.Member;

public class HeadFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		Member member = (Member)request.getSession().getAttribute("member");
		if(member != null){
			arg2.doFilter(arg0, arg1);
		}else{
			response.setHeader("refresh", "0;url=/e_shop/head/disLogin.jsp");
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
