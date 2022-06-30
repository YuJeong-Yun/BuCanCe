<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="../include/header.jsp" %>
    <!-- Header End -->

   <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Blog</h2>
                        <div class="bt-option">
                            <a href="./home.html">Home</a>
                            <span>Blog Grid</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
    
<div class="travel_cateSrh">
            <div class="cate-area">
                <div class="cate-item">
                    <div class="title"><label for="w3c_category" class="label">카테고리 선택</label>
                        <div class="cateSel cate1">
                            <select name="ucc2_seq" id="w3c_category" title="카테고리 선택">
                                <option value="">카테고리 선택</option>
                                
                                    <option title="선택안됨" value="50">강서구</option>
                                    <option title="선택안됨" value="50">금정구</option>
                                    <option title="선택안됨" value="50">기장군</option>
                                    <option title="선택안됨" value="50">남구</option>
                                    <option title="선택안됨" value="50">동구</option>
                                    <option title="선택안됨" value="86">동래구</option>
                                    <option title="선택안됨" value="86">부산진구</option>
                                    <option title="선택안됨" value="86">북구</option>
                                    <option title="선택안됨" value="86">사상구</option>
                                    <option title="선택안됨" value="86">사하구</option>
                                    <option title="선택안됨" value="86">서구</option>
                                    <option title="선택안됨" value="86">수영구</option>
                                    <option title="선택안됨" value="86">연제구</option>
                                    <option title="선택안됨" value="86">영도구</option>
                                    <option title="선택안됨" value="86">중구</option>
                                    <option title="선택안됨" value="86">해운대구</option>
                                
                            </select>
                        </div>
                    </div>
                </div>
                
                <div class="cate-srh">
                    <div class="srh-area">
                        <i class="srh-icon"></i>
                        <label class="label" for="w3c_search">검색</label>
                        <input type="text" name="search_keyword" id="w3c_search" value="" title="검색어 입력">
                    </div>
                    <div class="tag_srh_area trvL">
                        <a href="javascript:searchForm.submit();" class="srhBtn" title="검색">검색</a>
                    </div>
                </div>
            </div>
        </div>

    <!-- Blog Section Begin -->
    <section class="blog-section blog-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-1.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="./blog-details.html">Tremblant In Canada</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div>
                            <i class="fa fa-hand-pointer-o" aria-hidden="true"></i> 조회수
                            <i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글
                            <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                            <i class="fa fa-heart-o" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-2.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Camping</span>
                            <h4><a href="./blog-details.html">Choosing A Static Caravan</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-4.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Trivago</span>
                            <h4><a href="./blog-details.html">A Time Travel Postcard</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 22th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-5.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Camping</span>
                            <h4><a href="./blog-details.html">A Time Travel Postcard</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 25th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-6.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="./blog-details.html">Virginia Travel For Kids</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 28th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-7.jpg">
                        <div class="bi-text">
                            <span class="b-tag">fsfsdfsfds</span>
                            <h4><a href="./blog-details.html">Bryce Canyon A Stunning</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 29th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-8.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Event & Travel</span>
                            <h4><a href="./blog-details.html">Motorhome Or Trailer</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 30th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-9.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Camping</span>
                            <h4><a href="./blog-details.html">Lost In Lagos Portugal</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 30th April, 2019</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="load-more">
                        <a href="#" class="primary-btn">Load More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->


    <%@ include file="../include/footer.jsp" %>