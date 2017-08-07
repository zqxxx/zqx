package com.wjq.stu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wjq.stu.bean.User;

/**
 * 
 * @author HarvestWu
 *
 */
public class LoginFilter implements Filter{
	
	User user=new User();
	public void destroy() {
    }

    public void doFilter(ServletRequest servletRequest,ServletResponse servletResponse, 
    		FilterChain filterChain)throws IOException, ServletException {
        
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String currentURL = request.getRequestURI();
        // 取得根目录所对应的绝对路径:
        String targetURL = currentURL.substring(currentURL.indexOf("/", 1),currentURL.length());
        // 截取到当前文件名用于比较
        HttpSession session = request.getSession(false);
        if (!"/login.jsp".equals(targetURL)) {// 判断当前页是否是重定向以后的登录页面页面，如果是就不做session的判断，防止出现死循环
            if (session == null || session.getAttribute("userName") == null) {
                System.out.println("request.getContextPath()="+ request.getContextPath());
                response.sendRedirect(request.getContextPath()+"/login.jsp");
                return;
            }
        }
        // 加入filter链继续向下执行
        filterChain.doFilter(request, response);
        
    }

    public void init(FilterConfig filterConfig) throws ServletException {
    }

}
