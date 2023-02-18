<%@page import="com.itwillbs.sell.db.SellDTO"%>
<%@page import="com.itwillbs.sell.db.SellDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>중고의류거래: 옺장</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">
<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
<link rel="stylesheet" href="assets/css/owl-carousel.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link href="assets/css/buy.css" rel="stylesheet" type="text/css">
<link href="assets/css/sellDetails.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>중고 의류거래: 옺장</title>
<script type="text/javascript">
function fun1(M_id, S_num, R_category, S_title) {
	   
    window.open("ReportForm.rpt?R_id=" + M_id + "&R_writeNum="
          + S_num + "&R_category=" + R_category + "&R_title=" + S_title,
          "pop", "width=520,height=340");
 }
</script>
</head>
<body>
	<!-- ***** 로딩 일단 지금은 비어있음***** -->
	<div id="preloader">
		<div class="jumper">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>

	<!-- ***** 헤더 ***** -->
	<jsp:include page="../top.jsp" />
	<!-- ***** 헤더 끝 ***** -->

	<%
	/* int S_num = Integer.parseInt(request.getParameter("S_num"));
	SellDAO dao = new SellDAO();
	SellDTO dto = dao.getSellBoard(S_num); */
	String M_id = (String) session.getAttribute("M_id");
	SellDTO dto = (SellDTO) request.getAttribute("dto");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
	%>
	<section class="section" id="products">
		<!-- 게시판 제목  -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="aa"></div>
					<div class="section-heading">
						<h2 style="margin-top: 180px">팝니다</h2>
						<span>sell</span>
					</div>
				 <!--  폼 추가했어요!!~!~!~!~!~!~! 데이터 넘기기 편하시라고.... -->
					
					
					<div class="item-box1">
					
					<!-- 상품이미지 -->
					<div class="item-img"> 
						<img src="img/sell/<%=dto.getS_img()%>" class="goodsImg">
					</div>
					
					
					<!-- 상품정보 -->
					<div class="item-info"> 
					   <div class="item-info2">
					   		<!--  카테고리 -->
							<span class="info-category"> <%=dto.getS_category()%> 
							
							<!--  좋아요, 찜하기 -->
							<span class="info-like">  
								<%if(M_id != null){//글쓴이에게는 찜하기 안보임
									if(!M_id.equals(dto.getM_id())){%>
								<button type="button" onclick="location.href='LikePro.like?S_num=<%=dto.getS_num() %>'" class="heartbtn"><img src="sell/heart.png" alt="찜하기" class="heart"></button>
									<%}
										}%>
							</span></span><br> 
							<span class="info-title"><%=dto.getS_title()%></span> <br> <!-- 글제목 -->
							<span class="info-price"><%=dto.getS_price()%>원</span> <!-- 가격 -->
							
							<hr><!-- 가로줄 -->
							
							
							<!-- 거래방식  -->
							<span class="info-send"> 
								<% if(dto.getS_send1()!=null&&dto.getS_send2()!=null){%> <%= "<b>택배거래</b>, <b>직거래</b>"%><%}
														 else if(dto.getS_send1()!=null){%> <%= "<b>택배거래</b>"%><%}
														 else if(dto.getS_send2()!=null){%> <%= "<b>직거래</b>"%><%}%>
							</span> 
							
							<!-- 조회수 -->
							<span class="info-eye"><img src="assets/images/eye.png" class="eye"><%=dto.getS_view() %></span>
						<div>
						
						<div>
							<!-- 판매자~거래일자 구분항목(왼쪽) -->
							<div class="item-info3"> 
								<div style="margin: auto 0;">
								<br>
								<span > 판매자 </span> <br><br>
								<span> 작성일자 </span> <br><br>
								<span> <% if(dto.getS_send2()!=null){%> <span> 거래 선호 지역 <%} else { %>　<%}%></span> <br><br>
								</div>
							</div>
							
							<!-- 판매자~거래일자 data(오른쪽) -->
							<div class="item-info4">
								<div style="margin: auto 0;">
									<br>
									<!-- 판매자 ID -->
									<span><%=dto.getM_id()%></span> <br><br>
									<!-- 작성일자 -->
									<span><%=dateFormat.format(dto.getS_createdate())%></span> <br><br>
									<!-- 거래지역 -->
									<% if(dto.getS_send2()!=null){%>
									<span class="info-location">
										<img src="sell/location_icon.png" class="location"><%= dto.getS_sido1()%> <%= dto.getS_gugun1()%><%} else { %>　<%}%></span> <br><br>
								</div>
							</div>
						</div>
							<div class="requestBox">
											<%
								if(M_id != null){
									//본인에게는 거래요청하기 안보임!
									if(!M_id.equals(dto.getM_id())){
								%>
							<input type="button" class="requestBtn" value="거래요청하기" style="margin-bottom: 40px;"
                       			onclick="location.href='DealWantPro.deal?S_num=<%=dto.getS_num()%>&M_id=<%=dto.getM_id() %>'">
								<%
									}
								}
								 %>	
								 
									<%
								if (M_id != null) {
									// 세션값=id와 글쓴이가 일치하는경우 거래요청 내역보기 버튼 생성
									if (M_id.equals(dto.getM_id())) {
								%>
							<input type="button" class="requestBtn" value="구매희망자 보기" style="margin-bottom: 40px;"
                        		onclick="location.href='DealWantList.deal?S_num=<%=dto.getS_num()%>'">
								<%
									}
								}
								 %>	
							</div>
						 </div>	 
						</div>
					</div>
					
		
					
					<!-- 판매 상세글 -->
					<div class="item-detail" >
						<div style="margin-left: 50px; float: left; width: 950px;">
							<hr> <!-- 가로줄 -->
							  <div class="item-detail-text"> 제품 상세 정보 </div> <br>
						  	<div class="textBox"><%=dto.getS_text()%></div> 
						</div>
			<div class="btn-naran">
				<%
				if (M_id != null) {
					// 세션값=id와 글쓴이가 일치해야만 글수정, 글삭제 표시
					if (M_id.equals(dto.getM_id())) {
				%>
				<input type="button" class="btn btn-dark" value="글수정" style="margin-right: 10px;"
					onclick="location.href='SellEditForm.sell?S_num=<%=dto.getS_num()%>'">
				<input type="button" class="btn btn-dark" value="글삭제"
					onclick="location.href='SellDelete.sell?S_num=<%=dto.getS_num()%>'">
				<%
				}
				}
				%>
				<%
				if (M_id != null) {
					// 세션값=id와 글쓴이가 일치해야만 글수정, 글삭제 표시
					if (M_id.equals("admin")) {
				%>
				<input type="button" class="btn btn-dark" value="글삭제"
					onclick="location.href='SellDelete.sell?S_num=<%=dto.getS_num()%>'">
				<%
				}
				}
				%>
				
				<button type="button" class="btn btn-dark" onclick="history.back()"
					style="float: right; margin-left: 10px;">글목록</button>
		
				<%
				if(M_id != null){
					//본인에게는 신고하기, 찜하기 안보임
					if(!M_id.equals(dto.getM_id())){
				%>
				<button type="button" class="btn btn-dark" onclick="fun1('<%=dto.getM_id()%>','<%=dto.getS_num()%>','<%=dto.getS_category() %>','<%=dto.getS_title()%>')" style="float: right">신고하기</button>
				<%
					}
				}
				 %>
				
				
		
				</div>
			</div>
		</div>
					
		
				
					<!--보내지는 내용 숨겨지도록(post) 작성한 글을 writeAction으로 보냄 -->
<!-- 					<table class="table table-stripe"
						style="text-align: center;" > -->
<!-- 						<colgroup>
							<col style="width: 601px">
							<col style="width: 101px">
							<col style="width: 301px">
						</colgroup> -->
<%-- 							<tr>
								<td rowspan="7"
									style="text-align: center"><%=dto.getS_title()%></td>
							</tr>
							<tr>
								<td rowspan="7"><img src="img/sell/<%=dto.getS_img() %>" width=300px height=300px class="goodsImg"></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><%=dto.getM_id()%></td>
							</tr>
							<tr>
								<td>카테고리</td>
								<td><%=dto.getS_category()%></td>
							</tr>
							<tr>
								<td>거래유형</td>
								<td>
									<%
									if (dto.getS_send1() != null) {
									%> <%="택배거래<br>"%> <%
 }
 %> <%
 if (dto.getS_send2() != null) {
 %> <%="(" + dto.getS_sido1() + ")<br>직거래"%> <%
 }
 %>
								</td>
							</tr>
							<tr>
								<td>조회수</td>
								<td><%=dto.getS_view()%></td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td><%=dateFormat.format(dto.getS_createdate())%></td>
							</tr>
							<tr>
								<td height="150">글내용</td>
								<td><%=dto.getS_text()%></td>
							</tr>
					</table> --%>
	
				</div>
			</div>
		</div>
	</section>
	

	<!-- ***** 푸터 시작 ***** -->
	<jsp:include page="../bottom.jsp" />
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
			$("p").click(function() {
				selectedClass = $(this).attr("data-rel");
				$("#portfolio").fadeTo(50, 0.1);
				$("#portfolio div").not("." + selectedClass).fadeOut();
				setTimeout(function() {
					$("." + selectedClass).fadeIn();
					$("#portfolio").fadeTo(50, 1);
				}, 500);
			});
		});
	</script>



</body>
</html>