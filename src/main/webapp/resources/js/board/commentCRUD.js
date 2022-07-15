// 3번째 게시글
var cno = 3;

// 댓글 목록 호출
getReplies();

// 댓글 목록 출력 함수
function getComment() {

    $.getJSON(path+"/comment/all/" + num, function (data) {

        console.log(data);

        var str = "";

        $(data).each(function () {
            str += "<li data-cno='" + this.cno + "' class='CommetLis'>"
                +   "<p class='content'>" + this.content + "</p>"
                +   "<p class='writer'>" + this.writer + "</p>"
                +   "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
                + "</li>"
                + "<hr/>";

        });

        $("#comment").html(str);

    });

}