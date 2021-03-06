<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
	<div class="main">
		<a class="title" href="${contextPath}/index" target="_parent" title="XX论坛">
			<i class="iconfont icon-jiaoliu layui-hide-xs" style="font-size: 22px;"></i>
			XXXX论坛</a>
		<div class="nav">
			<a class="nav-this" href="index.html">
				<i class="iconfont icon-wenda"></i>你问我答</a>
		</div>
		<div class="nav-user">




			<a   class="iconfont icon-touxiang layui-hide-xs" style="margin-top: 4px; display: inline-block;">
			</a>
			<div class="nav"  style="font-size:14px;color: white;margin-top: -5px;margin-left: 1px; "  />
            <c:if test="${user == null}">
                <a href="${pageContext.servletContext.contextPath}/user/loginPage"  target="_parent" >登录</a>
                <a href="${pageContext.servletContext.contextPath}/user/registerPage" target="_parent" >注册</a>
            </c:if>
            <c:if test="${user != null}">
                <a>${user.loginname}</a>
                <a href="${pageContext.servletContext.contextPath}/user/logout">退出</a>
            </c:if>
		</div>
	</div>
</div>
</div>