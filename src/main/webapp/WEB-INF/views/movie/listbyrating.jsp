<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MovieFan : 무비차트</title>
   <link type="image/png" href="/resources/images/movie/logo/moviefan-favicon.png" rel="icon"/>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<style>
	body, table, div, p, span{
	font-family: NanumBarunGothic; 
	font-weight: bold;
	}
	 a:link { 
	 color: #444; text-decoration: none;
	 }
	 a:visited { 
	 color: #444; text-decoration: none;
	 }
	 a:hover { 
	 color: #444; text-decoration: none;
	 }
	 .pic{
	 position: relative;
	 }
	 .pic .summary{
	 	position: absolute;
	 	z-index: -1;
	 	font-size: 16px;
	 	color:white;
	 }
	 .pic .rank{
	 	position: absolute;
	 	color : white;
	 	z-index: 1;
	 	margin-left: 10px;
	 	font-size: 2em;
    	font-style: italic;
    	text-shadow: 2px 2px 2px rgb(0 0 0 / 80%);
	 }
	 .pic .customerRating{
		position: absolute;
	 	z-index: -1;
	 	font-size: 16px;
	 	
	 }
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-9">
		<h1>무비 차트</h1>
		</div>
		<div class="col-3 text-align-right align-self-center">
			<div class="row">
				<div class="col">
					<ul id="sort" style="list-style:none;">
						<li>
							<span class="align-middle" style="font-size: 12pt; color:#b12e2e;">▶ 무비차트</span>
						</li>
						<li class="subMenu" style="visibility: hidden;">
							<a href="list"><span id="audience" style="font-size: 10pt;">&nbsp;&nbsp;▶ 관람객순</span></a>
						</li>
						<li class="subMenu" style="visibility: hidden;">
							<a href="listbyrating"><span id="rating" style="color:#b12e2e; font-size: 10pt;">&nbsp;&nbsp;▶ 평점순</span></a>
						</li>
					</ul>
				</div>
				<div class="col">
					<a id="movieStatus2" href="commingsoon"><span class="align-middle" style="font-size: 12pt;">상영예정작</span></a>
				</div>
			</div>
		</div>
		<hr size="3px" color="black">
	</div>
	<div class="row mb-3">
		<c:forEach var="movies" items="${movie }" varStatus="status">
			<div class="col-3 mb-3">
				<div class="row pic">
					<span class="rank">${status.count }</span>
					<img class="imgs" src="/resources/images/movie/moviePoster/${movies.no }.jpg" class="rounded float-start" alt="..."> 
					<span class="summary">${movies.summary }</span>
					<span class="customerRating">평점</span>
				</div>
				<div class="row">
					<div class="col-1">
						<img alt="" src="/resources/images/movie/age/age_15.png">
					</div>
					<div class="col">
						<a href="detail?no=${movies.no }"><span style="font-size: 15pt"><strong>${movies.title }</strong></span></a>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<span style="font-size: 12pt;">개봉일 <fmt:formatDate value="${movies.openDate }" pattern="yyyy.MM.dd" /></span>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-outline-dark wishListBtn" data-bs-toggle="modal" style="padding-left:10px; padding-right:10px;">
							<i class="far fa-heart fa-lg"></i><span> ${wishList[status.index] }</span>
						</button>
							<input type="hidden" value="${movies.no}" /> 
						
						<!-- Modal 
						<div class="modal fade" id="ratingModal" tabindex="-1" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						      	<span id="message"></span>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						      </div>
						    </div>
						  </div>
						</div>
						-->
					</div>
					<div class="col">
						<button type="button" class="btn btn-danger btn-block" style="padding-left:50px; padding-right:50px;"><span>예매</span></button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script type="text/javascript">

	$("#movieStatus1").prepend($("<span>▶</span>"));
	$("#movieStatus1").find("span").css("color", "#b12e2e");
	
	$(".imgs").hover(function(){
		$(this).css("opacity", 0.3);
		$(this).nextAll().css("color", "black");
	}, function(){
		$(this).css("opacity", 1);
		$(this).nextAll().css("color", "white");
	})
	
	$("#sort").hover(function(){
		$(".subMenu").css("visibility", "")
		$("#audience").hover(function(){
				$(this).css("color", "red");
			}, function(){
				$(this).css("color", "black");
			})
	}, function(){
		$(".subMenu").css("visibility", "hidden");
	})
	
	
	$("#movieStatus2").hover(function(){
		$(this).prepend($("<span>▶</span>"))
		$(this).find("span").css("color", "#b12e2e");
	}, function(){
		$(this).find("span").first().remove();
		$(this).find("span").css("color", "#444");
	})
	
	$(".wishListBtn").click(function(){
		var movieNo = $(this).next().val();
		var count = $(this).next();
	
		$.ajax({
			url : "/rest/movie/wishList",
			type : "post",
			dataType : "json",
			data: {
				movieNo : movieNo,
			},
			success : function(data){
				$(".wishListBtn").children("span").text(response.items[0]);
				alert("저장되었습니다.");
			},
			error : function(response){
				alert(response.error);
			}
		})
	})
	
</script>
</body>
</html>