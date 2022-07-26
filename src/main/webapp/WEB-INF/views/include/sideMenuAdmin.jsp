<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <li>
                <div class="sidebar-brand d-flex align-items-center justify-content-center" id="sideTitle" 
                onclick="location.href='/main';">부캉스</div>
                <hr class="sidebar-divider my-0">
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="/admin/profitChart">
                    <span>📝 Dashboard</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="/admin/memberMg">
                  <span>👨‍👨‍👧‍👧 회원관리</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="/admin/addTour">
                  <span>🌄 관광지 추가</span></a>
            </li>
            
            
            <li class="nav-item">
                <a class="nav-link" href="/order/noautoScheduled">
                  <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                  <span>수동 스케줄러</span></a>
            </li>
            
     
        </ul>
        <!-- End of Sidebar -->     