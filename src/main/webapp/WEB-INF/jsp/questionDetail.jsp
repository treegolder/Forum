<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>问题详情</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="keywords" content="fly,layui,前端社区">
	<meta name="description" content="">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/global.css">
	<script src="${pageContext.servletContext.contextPath}/assets/layui/layui.js"></script>

		<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.js"></script>
	<style type="text/css" rel="stylesheet">
		form {
			margin: 0;
		}
		.editor {
			margin-top: 5px;
			margin-bottom: 5px;
		}
	</style>

	</head>
	<body>
		<%--公共头部开始--%>
		<jsp:include page="/WEB-INF/jsp/common/head.jsp"></jsp:include>
		<%--公共头部结束--%>
		<div class="main layui-clear">
			<div class="wrap">
				<div class="content detail">
					<div class="fly-panel detail-box">
						<h1>${question.title}</h1>
						<div class="fly-tip fly-detail-hint" data-id="">
							<span class="fly-tip-stick">置顶帖</span><span class="jie-admin"> <a
								href="">点击置顶</a> </span> <span
								class="layui-btn layui-btn-mini jie-admin"> <a href="">取消置顶</a>
							</span> <span class="jie-admin" type="del" style="margin-left: 20px;">
								<a>删除该帖</a> </span>
							</span>
							<div class="fly-list-hint">
								<i class="iconfont" title="回答">&#xe60c;</i> 2
							</div>
						</div>
						<div class="detail-about">
							<a class="jie-user" href=""> <img src="${contextPath}/img/uer.jpg" alt="头像"> <cite> 压缩
									<em><fmt:formatDate value="${question.createtime}" pattern="yyyy-MM-dd" />发布</em> </cite> </a>
							<div class="detail-hits" data-id="{{rows.id}}">
								<span class="layui-btn layui-btn-mini jie-admin">
									<a href="#">已完帖，无法编辑</a>
								</span>
								<span class="layui-btn layui-btn-mini jie-admin" type="collect" data-type="add">
									<a id="collectPost">收藏</a>
								</span>
								<span class="layui-btn layui-btn-mini jie-admin  layui-btn-danger" type="collect" data-type="add">
									<a>取消收藏</a>
								</span>
							</div>
						</div>
						<div class="detail-body photos" style="margin-bottom: 20px;">
							<p>${question.description}</p>
						</div>
					</div>

					<div class="fly-panel detail-box" style="padding-top: 0;">
						<a name="comment"></a>
						<ul class="jieda photos" id="jieda">
							<c:choose>
								<c:when test="${answerList != null}">
									<c:forEach items="${answerList}" var="answer">
										<li data-id="12" class="jieda-daan">
											<div class="detail-about detail-about-reply">
												<a class="jie-user" href="javascript:;">
													<img src="${contextPath}/img/uer.jpg" alt="">
													<cite> <i>纸飞机</i></cite>
												</a>
												<div class="detail-hits">
													<span>3分钟前</span>
												</div>
												<i class="iconfont icon-caina" title="最佳答案"></i>
											</div>
											<div class="detail-body jieda-body">
												<p>${answer.content}</p>
											</div>
											<div class="jieda-reply">
												<span class="jieda-zan zanok" type="zan"><i
													class="iconfont icon-zan"></i><em>12</em>
												</span>
											</div>
										</li>
									</c:forEach>
								</c:when>
								<c:when test="${answerList == null}">
									<li class="fly-none">没有任何回答</li>
								</c:when>
							</c:choose>


							<%--<li data-id="13"><a name="item-121212121212"></a>
								<div class="detail-about detail-about-reply">
									<a class="jie-user" href=""> <img
										src="res/images/uer.jpg" alt=""> <cite> <i>香菇</i>
											<em style="color:#FF9E3F">活雷锋</em> </cite> </a>
									<div class="detail-hits">
										<span>刚刚</span>
									</div>
								</div>
								<div class="detail-body jieda-body">
									<p>蓝瘦</p>
								</div>
								<div class="jieda-reply">
									<span class="jieda-zan" type="zan"><i
										class="iconfont icon-zan"></i><em>0</em>
									</span>
									<div class="jieda-admin">
										<span type="del"><a href="#" class="layui-btn layui-btn-danger layui-btn-small">删除</a></span>
										<span class="jieda-accept" type="accept">
										<a href="#" class="layui-btn  layui-btn-small">采纳</a></span>
									</div>
								</div></li>--%>

							<!-- <li class="fly-none">没有任何回答</li> -->
						</ul>

						<span id="toName">@ 压缩(楼主)</span>
						<div class="layui-form layui-form-pane">
							<form action="${pageContext.servletContext.contextPath}/ans/save" method="post">
								<input type="hidden" name="questionId" value="${question.id}">
								<div class="layui-form-item layui-form-text">
									<div class="layui-input-block">
										<textarea id="L_content" name="content" placeholder="我要回答" class="layui-textarea fly-editor" style="height: 150px;"></textarea>
									</div>
								</div>
								<div class="layui-form-item">
									<c:if test="${user != null}"><button class="layui-btn" lay-filter="*" lay-submit >提交回答</button></c:if>

									<c:if test="${user == null}"><button class="layui-btn" lay-filter="*" lay-submit disabled>提交回答</button></c:if>

								</div>
							</form>
						</div>

					</div>
				</div>
			</div>

			<div class="edge">
				<dl class="fly-panel fly-list-one">
					<dt class="fly-panel-title">最近热帖</dt>
					<dd>
						<a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
							class="iconfont">&#xe60b;</i> 6087</span>
					</dd>
					<dd>
						<a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
							767</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
							class="iconfont">&#xe60b;</i> 6087</span>
					</dd>
					<dd>
						<a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
							767</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
							class="iconfont">&#xe60b;</i> 6087</span>
					</dd>
					<dd>
						<a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
							767</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
							class="iconfont">&#xe60b;</i> 6087</span>
					</dd>
					<dd>
						<a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
							767</span>
					</dd>
				</dl>

				<dl class="fly-panel fly-list-one">
					<dt class="fly-panel-title">近期热议</dt>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
				</dl>
			</div>
		</div>

<%--		<script>--%>
<%--			function submitForm() {--%>
<%--			let formDetail = $("#submitForm").serialize();--%>
<%--			let user = "${user}";--%>
<%--			if (user == null || user == ""){--%>
<%--				window.location.href = "${pageContext.servletContext.contextPath}/login";--%>

<%--			}else if (user!=null||user!=""){--%>
<%--				//alert("sss")--%>
<%--				$.ajax({--%>
<%--					url:"${pageContext.servletContext.contextPath}/ans/save",--%>
<%--					data:formDetail,--%>
<%--					type:"post"--%>
<%--				});--%>
<%--			}--%>
<%--			}--%>
<%--		</script>--%>
	    <script type="text/javascript" charset="utf-8" src="${pageContext.servletContext.contextPath}/js/kindeditor.js"></script>
	    <script type="text/javascript">
			KE.show({
				id : 'L_content',
				resizeMode : 1,
				items : [
				'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
				'removeformat', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', 'emoticons', 'image', 'link']
			});
		</script>
	</body>
</html>