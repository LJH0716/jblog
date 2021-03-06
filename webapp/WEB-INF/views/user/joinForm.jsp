<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="/jquery/jquery/jquery-1.12.4.js"></script>

</head>
<body>
	<div id="center-content">

		<!-- header -->
		<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
		<!-- //header-->


		<div>
			<form id="joinForm" method="post" action="${pageContext.request.contextPath}/user/join">
				<table>
					<colgroup>
						<col style="width: 100px;">
						<col style="width: 170px;">
						<col style="">
					</colgroup>
					<tr>
						<td><label for="txtId">아이디</label></td>
						<td><input id="txtId" type="text" name="id"></td>
						<td><button id="btnIdCheck" type="button">아이디체크</button></td>
						
					</tr>
					<tr>
						<td></td>
						<td id="tdMsg" colspan="2">사용할 수 있는 아이디 입니다.</td>
					</tr>
					<tr>
						<td><label for="txtPassword">패스워드</label></td>
						<td><input id="txtPassword" type="password" name="password" value=""></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="txtUserName">이름</label></td>
						<td><input id="txtUserName" type="text" name="userName" value=""></td>
						<td></td>
					</tr>
					<tr>
						<td><span>약관동의</span></td>
						<td colspan="3"><input id="chkAgree" type="checkbox" name="agree" value="y"> <label for="chkAgree">서비스 약관에 동의합니다.</label></td>
					</tr>
				</table>
				<div id="btnArea">
					<button id="btnJoin" class="btn" type="submit">회원가입</button>
				</div>
				
				
				<!-- 아이디 중복 체크 -->
				<input id="idCheck" type="hidden" value="">
			</form>

		</div>


		<!-- footer -->
		<c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import>
		<!-- //footer -->

	</div>

</body>

<script type="text/javascript">
	
	//아이디 중복 체크
	$("#btnIdCheck").on("click", function() {
		
		var id = $("#txtId").val();
		
		console.log(id);

		};

		$.ajax({
			url : "${pageContext.request.contextPath }/user/idCheck",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(id), 
			dataType : "json",
			success : function(result) {
				
				console.log(result);
				
				if(id != null) {
					if(result == "success") {
						$("#tdMsg").text("사용할 수 있는 아이디입니다.");
					
					} else {
						$("#tdMsg").text("다른 아이디로 가입해 주세요.");
					};
				}
			},
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});

	});
	
	//체크 항목들(아이디 입력,아이디 중복체크,패스워드 입력,이름 입력,약관동의 체크)
	
	
</script>




</html>