
<%@page import="com.itwillbs.sell.db.SellDTO"%>
<%@page import="com.itwillbs.admin.db.MypageDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
    <link rel="stylesheet" href="assets/css/owl-carousel.css">
    <link rel="stylesheet" href="assets/css/lightbox.css"> 
<!--    <link href="assets/css/reviewWriteList.css" rel="stylesheet" type="text/css"> -->
      <link href="assets/css/sell.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>중고 의류거래: 옺장</title>

   <script type="text/javascript">     

    </script>
    
</head>

   <body>
   
      <script type="text/javascript">     

    
    </script>
   
<%
String M_id=(String)session.getAttribute("M_id");
// LikeDTO dto=new LikeDTO();
MypageDAO dao=new MypageDAO();
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");

int currentPage=(Integer)request.getAttribute("currentPage");
int startPage=(Integer)request.getAttribute("startPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int endPage=(Integer)request.getAttribute("endPage");
int pageCount=(Integer)request.getAttribute("pageCount");

ArrayList<SellDTO> likeList=(ArrayList<SellDTO>)request.getAttribute("likeList");
// SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
%>	

    <!-- ***** 로딩 일단 지금은 비어있음***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    .
    <!-- ***** 헤더 ***** -->
  <jsp:include page="../top.jsp" />
    <!-- ***** 헤더 끝 ***** -->

		<section class="section" id="products">


		<!-- 게시판 제목  -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>찜목록</h2>
						<span>Like list</span>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="item">
						<div class="down-content">
<!-- 게시판 내용 여기부터 넣으세요  -->
						

	
<table>
	<tr> <!--  테이블................1칸 -->
	<%
							
							for(int i=0;i<likeList.size();i++){
							 	SellDTO dto=likeList.get(i);
								
							%>
		<td>
			<table class="item-table">
				<tr>
					<td colspan="2" class="S_img"><a href="SellOuterDetails.sell?S_num=<%=dto.getS_num()%>" >
					<img src="img/sell/<%=dto.getS_img() %>" width=300px height=300px class="goodsImg"></a></td>
				</tr>
				<tr>
					<td colspan="2" class="S_title" > <a href="SellOuterDetails.sell?S_num=<%=dto.getS_num()%>" > <%=dto.getS_title()%></a></td> <!-- 제목 -->
				</tr>
				<tr>
					<td><%=dto.getM_id() %></td>
				</tr>
<!-- 				<tr> -->
<%-- 					<td><%=dto.getS_category() %></td> --%>
<!-- 				</tr> -->
				<tr>
					<td class="price"><%=dto.getS_price()%>원</td>
				</tr>
			</table>
		</td>		
			<%
			if((i+1) %3 ==0){
			%>
				</tr>
				<tr>
				
			<%
			 }
			%>
	<%
	 }
	%>	
	
</tr>
</table>
<!-- 게시판 내용 여기 넘어가면 안됨.  -->							
					</div>
					
			<div style="width: 1000px;">		
				<!--  페이지 번호  -->
				<%

				
				for(int i=startPage;i<=endPage;i++){
					%>
					<a href="Likelist.moi?pageNum=<%=i%>"><%=i %></a> 
					<%
				}

				%>
				

			</div>		
					</div>
				</div>
			</div>
		</div>
</section>
	<!-- ***** 푸터 시작 ***** -->
<jsp:include page="../bottom.jsp" />
    <!-- ***** 푸터 끝 ***** -->

 <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js">
    </script>

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