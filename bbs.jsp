<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width,initial-scale=1">
<title>모여라 레시피</title>
<script src="${pageContext.request.contextPath}/resources/js/reviewStar.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/reviewStar.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/miniMain.css" rel="stylesheet"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="miniMain">
	<jsp:include page="nav.jsp"/>
	<form action="bbs" class="search1" style="padding-top: 5px;padding-bottom:5px ; background-color:#FBF8EF">
			<div class="search2">
				<input type="hidden" name="pageNumber" value="1">
				<input type="hidden" name="bbsSort" value="BBSHIT">
				<input class="searchText" type="text" name="searchItem" placeholder="레시피 검색">
				<input class="searchImg" type="submit" name="" value="&#xf002">
			</div>
		</form> 	
	<div class="bbsContainer1">
		<div class="row">
			<table class="bbsTable1">
				<tr>
					<th class="bbsTableA"><span>종류별</span></th>
					<td>
						<div>
							<div class="bbsTableB" style="text-decoration: none;">
								<a style="color: green;<c:if test="${bbsCategory eq null}">background-color: gold;</c:if>" 
								class="bbsCategory" href="bbs?pageNumber=1&bbsSort=BBSHIT">전체</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="bbs?pageNumber=1&bbsSort=BBSHIT&bbsCategory=한식"class="bbsCategory"style="<c:if test="${bbsCategory eq '한식'}">background-color: gold;</c:if>">한식</a>&nbsp;
								<a href="bbs?pageNumber=1&bbsSort=BBSHIT&bbsCategory=양식"class="bbsCategory"style="<c:if test="${bbsCategory eq '양식'}">background-color: gold;</c:if>">양식</a>&nbsp;
								<a href="bbs?pageNumber=1&bbsSort=BBSHIT&bbsCategory=일식"class="bbsCategory"style="<c:if test="${bbsCategory eq '일식'}">background-color: gold;</c:if>">일식</a>&nbsp;
								<a href="bbs?pageNumber=1&bbsSort=BBSHIT&bbsCategory=중식"class="bbsCategory"style="<c:if test="${bbsCategory eq '중식'}">background-color: gold;</c:if>">중식</a>&nbsp;
								<a href="bbs?pageNumber=1&bbsSort=BBSHIT&bbsCategory=기타"class="bbsCategory"style="<c:if test="${bbsCategory eq '기타'}">background-color: gold;</c:if>">기타</a>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="bbsContainer2">
		<div class="row">
		<div class="newHitDiv">
			<a id="newBtn"class="newHitBtn" href="bbs?pageNumber=1&bbsSort=BBSID&bbsCategory=${bbsCategory}&searchItem=${searchItem}" style="<c:if test="${bbsSort eq 'BBSID'}">background-color: gold;</c:if>">최신순</a> | 
			<a id="hitBtn" class="newHitBtn" href="bbs?pageNumber=1&bbsSort=BBSHIT&bbsCategory=${bbsCategory}&searchItem=${searchItem}" style="<c:if test="${bbsSort eq 'BBSHIT'}">background-color: gold;</c:if>">조회순</a>
		</div>	
			<table class="bbsTable2">
				<tbody>
					<c:if test="${fn:length(list)>0}">
					<c:forEach items="${list}" var="BbsVO" varStatus="status" begin="${min}" end="${max-1}">
					<c:if test="${status.index%4==0}">
					<tr>
					</c:if>
						<td><a style="color: red;">${BbsVO.bbsID}</a><br>
							<img class="bbsImg"
							src="${pageContext.request.contextPath}/resources/upload/${BbsVO.bbsFileName}"><br>
							<a class="bbsTitle"
							href="view?bbsID=${BbsVO.bbsID}&pageNumber=${pageNumber}&bbsSort=${bbsSort}&bbsCategory=${bbsCategory}&searchItem=${searchItem}">${BbsVO.bbsTitle}</a><br>
					<c:set var="starAvg" value="${BbsVO.bbsStar}"></c:set>
					<div class="reviewRating">
					<c:if test="${starAvg!=0}">
                	<input type="radio" name="reviewStar" id="rating1" value="1" onclick="mark(1)" class="rate_radio" disabled>
                	<label for="rating1" id="star1" style="<c:if test="${starAvg==1||starAvg==2||starAvg==3||starAvg==4||starAvg==5}">background-color: gold;</c:if>"></label>
                	<input type="radio" name="reviewStar" id="rating2" value="2" onclick="mark(2)" class="rate_radio" disabled>
                	<label for="rating2" id="star2" style="<c:if test="${starAvg==2||starAvg==3||starAvg==4||starAvg==5}">background-color: gold;</c:if>"></label>
                	<input type="radio" name="reviewStar" id="rating3" value="3" onclick="mark(3)" class="rate_radio" disabled>
                	<label for="rating3" id="star3" style="<c:if test="${starAvg==3||starAvg==4||starAvg==5}">background-color: gold;</c:if>"></label>
                	<input type="radio" name="reviewStar" id="rating4" value="4" onclick="mark(4)" class="rate_radio" disabled>
                	<label for="rating4" id="star4" style="<c:if test="${starAvg==4||starAvg==5}">background-color: gold;</c:if>"></label>
                	<input type="radio" name="reviewStar" id="rating5" value="5" onclick="mark(5)" class="rate_radio" disabled>
                	<label for="rating5" id="star5" style="<c:if test="${starAvg==5}">background-color: gold;</c:if>"></label></c:if>
                	<span style="font-size: 12px;color:grey">(${BbsVO.bbsReviewC})</span><br>
                	<span style="font-size: 12px;color:grey">조회수 :${BbsVO.bbsHit}</span><br>
                	<span style="font-size: 12px;color:grey">(${fn:substring(BbsVO.bbsDate,2,10)}) by ${BbsVO.userNickName}</span>
            		</div>
                	</td>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
			<c:if test="${pageNumber != 1 }">
			<a 
				href="bbs?pageNumber=${pageNumber - 1}&bbsSort=${bbsSort}&bbsCategory=${bbsCategory}&searchItem=${searchItem}"
				class="bbsBtn">이전</a>
			</c:if>
			<c:if test="${fn:length(list)>max }">
			<a 
				href="bbs?pageNumber=${pageNumber + 1}&bbsSort=${bbsSort}&bbsCategory=${bbsCategory}&searchItem=${searchItem}"
				class="bbsBtn">다음</a>
			</c:if>
		</div>
	</div>
	<hr>
<jsp:include page="footer.jsp"/> 
</body>
</html>