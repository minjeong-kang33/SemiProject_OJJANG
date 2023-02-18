<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.itwillbs.report.db.ReportDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>중고의류거래: 옺장</title>
   <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
    <link rel="stylesheet" href="assets/css/owl-carousel.css">
    <link rel="stylesheet" href="assets/css/lightbox.css"> 
<meta charset="UTF-8">
</head>
<script>
function fun1() {
	let check = false;
	with(document.ckDelete) {
		if(ck.length==undefined) {
			if(ck.checked) { check = true; }
		} else {
			for(let i=0;i<ck.length;i++) {
				if(ck[i].checked) { check = true; } }
		} if(!check) {
		alert("강퇴할 멤버를 선택하세요");
			return;
		} else {
			if(confirm("강퇴처리 하시겠습니까?")) { submit(); }
		} } }

function fun2() {
	if($("input:checked[id='ckAll']").prop("checked")) {
	 $("input[type=checkbox]").prop("checked", true); 
	}else {
	 $("input[type=checkbox]").prop("checked", false); 
	}
}

function fun3() {
	if(document.scfr.info.value=="") {
		alert("검색목록을 선택하세요")
		document.scfr.info.focus();
		return;
	}
	if(document.scfr.search.value==0) {
		alert("검색어를 입력하세요");
		document.scfr.search.focus();
		return;
		}
		document.scfr.submit();
}
</script>
<body>
    <!-- ***** 헤더 ***** -->
  <jsp:include page="../admin_top.jsp" />
    <!-- ***** 헤더 끝 ***** -->
    
	<!-- ***** 신고회원목록조회 ***** -->
    <div class="page-heading about-page-heading" id="top">
        <div class="container">
             <div class="inner-content2">
             
<h3>신고회원목록조회</h3>
<%
request.setCharacterEncoding("utf-8");
ReportDTO dto=new ReportDTO();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");

ArrayList<ReportDTO> adUserReportListPro=(ArrayList<ReportDTO>)request.getAttribute("adUserReportListPro");

String info=(String)request.getAttribute("info");
String search=(String)request.getAttribute("search");
int adUserReportCount=(Integer)request.getAttribute("adUserReportCount");
%>
<section>
<div class="container">
	<div>
	<form action="AdUserReportListPro.ad" method="post" name="scfr">
		<ul>
		<li>
		<select name="info">
		<option value="">선택</option>
		<option value="R_id">피신고자아이디</option>
		<option value="M_id">신고자아이디</option>
		</select>
		<input type="text" name="search""> <input type="button" value="검색" onclick="fun3()"></li>
		</ul><br>
	</form>
		<div>
		<%=info %>> <%=search %>	검색결과 : <b><%=adUserReportListPro.size() %></b>명 / 총 <%=adUserReportCount %>명
		</div>
	</div>
<form name="ckDelete" action="AdUserReportDelete.ad" method="post">
<table border="1">
	<thead>
		<tr>
		<th scope="col"><input type="checkbox" id="ckAll" name="ckAll" onclick="fun2()"></th>
		<th scope="col">번호</th>
		<th scope="col">피신고자아이디</th>
		<th scope="col">신고사유</th>
		<th scope="col">기타사유</th>
		<th scope="col">카테고리</th>
		<th scope="col">글번호</th>
		<th scope="col">내용</th>
		<th scope="col">신고자아이디</th>
		<th scope="col">회원상태</th>
	</tr>
	</thead>
	
	<tbody>
<%
for(int i=0;i<adUserReportListPro.size();i++){
	dto=adUserReportListPro.get(i);
%>
	<tr><td><input type="checkbox" id="ck" name="ck" value="<%=dto.getR_id() %>"></td>
		<td><%=i+1 %></td>
		<td><%=dto.getR_id() %></td>
		<td><%=dto.getR_type() %></td>
		<td><%=dto.getR_reason() %></td>
		<td><%=dto.getR_category() %></td>
		<td><%=dto.getR_writeNum() %></td>
		<td><%=dto.getR_title() %></td>
		<td><%=dto.getM_id() %></td>
		<td><%=dto.getR_play() %></td></tr>
<%
}
%>
	</tbody>
</table>
<div>
회원 처리 <input type="button" value="강퇴" onclick="fun1()">
</div>
</form>
</div>
</section>
             </div>
        </div>
    </div>
    <!-- ***** 신고회원목록조회 끝 ***** -->
    
    <!-- ***** 푸터 시작 ***** -->
   <jsp:include page="../admin_bottom.jsp" />
    <!-- ***** 푸터 끝 ***** -->

 <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

 <!--  Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

 <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/accordions.js"></script>
    <script src="assets/js/datepicker.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script> 
    <script src="assets/js/slick.js"></script> 
    <script src="assets/js/lightbox.js"></script> 
    <script src="assets/js/isotope.js"></script> 
    
<!-- Global Init -->
    <script src="assets/js/custom.js"></script>

    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>
</body>
</html>