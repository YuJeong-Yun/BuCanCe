<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<jsp:include page="../include/headerAdmin.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sb-admin-2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sb-admin-2.min.css" type="text/css">	
	

	    <div id="wrapper">
		<jsp:include page="../include/sideMenuAdmin.jsp" />
		
		<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">관광/맛집 게시글 작성</h1>
                            </div>
                            <form class="user">
                            	<div id="formRadio">
	                                  <input type="radio" value="0" checked="checked" name="category"> 관광지 &nbsp;&nbsp;&nbsp;&nbsp;                            
	                                  <input type="radio" value="1" name="category"> 맛집
	                            </div>      
                                <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="title" placeholder="글제목">
                                </div>
                                        <textarea cols="5" rows="7" class="form-control form-control-user" id="ta" placeholder="글내용"></textarea>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="exampleInputEmail" placeholder="주소" onclick="findAddr();" readonly>
                                </div>
                                <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="exampleInputPassword" placeholder="Password">
                                </div>
                                <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="exampleRepeatPassword" placeholder="Repeat Password">
                                </div>
                                <a href="login.html" class="btn btn-primary btn-user btn-block">
                                    Register Account
                                </a>
                                <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


    </div>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/addTour.js"></script>
<jsp:include page="../include/footer.jsp" />
