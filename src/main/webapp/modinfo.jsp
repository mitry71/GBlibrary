<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="hp" value="${memFindInfo.hp}"/>
<c:set var="id" value="${memFindInfo.id}"/>
<%
	String hp=(String)pageContext.getAttribute("hp");
	String[] phoneNumber=hp.split("-");
%>
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
    <link rel="stylesheet" href="css/join.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    	let contextPath="<c:out value="${contextPath}" />";
    	/* let _id="<c:out value="${id}" />"; */
    	function fn_sendMember() {
    		let modForm=document.modForm;
    		let pwd=joinForm.pass.value;
    		let pwdCheck=joinForm.confirmPassword.value;
    		//비밀번호 자릿수 체크
    		if(pwd.length < 4 || pwd.length > 10) {
    			alert("비밀번호에는 4~10자리의 영문과 숫자만 입력해주세요");
    		}
    		//비밀번호 동일 여부 확인
    		else if(pwd != pwdCheck) {
    			alert("비밀번호가 동일하지 않습니다.");
    		}else {
    			modForm.method="post";
    			modForm.action=contextPath+"/member/modMember.do";
    			modForm.submit();
    		}
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
                        <img src="images/gangbuk_logo.png" alt="">
                    </a>
                </h1>
                <!-- 사이드 메뉴 -->
                <ul class="snb">
                    <li><a href="login.jsp" id="log_in">로그인</a></li>
                    <c:if test="${isLogin==true}">
                    	<script>
                    		$('#log_in').text("로그아웃").attr('href',contextPath+'/member/logout.do');
                    	</script>
                    </c:if>
                    <li><a href="modinfo.jsp">회원정보수정</a></li>
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
                            <li><a href="theme.html">인기테마 검색</a></li>
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
                    <h2>회원정보</h2>
                    <ul>
                        <li><a href="modinfo.jsp" class="selected_menu">회원정보수정</a></li>
                        <li><a href="#">회원탈퇴</a></li>
                    </ul>
                </div>

                <!-- 컨텐츠 영역 -->
                <div class="main-content">

                    <h2>회원정보 수정</h2>
                    <p id="location">Home &gt; 회원정보 &gt; 회원정보수정</p>
                    <p id="formSign"><strong class="require">필수</strong>는 반드시 입력해야 합니다.</p>

                    <form id="joinForm" name="modForm">
                        <fieldset>
                            <legend>회원정보 수정 폼</legend>
                            <div>
                                <label for="name">성명<strong class="require">필수</strong></label>
                                <input type="text" id="name" name="name" required value="${memFindInfo.name}" maxlength="30">
                            </div>
                            <div>
                                <label for="id">아이디<strong class="require">필수</strong></label>
                                <input type="hidden" name="_id"	value="${memFindInfo.id}">
                                <input type="text" name="id" id="id" required value="${memFindInfo.id}" disabled maxlength="10">
                            </div>
                            <div>
                                <label for="pass">비밀번호<strong class="require">필수</strong></label>
                                <input type="password" name="pass" id="pass" required value="${memFindInfo.pwd}" maxlength="10">
                            </div>
                            <div>
                                <label for="confirmPassword">비밀번호 확인<strong class="require">필수</strong></label>
                                <input type="password" name="confirmPassword" id="confirmPassword" value="${memFindInfo.pwd}" required maxlength="10">
                            </div>
                            <div>
                                <div class="labelAddress">
                                    <label for="address" class="labelAddress"><span>주소</span></label>
                                </div>
                                <div class="divAddress">
                                    <div>
                                        <input type="text" name="zipcode" id="zipcode" title="우편번호" maxlength="5" size="6">
                                        <a href="#" class="findZipcode">우편번호 찾기</a>
                                    </div>
                                    <input type="text" name="address" id="address" title="주소" maxlength="100" size="60" placeholder="입력 예) 서울시 강북구 오현로 145 (번동)">
                                </div>
                            </div>
                            <div>
                                <label for="phoneNumber1">전화번호<strong class="require">필수</strong></label>
                                <input type="text" name="phoneNumber1" id="phoneNumber1" value="<%=phoneNumber[0] %>" maxlength="4" size="4" required>-<input type="text" name="phoneNumber2" id="phoneNumber2" value="<%=phoneNumber[1] %>" maxlength="4" size="4" required>-<input type="text" name="phoneNumber3" id="phoneNumber3" value="<%=phoneNumber[2] %>" maxlength="4" size="4" required>
                            </div>
                            <c:choose>
								<c:when test="${memFindInfo.email != null }">
									<c:set var="email" value="${memFindInfo.email}"/>
									<%
										String emails=(String)pageContext.getAttribute("email");
										String[] email=emails.split("@");
									%>
									<div>
		                                <label for="email1">이메일</label>
		                                <input type="text" name="email1" id="email1" value="<%=email[0]%>">&nbsp;@&nbsp;<input type="text" name="email2" id="email2" value="<%=email[1] %>">
		                            </div>
								</c:when>
								<c:otherwise>
									<div>
		                                <label for="email1">이메일</label>
		                                <input type="text" name="email1" id="email1">&nbsp;@&nbsp;<input type="text" name="email2" id="email2">
		                            </div>
								</c:otherwise>
							</c:choose>
                            
                            <div class="personal">
                                <div class="personalInfoTime">
                                    <label class="personalInfoTime">개인정보 유효기간<strong class="require">필수</strong></label>
                                </div>
                                <c:choose>
                                	<c:when test="${memFindInfo.expire == '1'}">
                                		<div class="radio">
		                                    <input type="radio" name="time" value="1" id="1_year" checked><label for="1_year" class="radio">1년</label> 
		                                    <input type="radio" name="time" value="3" id="3_year"><label for="3_year" class="radio">3년</label>
		                                    <input type="radio" name="time" value="5" id="5_year"><label for="5_year" class="radio">5년</label>
		                                    <input type="radio" name="time" value="untilDeactivate" id="untilDeactivate"><label for="untilDeactivate" class="radio">탈퇴 시까지</label>
		                                    <p>설정된 개인정보 유효기간 동안 로그인 등 이용이 없으면 휴면계정이 되어 개인정보가 별도 분리 보관, 각종 뉴스레터, 메일, 문자를 수신할 수 없습니다.</p>
	                                	</div>
                                	</c:when>
                                	<c:when test="${memFindInfo.expire == '3'}">
                                		<div class="radio">
		                                    <input type="radio" name="time" value="1" id="1_year"><label for="1_year" class="radio">1년</label> 
		                                    <input type="radio" name="time" value="3" id="3_year" checked><label for="3_year" class="radio">3년</label>
		                                    <input type="radio" name="time" value="5" id="5_year"><label for="5_year" class="radio">5년</label>
		                                    <input type="radio" name="time" value="untilDeactivate" id="untilDeactivate"><label for="untilDeactivate" class="radio">탈퇴 시까지</label>
	                                    	<p>설정된 개인정보 유효기간 동안 로그인 등 이용이 없으면 휴면계정이 되어 개인정보가 별도 분리 보관, 각종 뉴스레터, 메일, 문자를 수신할 수 없습니다.</p>
	                                	</div>
                                	</c:when>
                                	<c:when test="${memFindInfo.expire == '5'}">
                                		<div class="radio">
		                                    <input type="radio" name="time" value="1" id="1_year"><label for="1_year" class="radio">1년</label> 
		                                    <input type="radio" name="time" value="3" id="3_year"><label for="3_year" class="radio">3년</label>
		                                    <input type="radio" name="time" value="5" id="5_year" checked><label for="5_year" class="radio">5년</label>
		                                    <input type="radio" name="time" value="untilDeactivate" id="untilDeactivate"><label for="untilDeactivate" class="radio">탈퇴 시까지</label>
	                                   		<p>설정된 개인정보 유효기간 동안 로그인 등 이용이 없으면 휴면계정이 되어 개인정보가 별도 분리 보관, 각종 뉴스레터, 메일, 문자를 수신할 수 없습니다.</p>
	                                	</div>
                                	</c:when>
                                	<c:when test="${memFindInfo.expire == 'untilDeactivate'}">
                                		<div class="radio">
		                                    <input type="radio" name="time" value="1" id="1_year"><label for="1_year" class="radio">1년</label> 
		                                    <input type="radio" name="time" value="3" id="3_year"><label for="3_year" class="radio">3년</label>
		                                    <input type="radio" name="time" value="5" id="5_year"><label for="5_year" class="radio">5년</label>
		                                    <input type="radio" name="time" value="untilDeactivate" id="untilDeactivate" checked><label for="untilDeactivate" class="radio">탈퇴 시까지</label>
	                                   		<p>설정된 개인정보 유효기간 동안 로그인 등 이용이 없으면 휴면계정이 되어 개인정보가 별도 분리 보관, 각종 뉴스레터, 메일, 문자를 수신할 수 없습니다.</p>
	                                	</div>
                                	</c:when>
                                </c:choose>
                            </div>
                            <div class="btnArea">
                                <input type="submit" class="btnJoin" value="수정" onclick="fn_sendMember()"></input>
                                <input type="reset" class="btnCancel" value="취소"></input>
                            </div>
                        </fieldset>
                    </form>

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
</html>