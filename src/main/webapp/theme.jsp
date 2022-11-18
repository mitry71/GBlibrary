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
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/theme.css">
    <script src="js/jquery-3.6.0.min.js"></script>
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
                    <li><a href="index.html">강북문화정보도서관</a></li>
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
                    <a href="index.html">
                        <img src="images/gangbuk_logo.png" alt="로고">
                    </a>
                </h1>
                <!-- 사이드 메뉴 -->
                <ul class="snb">
                    <li><a href="login.jsp" id="log_in">로그인</a></li>
                    <li><a href="login.jsp">회원정보수정</a></li>
                    <c:if test="${isLogin==true}">
                    	<script>
                    		let contextPath="<c:out value="${contextPath}"/>";
                    		$('#log_in').text("로그아웃").attr('href',contextPath+'/member/logout.do');
                    		$('#modInfo').attr('href',contextPath+'/member/modinfoForm.do');
                    	</script>
	                </c:if>
                    <li><a href="join.jsp">회원가입</a></li>
                    <li>
                        <span>글자크기</span>
                        <a href="#" id="largerFont">글자크기 크게</a>
                        <a href="#" id="smallerFont">글자크기 작게</a>
                    </li>
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
                    <h2>소장자료 검색</h2>
                    <ul>
                        <li><a href="#">통합 검색</a></li>
                        <li><a href="#">신착도서 검색</a></li>
                        <li><a href="#">간행물 검색</a></li>
                        <li><a href="#">비도서 검색</a></li>
                        <li><a href="#">인기대출도서 검색</a></li>
                        <li><a href="#">추천도서</a></li>
                        <li><a href="theme.jsp" class="selected_menu">인기테마검색</a></li>
                        <li><a href="#">스마트도서관</a></li>
                    </ul>
                </div>

                <!-- 컨텐츠 영역 -->
                <div class="main-content">

                    <h2 id="title">인기테마검색</h2>
                    <p id="location">Home &gt; 소장자료검색 &gt; 인기테마검색</p>
                    
                    <h4>자료검색</h4>
                    <div id="theme-search">
                        <form id="search" action="search.jsp" method="post">

                            <div class="flex-row">
                                <div class="flex-row flex-row-left">
                                    <strong>대출기간</strong>
                                </div>
                                <div class="flex-row flex-row-right">
                                    <div class="radio">
                                        <label for="selDate1">
                                            <div>
                                                <input type="radio" id="selDate1" name="selDate">
                                            </div>
                                            <span>금년</span>
                                        </label>
                                        <label for="selDate2">
                                            <div>
                                                <input type="radio" id="selDate2" name="selDate">
                                            </div>
                                            <span>금월</span>
                                        </label>
                                        <label for="selDate3">
                                            <div>
                                                <input type="radio" id="selDate3" name="selDate">
                                            </div>
                                            <span>금주</span>
                                        </label>
                                        <label for="selDate4">
                                            <div>
                                                <input type="radio" id="selDate4" name="selDate">
                                            </div>
                                            <span>기간설정</span>
                                        </label>
                                    </div>
                                    <div class="calendar">
                                        <input type="date" id="startDate" name="startDate">
                                        <input type="date" id="lastDate" name="lastDate">
                                    </div>
                                </div>
                            </div>

                            <div class="flex-row">
                                <div class="flex-row flex-row-left">
                                    <strong>성별</strong>
                                </div>
                                <div class="flex-row flex-row-right radio">
                                    <label for="gender1">
                                        <div>
                                            <input type="checkbox" id="gender1" name="gender">
                                        </div>
                                        <span>전체</span>
                                    </label>
                                    <label for="gender2">
                                        <div>
                                            <input type="checkbox" id="gender2" name="gender">
                                        </div>
                                        <span>남성</span>
                                    </label>
                                    <label for="gender3">
                                        <div>
                                            <input type="checkbox" id="gender3" name="gender">
                                        </div>
                                        <span>여성</span>
                                    </label>
                                    <label for="gender4">
                                        <div>
                                            <input type="checkbox" id="gender4" name="gender">
                                        </div>
                                        <span>미상</span>
                                    </label>
                                </div>
                            </div>

                            <div class="flex-row">
                                <div class="flex-row flex-row-left">
                                    <strong>연령</strong>
                                </div>
                                <div class="flex-row flex-row-right age">
                                    <label for="infants">
                                        <div>
                                            <input type="checkbox" id="infants" name="infants">
                                        </div>
                                        <span>영유아</span>
                                    </label>
                                    <label for="elementary">
                                        <div>
                                            <input type="checkbox" id="elementary" name="elementary">
                                        </div>
                                        <span>초등학생</span>
                                    </label>
                                    <label for="teenager">
                                        <div>
                                            <input type="checkbox" id="teenager" name="teenager">
                                        </div>
                                        <span>청소년</span>
                                    </label>
                                    <label for="twenties">
                                        <div>
                                            <input type="checkbox" id="twenties" name="twenties">
                                        </div>
                                        <span>20대</span>
                                    </label>
                                    <label for="thirties">
                                        <div>
                                            <input type="checkbox" id="thirties" name="thirties">
                                        </div>
                                        <span>30대</span>
                                    </label>
                                    <label for="forties">
                                        <div>
                                            <input type="checkbox" id="forties" name="forties">
                                        </div>
                                        <span>40대</span>
                                    </label>
                                    <label for="fifties">
                                        <div>
                                            <input type="checkbox" id="fifties" name="fifties">
                                        </div>
                                        <span>50대</span>
                                    </label>
                                    <label for="sixties">
                                        <div>
                                            <input type="checkbox" id="sixties" name="sixties">
                                        </div>
                                        <span>60대</span>
                                    </label>
                                    <label for="all">
                                        <div>
                                            <input type="checkbox" id="all" name="all">
                                        </div>
                                        <span>전체</span>
                                    </label>
                                    <label for="unknown">
                                        <div>
                                            <input type="checkbox" id="unknown" name="unknown">
                                        </div>
                                        <span>미상</span>
                                    </label>
                                </div>
                            </div>

                            <div class="flex-row">
                                <div class="flex-row flex-row-left">
                                    <strong>대주제</strong>
                                </div>
                                <div class="flex-row flex-row-right subject">
                                    <label for="kdc_A">
                                        <div>
                                            <input type="checkbox" id="kdc_A" name="kdc_A">
                                        </div>
                                        <span>전체</span>
                                    </label>
                                    <label for="kdc_0">
                                        <div>
                                            <input type="checkbox" id="kdc_0" name="kdc_0">
                                        </div>
                                        <span>총류</span>
                                    </label>
                                    <label for="kdc_1">
                                        <div>
                                            <input type="checkbox" id="kdc_1" name="kdc_1">
                                        </div>
                                        <span>철학</span>
                                    </label>
                                    <label for="kdc_2">
                                        <div>
                                            <input type="checkbox" id="kdc_2" name="kdc_2">
                                        </div>
                                        <span>종교</span>
                                    </label>
                                    <label for="kdc_3">
                                        <div>
                                            <input type="checkbox" id="kdc_3" name="kdc_3">
                                        </div>
                                        <span>사회과학</span>
                                    </label>
                                    <label for="kdc_4">
                                        <div>
                                            <input type="checkbox" id="kdc_4" name="kdc_4">
                                        </div>
                                        <span>자연과학</span>
                                    </label>
                                    <label for="kdc_5">
                                        <div>
                                            <input type="checkbox" id="kdc_5" name="kdc_5">
                                        </div>
                                        <span>기술과학</span>
                                    </label>
                                    <label for="kdc_6">
                                        <div>
                                            <input type="checkbox" id="kdc_6" name="kdc_6">
                                        </div>
                                        <span>예술</span>
                                    </label>
                                    <label for="kdc_7">
                                        <div>
                                            <input type="checkbox" id="kdc_7" name="kdc_7">
                                        </div>
                                        <span>언어</span>
                                    </label>
                                    <label for="kdc_8">
                                        <div>
                                            <input type="checkbox" id="kdc_8" name="kdc_8">
                                        </div>
                                        <span>문학</span>
                                    </label>
                                    <label for="kdc_9">
                                        <div>
                                            <input type="checkbox" id="kdc_9" name="kdc_9">
                                        </div>
                                        <span>역사</span>
                                    </label>
                                </div>
                            </div>

                            <div class="btnArea">
                                <strong>출력건수</strong>
                                <select name="pageSize" id="pageSize">
                                    <option value="10">10</option>
                                    <option value="50">50</option>
                                </select>
                                <button type="submit" class="btnSearch">검색</button>
                            </div>
                        </form>
                    </div>

                    <div id="search-result">

                    </div>

                </div>
                <!-- .main-content -->

            </div>
            <!-- #container -->

            <!-- 배너 -->
            <div id="banner">
                <div class="banner-box">
                    <div class="box">
                        <a href="https://www.nl.go.kr" target="_blank"><img src="images/rnrflqwnddkd.jpg" alt="국립중앙도서관"></a>
                        <a href="https://www.nanet.go.kr/main.do"><img src="images/rnrghlehtjrhks.jpg" alt="국회도서관"></a>
                        <a href="https://lib.seoul.go.kr"><img src="images/tjdnfehtjrhks.jpg" alt="서울도서관"></a>
                        <a href="https://www.nl.go.kr/NL/contents/N30502000000.do"><img src="images/tktjdprp.jpg" alt="사서에게 물어보세요"></a>
                        <a href="https://www.kpipa.or.kr/info/recommBookShareList.do?board_id=170"><img src="images/dlekfdmlcncjs.jpg" alt="이달의 추천도서"></a>
                        <a href="https://www.kpipa.or.kr/info/recommYouthBook.do?board_id=36"><img src="images/cjdthsuscncjs.jpg" alt="청소년 추천도서"></a>
                        <a href="#"><img src="images/flejtm.jpg" alt="강북리더스클럽"></a>
                        <a href="#"><img src="images/corqkek.jpg" alt="책바다"></a>
                        <a href="http://dream.nld.go.kr/dream/index.do"><img src="images/booknarae.jpg" alt="책나래"></a>
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
                <a href="index.html"><img src="images/gangbuk_bottom_logo.png" alt="강북문화정보도서관"></a>
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
                    <a href="index.html" class="btnTop">TOP</a>
                </div>
            </div>
        </footer>
    </div>
</body>
<script src="js/common2copy.js"></script>
<script src="js/themecopy.js"></script>
</html>