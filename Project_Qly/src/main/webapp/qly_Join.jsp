<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
body {
	margin: 0;
	background-color: #f0f0f0;
	display: flex;
	justify-content: center;
	align-items: start; /* 세로 정렬을 위에서부터 */
	padding-top: 60px; /* 위 여백 줌 */
	padding-bottom: 60px;
	min-height: 100vh; /* 최소 높이만 줌 */
}

.container-box {
	width: 700px;
	background-color: #EDF4FB;
	padding: 80px;
	border-radius: 12px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	border: 3px solid #333333;
}

input.form-control {
	padding-top: 18px;
	padding-bottom: 18px;
	font-size: 1.1rem;
}
</style>
<script>
$(document).ready(function () {
  // 1. 비밀번호 토글 👁️
  window.togglePassword = function (fieldId, btn) {
    const field = $("#" + fieldId);
    const isHidden = field.attr("type") === "password";
    field.attr("type", isHidden ? "text" : "password");
    $(btn).text(isHidden ? "🙈" : "👁️");
  };

  // 2. 하이픈 자동 입력
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

  // 3. 비밀번호 일치 여부
  $("input#password, input#passwordCheck").on("input", function () {
    const pw = $("#password").val();
    const pwCheck = $("#passwordCheck").val();
    const isMatch = pw && pwCheck && pw === pwCheck;
    $("#pwStatus1, #pwStatus2")
      .text(isMatch ? "[일치]" : "[불일치]")
      .removeClass("text-success text-danger")
      .addClass(isMatch ? "text-success" : "text-danger");
    if (!pw || !pwCheck) $("#pwStatus1, #pwStatus2").text("");
  });

  // 4. 모든 필드 입력 시 버튼 활성화
  $("input[required]").on("input change", function () {
    const allFilled = $("input[required]").toArray().every(el => $(el).val().trim() !== "");
    $("#submitBtn").prop("disabled", !allFilled);
  });

 

  // 5. 폼 제출 시 최종 비밀번호 체크
  $("form").on("submit", function () {
    const pw = $("#password").val();
    const pwCheck = $("#passwordCheck").val();
    if (pw !== pwCheck) {
      alert("비밀번호가 일치하지 않습니다.");
      return false;
    }
    return true;
  });
});

const ctx = "${pageContext.request.contextPath}";

function checkUsername() {
    const username = $("#username").val().trim();
    if (!username) {
        alert("ID를 입력하세요.");
        return;
    }

    $.ajax({
        url: ctx + "/login/checkUsername",
        type: "GET",
        data: { username: username },
        success: function (data) {
            // data는 { available: true } 또는 { available: false } 형태임
            if (data.available) {
                $("#usernameCheckResult").text("사용 가능한 ID입니다.")
                    .removeClass("text-danger").addClass("text-success");
            } else {
                $("#usernameCheckResult").text("이미 사용 중인 ID입니다.")
                    .removeClass("text-success").addClass("text-danger");
            }
        },
        error: function () {
            alert("중복 확인 중 오류가 발생했습니다.");
        }
    });
}

</script>

</head>
<body>

	<div class="container-box">
		<div class="text-center mb-4">
			<img src="https://i.postimg.cc/Dy7BstrB/logo2.png" alt="Qly 로고"
				width="400">


		</div>

		<form action="${pageContext.request.contextPath}/login/Qly_insert.do"
			method="post">
			<!-- <div class="mb-3 input-group">
        <span class="input-group-text" style="width: 100px;">ID</span>
        <input type="text" class="form-control" id="userId" name="userId" placeholder="ID" required>
        <button type="button" class="btn btn-outline-secondary" onclick="checkIdDuplicate()">중복확인</button>
    </div> -->

			<div class="mb-3 input-group">
				<span class="input-group-text" style="width: 100px;">ID</span> <input
					type="text" class="form-control" id="username" name="username"
					placeholder="ID" required>
				<button type="button" class="btn btn-outline-secondary"
					onclick="checkUsername()">중복확인</button>
			</div>
			<div id="usernameCheckResult" class="text-end mb-2"></div>

			<!-- 비밀번호 -->
			<div class="mb-3 input-group">
				<span class="input-group-text" style="width: 100px;">PW</span> <input
					type="password" class="form-control" id="password" name="password"
					placeholder="PW" required>
				<button class="btn btn-outline-secondary" type="button"
					onclick="togglePassword('password', this)">👁️</button>
			</div>
			<div class="text-end mb-2" id="pwStatus1"></div>

			<!-- 비밀번호 확인 -->
			<div class="mb-3 input-group">
				<span class="input-group-text" style="width: 100px;">PW 확인</span> <input
					type="password" class="form-control" id="passwordCheck"
					name="passwordCheck" placeholder="PW 확인" required>
				<button class="btn btn-outline-secondary" type="button"
					onclick="togglePassword('passwordCheck', this)">👁️</button>
			</div>
			<div class="text-end mb-2" id="pwStatus2"></div>


			<div class="mb-3 input-group">
				<span class="input-group-text" style="width: 100px;">휴대전화</span> <input
					type="tel" class="form-control" id="phone" name="phone"
					placeholder="010-1234-5678" required>
			</div>

			<div class="mb-3 input-group">
				<span class="input-group-text" style="width: 100px;">주소</span> <input
					type="text" class="form-control" id="address" name="address"
					placeholder="주소" required>
			</div>

			<div class="mb-3 input-group">
				<span class="input-group-text" style="width: 100px;">이메일</span> <input
					type="email" class="form-control" id="email" name="email"
					placeholder="aa@ondal.com" required>
			</div>

			<div class="mb-4">
				<span class="me-2">유저 유형:</span>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="userType"
						id="qlee" value="의뢰인" required> <label
						class="form-check-label" for="qlee">Qly (의뢰인)</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="userType"
						id="qulator" value="해결사"> <label class="form-check-label"
						for="qulator">Qly (해결사)</label>
				</div>
			
			</div>

			<button id="submitBtn" type="submit" class="btn w-100" disabled
				style="background-color: #00FA9A; color: black; font-weight: bold; border: none; font-size: 1.3rem; padding: 18px; border-radius: 10px;">
				회원가입</button>

		</form>


	</div>

	<!-- ✅ 모달: ID 사용 가능 -->
	<div class="modal fade" id="idAvailableModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header bg-success text-white">
					<h5 class="modal-title">ID 확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="닫기"></button>
				</div>
				<div class="modal-body">사용 가능한 ID입니다!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
