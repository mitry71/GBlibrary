<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 체크</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function fn_idCheck() {
		let _id=$('#chk_id').val();
		if(_id == '') {
			alert("ID를 입력하세요.");
			return;
		}
		if(_id.length < 4 || _id.length > 10) {
			alert("아이디에는 4~10자리의 영문과 숫자만 입력하세요.");
			return;
		}
		$.ajax({
			type:"post",
			async:"true",
			dataType:"text",
			url:"${contextPath}/member/idCheck.do",
			data:{id:_id},
			success: function (data, textStatus) {
				if(data == 'usable') {
					$('#resultMsg').html("<p>사용할 수 있는 ID입니다.</p>");
					$('#btn_duplicate').prop('disabled', true);
				}else {
					$('#resultMsg').html("<p>사용할 수 없는 ID입니다.</p>");
				}
			},
			error: function (data, textStatus) {
				alert("에러가 발생했습니다.");
			}
		});
	}
</script>
</head>
<body>
	<input type="text" id="chk_id" placeholder="4~10자리의 영문과 숫자">
	<input type="button" id="btn_duplicate" value="ID 중복 체크" onclick="fn_idCheck()">
	<div id="resultMsg"></div>
</body>
</html>