<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">
.clearfix:before,
.clearfix:after {
    display: table;

    content: ' ';
}
.clearfix:after {
    clear: both;
}
body {
    background: #f0f0f0 !important;
}
.page-404 .outer {
    position: absolute;
    top: 0;
    display: table;
    width: 100%;
    height: 100%;
}
.page-404 .outer .middle {
    display: table-cell;
    vertical-align: middle;
}
.page-404 .outer .middle .inner {
    width: 300px;
    margin-right: auto;
    margin-left: auto;
}
.page-404 .outer .middle .inner .inner-circle {
    height: 300px;

    border-radius: 50%;
    background-color: #ffffff;
}
.page-404 .outer .middle .inner .inner-circle:hover i {
    color: #39bbdb!important;
    background-color: #f5f5f5;
    box-shadow: 0 0 0 15px #39bbdb;
}
.page-404 .outer .middle .inner .inner-circle:hover span {
    color: #39bbdb;
}
.page-404 .outer .middle .inner .inner-circle i {
    font-size: 5em;
    line-height: 1em;
    float: right;
    width: 1.6em;
    height: 1.6em;
    margin-top: -.7em;
    margin-right: -.5em;
    padding: 20px;
    -webkit-transition: all .4s;
            transition: all .4s;
    text-align: center;
    color: #f5f5f5!important;
    border-radius: 50%;
    background-color: #39bbdb;
    box-shadow: 0 0 0 15px #f0f0f0;
}
.page-404 .outer .middle .inner .inner-circle span {
    font-size: 150px;
    font-weight: 700;
    line-height: 100%;
    display: block;
    -webkit-transition: all .4s;
            transition: all .4s;
    text-align: center;

    color: #e0e0e0;
}
.page-404 .outer .middle .inner .inner-status {
    font-size: 30px;
    display: block;
    margin-top: 20px;
    margin-bottom: 5px;
    text-align: center;
    color: #39bbdb;
}
.page-404 .outer .middle .inner .inner-detail {
    line-height: 1.4em;
    display: block;
    margin-bottom: 10px;
    text-align: center;
    color: #999999;
}
</style>
</head>
<body>
<div class="page-404">
    <div class="outer">
        <div class="middle">
            <div class="inner">
                <!--BEGIN CONTENT-->
                <div class="inner-circle"><i class="fa fa-home"></i><span>error</span></div>
                <span class="inner-status">죄송합니다.</span>
                <span class="inner-detail">
                   페이지가 없거나 오류가 발생했습니다.
                    <a href="${pageContent.request.contextPath }/main" class="btn btn-info mtl" style="color: #fff; margin-top: 10px;"><i class="fa fa-home"></i>&nbsp;
                        메인화면
                    </a> 
                </span>
            </div>
        </div>
    </div>
</div>
</body>
</html>