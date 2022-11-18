<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강북문화정보도서관</title>
    <link rel="shortcut icon" href="${contextPath}/images/favicon.ico">
    <link rel="stylesheet" href="${contextPath}/css/normalize.css">
    <link rel="stylesheet" href="${contextPath}/css/common.css">
    <link rel="stylesheet" href="${contextPath}/css/theme.css">
    <style>
        #content {
            border: 1px solid #ccc;
            margin: 25px auto;
            padding: 20px;
        }
    </style>
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    	function readImage(input) {
    		if(input.files && input.files[0]) {
    			let reader=new FileReader();
    			reader.onload=function(event) {
    				$('#preview').attr('src',event.target.result);
    			}
    			reader.readAsDataURL(input.files[0]);
    		}
    	}
    	function toList(obj) {
    		obj.action="${contextPath}/board/listArticles.do";
    		obj.submit();
    	}
    	function fn_enable(obj) {
    		document.getElementById('id_title').disabled=false;
    		document.getElementById('id_content').disabled=false;
    		let imgName=document.getElementById('id_imageFileName');
    		if(imgName != null) {
    			imgName.disabled=false;
    			imgName.style.display="block";
    		}
    		document.getElementById('tr_button_modify').style.display="block";
    		document.getElementById('tr_btn').style.display="none";
    	}
    	function fn_modify_article(obj) {
    		obj.action="${contextPath}/board/modArticle.do";
    		obj.submit();
    	}
    	function fn_remove_article(url, articleNo) {
    		let form=document.createElement("form");
    		form.setAttribute("method", "post");
    		form.setAttribute("action", url);
    		let articleNoInput=document.createElement("input");
    		articleNoInput.setAttribute("type","hidden");
    		articleNoInput.setAttribute("name","articleNo");
    		articleNoInput.setAttribute("value",articleNo);
    		form.appendChild(articleNoInput);
    		document.body.appendChild(form);
    		form.submit();
    	}
    </script>
</head>
<body>
    <!-- 건너뛰기 링크 -->
    <div id="skipNav">
        <a href="#header">메인메뉴 바로가기</a>
        <a href="#main">본문 바로가기</a>
        <a href="#footer">하단메뉴 바로가기</a>
    </div>

    <div id="wrap">

        <!-- 헤더 영역 -->
        <header id="header">

            <!-- 구립도서관 사이트맵 -->
            <div class="lib-link">
                <h2 class="hidden">강북구 내 타 도서관 사이트로 이동</h2>
                <ul>
                    <li><a href="#">강북구립도서관</a></li>
                    <li><a href="${contextPath}/index.html">강북문화정보도서관</a></li>
                    <li><a href="#">강북청소년문화정보도서관</a></li>
                    <li><a href="#">솔샘문화정보도서관</a></li>
                    <li><a href="#">송중문화정보도서관</a></li>
                    <li><a href="#">수유문화정보도서관</a></li>
                    <li><a href="#">미아문화정보도서관</a></li>
                    <li><a href="#">삼각산어린이도서관</a></li>
                    <li><a href="#">전자책도서관</a></li>
                    <li><a href="#">새마을문고</a></li>
                </ul>
            </div>

            <div class="default-menu">
                <!-- 로고 -->
                <h1 class="logo">
                    <a href="${contextPath}/index.html">
                        <img src="${contextPath}/images/gangbuk_logo.png" alt="로고">
                    </a>
                </h1>
                <!-- 사이드 메뉴 -->
                <ul class="snb">
                    <li><a id="log_in" href="${contextPath}/login.jsp">로그인</a></li>
                    <li><a id="modInfo" href="${contextPath}/login.jsp">회원정보수정</a></li>
                    <li><a href="${contextPath}/join.jsp">회원가입</a></li>
                    <c:if test="${isLogin==true}">
                    	<script>
                    		let contextPath="<c:out value="${contextPath}"/>";
                    		$('#log_in').text("로그아웃").attr('href',contextPath+'/member/logout.do');
                    		$('#modInfo').attr('href',contextPath+'/member/modinfoForm.do');
                    	</script>
                    </c:if>
                </ul>
            </div>

            <!-- 메인 메뉴 -->
            <nav>
                <h2 class="hidden">메인 메뉴</h2>
                <ul class="mainMenu">
                    <li>
                        <a href="#">자료이용</a>
                        <ul class="subMenu">
                            <li><a href="#">통합 검색</a></li>
                            <li><a href="#">신착도서 검색</a></li>
                            <li><a href="#">간행물 검색</a></li>
                            <li><a href="#">비도서 검색</a></li>
                            <li><a href="#">인기대출도서 검색</a></li>
                            <li><a href="#">추천도서</a></li>
                            <li><a href="#">인기테마 검색</a></li>
                            <li><a href="#">스마트도서관</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">전자책 도서관</a>
                        <ul class="subMenu">
                            <li><a href="#">E-Book</a></li>
                            <li><a href="#">E-Learning</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">참여마당</a>
                        <ul class="subMenu">
                            <li><a href="${contextPath}/board/listArticles.do">공지사항</a></li>
                            <li><a href="#">행사안내</a></li>
                            <li><a href="#">자주하는 질문</a></li>
                            <li><a href="#">단순질문함</a></li>
                            <li><a href="#">고객의견함</a></li>
                            <li><a href="#">자료실</a></li>
                            <li><a href="#">설문조사</a></li>
                            <li><a href="#">자원봉사자 모집</a></li>
                            <li><a href="#">모두의 소설</a></li>
                        </ul>
                    </li>
                    <li><a href="#">강좌/문화행사</a>
                        <ul class="subMenu">
                            <li><a href="#">문화교실 안내</a></li>
                            <li><a href="#">문화교실 신청</a></li>
                            <li><a href="#">문화행사 안내</a></li>
                            <li><a href="#">문화행사 신청</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">도서관 안내</a>
                        <ul class="subMenu">
                            <li><a href="#">인사말 &amp; 연혁</a></li>
                            <li><a href="#">시설 &amp; 자료현황</a></li>
                            <li><a href="#">이용안내</a></li>
                            <li><a href="#">이용자 서비스 헌장</a></li>
                            <li><a href="#">조직도</a></li>
                            <li><a href="#">상호대차&amp;지하철 예약 대출</a></li>
                            <li><a href="#">상상공작소</a></li>
                            <li><a href="#">책이음 서비스</a></li>
                            <li><a href="#">책나래 서비스</a></li>
                            <li><a href="#">북스타트</a></li>
                            <li><a href="#">오시는 길</a></li>
                            <li><a href="#">번동 U-도서관</a></li>
                            <li><a href="#">새마을문고</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">나의 도서관</a>
                        <ul class="subMenu">
                            <li><a href="#">대출･연장･예약･조회</a></li>
                            <li><a href="#">희망도서 신청</a></li>
                            <li><a href="#">바구니 보기</a></li>
                            <li><a href="#">검색 History</a></li>
                            <li><a href="#">관심문화교실</a></li>
                            <li><a href="#">나의 참여내역</a></li>
                        </ul>
                    </li>
                </ul>
                <div id="submenuBg"></div>
            </nav>

        </header>

        <!-- 메인 영역 -->
        <div id="main">

            <div id="container">

                <!-- 사이드메뉴 -->
                <div class="snb">
                    <h2>참여마당</h2>
                    <ul>
                        <li><a href="${contextPath}/board/listArticles.do" class="selected_menu">공지사항</a></li>
                        <li><a href="#">행사안내</a></li>
                        <li><a href="#">자주하는 질문</a></li>
                        <li><a href="#">단순질문함</a></li>
                        <li><a href="#">고객의견함</a></li>
                        <li><a href="#">자료실</a></li>
                        <li><a href="#">설문조사</a></li>
                        <li><a href="#">자원봉사자 모집</a></li>
                        <li><a href="#">모두의 소설</a></li>
                    </ul>
                </div>

                <!-- 컨텐츠 영역 -->
                <div class="main-content">

                    <h2 id="title">공지사항</h2>
                    <p id="location">Home &gt; 참여마당 &gt; 공지사항</p>
                    
                    <div id="content">
                        <form action="${contextPath}" method="post" enctype="multipart/form-data">
                        	<table align="center">
                        		<input name="articleNo" type="hidden" value="${article.articleNo}">
                        		<tr>
                        			<td><input type="text" value="${article.title}" id="id_title" name="title" size="50px" disabled></td>
                        		</tr>
                        		<tr>
                        			<td><textarea name="content" rows="10" cols="42" id="id_content" disabled>${article.content}</textarea></td>
                        		</tr>
                        		<c:if test="${not empty article.imageFileName && article.imageFileName != 'null'}">
                        			<input type="hidden" name="originalFileName" value="${article.imageFileName}">
                        			<tr>
                        				<td><img width="602px" src="${contextPath}/download.do?articleNo=${article.articleNo}&imageFileName=${article.imageFileName}"><br></td>
                        			</tr>
                        			<tr>
                        				<td><input type="file" name="imageFileName" id="id_imageFileName" onchange="readImage(this)" style="display:none;"></td>
                        			</tr>
                        		</c:if>
                        		<tr id="tr_button_modify" style="display:none;" class="mod_hidden">
                        			<td colspan="2" align="center">
                        				<input type="button" value="수정 반영하기" onclick="fn_modify_article(this.form)">
                        				<input type="button" value="취소" onclick="toList(this.form)">
                        			</td>
                        		</tr>
                        		<tr id="tr_btn">
                        			<td colspan="2" align="center">
                        				<input type="button" value="수정하기" onclick="fn_enable(this.form)">
                        				<input type="button" value="삭제하기" onclick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNo})">
                        				<input type="button" value="목록보기" onclick="toList(this.form)">
                        			</td>
                        		</tr>
                        	</table>
                        </form>
                    </div>
                    
                </div>
                <!-- .main-content -->

            </div>
            <!-- #container -->

            <!-- 배너 -->
            <div id="banner">
                <div class="banner-box">
                    <div class="box">
                        <a href="https://www.nl.go.kr" target="_blank"><img src="${contextPath}/images/rnrflqwnddkd.jpg" alt="국립중앙도서관"></a>
                        <a href="https://www.nanet.go.kr/main.do"><img src="${contextPath}/images/rnrghlehtjrhks.jpg" alt="국회도서관"></a>
                        <a href="https://lib.seoul.go.kr"><img src="${contextPath}/images/tjdnfehtjrhks.jpg" alt="서울도서관"></a>
                        <a href="https://www.nl.go.kr/NL/contents/N30502000000.do"><img src="${contextPath}/images/tktjdprp.jpg" alt="사서에게 물어보세요"></a>
                        <a href="https://www.kpipa.or.kr/info/recommBookShareList.do?board_id=170"><img src="${contextPath}/images/dlekfdmlcncjs.jpg" alt="이달의 추천도서"></a>
                        <a href="https://www.kpipa.or.kr/info/recommYouthBook.do?board_id=36"><img src="${contextPath}/images/cjdthsuscncjs.jpg" alt="청소년 추천도서"></a>
                        <a href="#"><img src="${contextPath}/images/flejtm.jpg" alt="강북리더스클럽"></a>
                        <a href="#"><img src="${contextPath}/images/corqkek.jpg" alt="책바다"></a>
                        <a href="http://dream.nld.go.kr/dream/index.do"><img src="${contextPath}/images/booknarae.jpg" alt="책나래"></a>
                    </div>
                </div>
                <div class="btnBox">
                    <button type="button" class="previous">이전</button>
                    <button type="button" class="pause">멈춤</button>
                    <button type="button" class="next">다음</button>
                </div>
            </div>
            <!-- .banner -->
        </div>

        <!-- 푸터 영역 -->
        <footer id="footer">
            <div class="footerInner">
                <!-- 로고 -->
                <a href="${contextPath}/index.html"><img src="${contextPath}/images/gangbuk_bottom_logo.png" alt="강북문화정보도서관"></a>
                <!-- 주소, 연락처, 저작권, 방침 -->
                <div class="foot-info">
                    <ul>
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">이메일집단수집거부</a></li>
                        <li><a href="#">우리지역도서관</a></li>
                        <li><a href="#">영상정보처리기기운영 관리 방침</a></li>
                    </ul>
                    <div class="add">
                        <address>01151 서울특별시 강북구 오현로 145 (번동)</address>
                        <span>전화 02-944-3100</span>
                        <span>팩스 02-944-3139</span>
                        <span>사업자등록번호 : 210-83-02118(강북구청)</span>
                    </div>
                    <div class="copy">
                        COPYRIGHT 2010-2017 GANGBUK CULTURE INFORMATION LIBRARY ALL RIGHT RESERVED.
                    </div>
                </div>
                <!-- .foot-info -->
                <!-- 기타 버튼 -->
                <div class="etc">
                    <a href="#">도서관위치 SMS 전송</a>
                    <a href="${contextPath}/index.html" class="btnTop">TOP</a>
                </div>
            </div>
        </footer>
    </div>
</body>
<script src="${contextPath}/js/common2copy.js"></script>
<script src="${contextPath}/js/themecopy.js"></script>
</html>