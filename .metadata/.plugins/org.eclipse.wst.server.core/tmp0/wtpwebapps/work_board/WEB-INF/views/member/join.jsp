<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$(".id-msg1").hide();
	$(".id-msg2").hide(); 
	
	$("#pw").blur(function(){
		$.post("/member/pwcheck.do",
				{"pw": $('#pw').val()},
				function(result, status){
					/* alert(parseInt(result)); */
					
					if(parseInt(result) == 1){
						$(".id-msg2").show();
						$(".id-msg1").hide();
					}else{
						$(".id-msg1").show();
						$(".id-msg2").hide();
					}
				});
		});
});

	function checkForm(){
	/*	
        정규표현식 모음
		var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
 		var check_num = /^[0-9]*$/; // 숫자만 
		var check_eng = /[a-zA-Z]/; // 영문
		var check_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자 
        var check_pw  = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; // 숫자 + 영문 + 조합 8자리이상
        var check_email =  /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;      // 이메일 형식
    
    */

		form.name.value = form.name.value.trim();
        /* console.log(form.name.value); */
		if(form.name.value == "" || form.name.value.length == 0){
			alert("이름을 입력하세요");
			form.name.focus();
			return false;
		} else {
			var check_kor =  /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			if(!check_kor.test(form.name.value)){
				alert("한글만 입력할 수 있습니다.");
				form.name.value = "";
				form.name.focus();
				return false;
			} 
		}
				
 		form.birth.value = form.birth.value.trim();
		if(form.birth.value == "" || form.birth.value.length == 0){
			alert("생년월일을 입력하세요");
			form.birth.focus();
			return false;
		} else {
			var check_num = /^[0-9]*$/; // 숫자만 + 6자리
            if(!check_num.test(form.birth.value)){
                alert("숫자만 입력하셔야 됩니다.");
				form.birth.value = "";
				form.birth.focus();
				return false;
            } else {
            	var L_szNum = form.birth.value.length;
            	if(L_szNum < 6 || L_szNum > 6){
            		alert("생년월일 6자리를 입력하셔야 됩니다.");
            		form.birth.value = "";
    				form.birth.focus();
    				return false;
            	}
            }
        }
		
		form.email.value = form.email.value.trim();
		if(form.email.value == "" || form.email.value.length == 0){
			alert("이메일을 입력하세요");
			form.email.focus();
			return false;
		} else {
            // 이메일 형식
            var check_email =  /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;      
            if(!check_email.test(form.email.value)){
                alert("이메일 형식으로 사용해야 합니다");
				form.email.value = "";
				form.email.focus();
				return false;
            } 
        }
		
		form.pw.value = form.pw.value.trim();
		if(form.pw.value == "" || form.pw.value.length == 0){
			alert("비밀번호를 입력하세요");
			form.pw.focus();
			return false;
		} else {
            // 숫자 + 영문 + 조합 8자리이상
            var check_pw  = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; 
            if(!check_pw.test(form.pw.value)){
                alert("비밀번호는 숫자 + 영문 + 조합 8자리이상 사용해야 합니다");
				form.pw.value = "";
				form.pw.focus();
				return false;
            } 
        }
		
		form.pwcheck.value = form.pwcheck.value.trim();
		if(form.pwcheck.value == "" || form.pwcheck.value.length == 0){
			alert("비밀번호 확인을 위하여 다시한번 입력해주세요");
			form.pwcheck.focus();
			return false;
		} 

        if(form.pw.value != "" && form.pwcheck.value != ""){
            if(form.pw.value != form.pwcheck.value){
                alert("비밀번호가 일치하지 않습니다. 다시한번 입력해주세요.");
            } 
        }
        alert("정상적으로 입력하셨습니다. 회원가입을 위한 인증메일을 보내겠습니다.");
		return true;
	}
	
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회원가입</h2>
<form id="form" name="form" action="/member/joinRegiser.do" onsubmit="return checkForm()">
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" id="name" name="name" placeholder="이름을 입력해주세요." style="width:270px;"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" id="birth" name="birth" placeholder="생년월일을 입력해주세요." style="width:270px;"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요." style="width:270px;">
				
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요." style="width:270px;">
				<span class="id-msg1" style="color:blue; font-size:0.8rem;">사용가능한 비밀번호입니다!</span>
				<span class="id-msg2" style="color:red; font-size:0.8rem;">이미 사용중인 비밀번호입니다!</span>	
			</td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="password" id="pwcheck" name="pwcheck" placeholder="비밀번호 확인" style="width:270px;"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="가입"><input type="reset" value="취소"></td>
		</tr>
	</table>
</form>

	<script type="text/javascript">
/* 	$(document).ready(function(){
		var form = $("#form");
		
		$("#emailAuth").on("click", function(e){
			e.preventDefault();
			form.attr("action","/member/emailAuth.do");
			form.attr("method","post");
			form.submit();
		});
	}); */

	</script>

</body>
</html>