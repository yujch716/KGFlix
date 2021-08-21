<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/login.css" />
<script src="js/jquery-3.6.0.js"></script>

<script type="text/javascript">
	function findPw() {
		var name = $('input[name=name]').val();
		var id = $('input[name=id]').val();
		var email = $('input[name=email]').val();
		if(name == ""){
			alert('이름을 입력해주세요!');
			return;
		}
		if(id == ""){
			alert('아이디를 입력해주세요!');
			return;
		}
		if(email == ""){
			alert('이메일을 입력해주세요!');
			return;
		}
		$.ajax({
			url : 'findPwAtion',
			type : 'post',
			data : {
				name : name ,
				id : id,
				email : email
			},
			success : function(data){ //ajax가 성공하면 다시 이곳으로 도착!
				if(data.result == 'fail'){
					alert('확인된 결과가 없습니다');
				}else{
					alert('찾으시는 비밀번호는 '+data.result +' 입니다');
				}
			},
			error : function(data, status, opt) {
		        alert("code:"+data, status+"\n"+"error:"+opt);
			}
		});//end of ajax
		
	}
</script>


<body>
<header>
	<jsp:include page="common/header.jsp"/>
</header>
<section>
	
	<div align=center id="title">비밀번호 찾기</div>
	<br /><br />
	<form action="" method="POST">
		<table align=center>
			<tr>
				<td id="font1">이름</td>
				<td id="pd"><input type="text" name="name" placeholder="아이디를 입력하세요" id="box"></td>
			</tr>
			<tr>
				<td id="font1">아이디</td>
				<td id="pd"><input type="text" name="id" placeholder="비밀번호를 입력하세요" id="box"></td>
			</tr>
			<tr>
				<td id="font1">이메일</td>
				<td id="pd"><input type="text" name="email" placeholder="이메일을 입력하세요" id="box"></td>
			</tr>
			<tr><td colspan=2 style="text-align: center;">
				<br />
				<button id="btn1" type="button" name="btn" onclick="findPw();">찾기</button>
			</td></tr>
			
		</table>
	</form>
</section>
<br /><br /><br /><br /><br /><br /><br />
</body>
<footer>
	<jsp:include page="common/footer.jsp" />
</footer>
