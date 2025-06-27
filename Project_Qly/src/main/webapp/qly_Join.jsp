<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	height: 100vh;
	background: linear-gradient(135deg, #f8fefc, #d2f9f3);
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

.container-box {
	width: 720px;
	backdrop-filter: blur(20px);
	background: rgba(255, 255, 255, 0.35);
	border: 2px solid #5bd6c7;
	border-radius: 20px;
	box-shadow: 0 12px 28px rgba(0, 0, 0, 0.1);
	padding: 60px 50px;
	text-align: center;
}

.container-box img {
	width: 220px;
	margin-bottom: 30px;
}

input.form-control {
	padding-top: 16px;
	padding-bottom: 16px;
	font-size: 1.1rem;
	background-color: rgba(255, 255, 255, 0.85);
	border: 1.5px solid #5bd6c7;
	border-radius: 10px;
	color: #333;
}

input::placeholder {
	color: #aaa;
}

button.btn-submit {
	width: 100%;
	padding: 16px;
	border: none;
	border-radius: 10px;
	background: linear-gradient(to right, #5de6c7, #42c7b1);
	color: white;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
	transition: background 0.3s ease;
}

button.btn-submit:hover {
	background: linear-gradient(to right, #4bd2b5, #34b7a2);
}
</style>
<script>
$(document).ready(function () {
  window.togglePassword = function (fieldId, btn) {
    const field = $("#" + fieldId);
    const isHidden = field.attr("type") === "password";
    field.attr("type", isHidden ? "text" : "password");
    $(btn).text(isHidden ? "🙈" : "👁️");
  };

  $("#phone").on("input", function () {
    const num = $(this).val().replace(/[^0-9]/g, "");
    let formatted = num;
    if (num.length < 4) {
      formatted = num;
    } else if (num.length < 8) {
      formatted = num.slice(0, 3) + "-" + num.slice(3);
    } else if (num.length <= 11) {
      formatted = num.slice(0, 3) + "-" + num.slice(3, 7) + "-" + num.slice(7);
    } else {
      formatted = num.slice(0, 3) + "-" + num.slice(3, 7) + "-" + num.slice(7, 11);
    }
    $(this).val(formatted);
  });

  $("input#password, input#passwordCheck").on("input", function () {
    const pw = $("#password").val();
    const pwCheck = $("#passwordCheck").val();
    const isMatch = pw && pwCheck && pw === pwCheck;
    $("#pwStatus1, #pwStatus2")
      .text(isMatch ? "[\uc77c\uce58]" : "[\ube44\uc77c\uce58]")
      .removeClass("text-success text-danger")
      .addClass(isMatch ? "text-success" : "text-danger");
    if (!pw || !pwCheck) $("#pwStatus1, #pwStatus2").text("");
  });

  $("input[required]").on("input change", function () {
    const allFilled = $("input[required]").toArray().every(el => $(el).val().trim() !== "");
    $("#submitBtn").prop("disabled", !allFilled);
  });

  $("form").on("submit", function () {
    const pw = $("#password").val();
    const pwCheck = $("#passwordCheck").val();
    if (pw !== pwCheck) {
      alert("\ube44\ubc00\ubc88\ud638\uac00 \uc77c\uce58\ud558\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4.");
      return false;
    }
    return true;
  });
});

const ctx = "${pageContext.request.contextPath}";
function checkUsername() {
    const username = $("#username").val().trim();
    if (!username) {
        alert("ID\ub97c \uc785\ub825\ud558\uc138\uc694.");
        return;
    }
    $.ajax({
        url: ctx + "/login/checkUsername",
        type: "GET",
        data: { username: username },
        success: function (data) {
            if (data.available) {
                $("#usernameCheckResult").text("\uc0ac\uc6a9 \uac00\ub2a5\ud55c ID\uc785\ub2c8\ub2e4.")
                    .removeClass("text-danger").addClass("text-success");
            } else {
                $("#usernameCheckResult").text("\uc774\ubbf8 \uc0ac\uc6a9 \uc911\uc778 ID\uc785\ub2c8\ub2e4.")
                    .removeClass("text-success").addClass("text-danger");
            }
        },
        error: function () {
            alert("\uc911\ubcf5 \ud655\uc778 \uc911 \uc624\ub958\uac00 \ubc1c\uc0dd\ud588\uc2b5\ub2c8\ub2e4.");
        }
    });
}
</script>
</head>
<body>
<div class="container-box">
	<img src="https://i.postimg.cc/Dy7BstrB/logo2.png" alt="Qly 로고">
	<h2 style="color:#104b47; font-weight:700; margin-bottom:20px;">Sign in</h2>
	<form action="${pageContext.request.contextPath}/login/Qly_insert.do" method="post">
		<div class="mb-3 input-group">
			<span class="input-group-text" style="width: 100px;">ID</span>
			<input type="text" class="form-control" id="username" name="username" placeholder="ID" required>
			<button type="button" class="btn btn-outline-secondary" onclick="checkUsername()">중복확인</button>
		</div>
		<div id="usernameCheckResult" class="text-end mb-2"></div>

		<div class="mb-3 input-group">
			<span class="input-group-text" style="width: 100px;">PW</span>
			<input type="password" class="form-control" id="password" name="password" placeholder="PW" required>
			<button class="btn btn-outline-secondary" type="button" onclick="togglePassword('password', this)">👁️</button>
		</div>
		<div class="text-end mb-2" id="pwStatus1"></div>

		<div class="mb-3 input-group">
			<span class="input-group-text" style="width: 100px;">PW 확인</span>
			<input type="password" class="form-control" id="passwordCheck" name="passwordCheck" placeholder="PW 확인" required>
			<button class="btn btn-outline-secondary" type="button" onclick="togglePassword('passwordCheck', this)">👁️</button>
		</div>
		<div class="text-end mb-2" id="pwStatus2"></div>

		<div class="mb-3 input-group">
			<span class="input-group-text" style="width: 100px;">휴대전화</span>
			<input type="tel" class="form-control" id="phone" name="phone" placeholder="010-1234-5678" required>
		</div>

		<div class="mb-3 input-group">
			<span class="input-group-text" style="width: 100px;">주소</span>
			<input type="text" class="form-control" id="address" name="address" placeholder="주소" required>
		</div>

		<div class="mb-3 input-group">
			<span class="input-group-text" style="width: 100px;">이메일</span>
			<input type="email" class="form-control" id="email" name="email" placeholder="aa@ondal.com" required>
		</div>

		<div class="mb-4 text-start">
			<span class="me-2">유저 유형:</span>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="userType" id="qlee" value="의뢰인" required>
				<label class="form-check-label" for="qlee">Qly (의뢰인)</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="userType" id="qulator" value="해결사">
				<label class="form-check-label" for="qulator">Qly (해결사)</label>
			</div>
		</div>

		<button id="submitBtn" type="submit" class="btn-submit" disabled>회원가입</button>
	</form>
</div>
</body>
</html>
