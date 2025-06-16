<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
    
body {
    margin: 0;
    background-color: #f0f0f0;
    display: flex;
    justify-content: center;
    align-items: start; /* 세로 정렬을 위에서부터 */
    padding-top: 60px;  /* 위 여백 줌 */
    padding-bottom: 60px;
    min-height: 100vh;  /* 최소 높이만 줌 */
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
        function checkPasswordMatch() {
            const pw = document.getElementById("password").value;
            const pwCheck = document.getElementById("passwordCheck").value;
            const status1 = document.getElementById("pwStatus1");
            const status2 = document.getElementById("pwStatus2");

            if (pw && pwCheck) {
                if (pw === pwCheck) {
                    status1.innerHTML = "[일치]";
                    status2.innerHTML = "[일치]";
                    status1.className = "text-success";
                    status2.className = "text-success";
                } else {
                    status1.innerHTML = "[불일치]";
                    status2.innerHTML = "[불일치]";
                    status1.className = "text-danger";
                    status2.className = "text-danger";
                }
            } else {
                status1.innerHTML = "";
                status2.innerHTML = "";
            }
        }

        function checkIdDuplicate() {
            const userId = $("#userId").val();
            if (!userId) {
                alert("ID를 입력하세요.");
                return;
            }

            $.ajax({
                url: "checkDuplicate.jsp",  // 이 JSP에서 DB 조회 처리
                method: "POST",
                data: { userId: userId },
                success: function(response) {
                    if (response.trim() === "duplicate") {
                        alert("이미 사용 중인 ID입니다.");
                    } else if (response.trim() === "ok") {
                        $("#idAvailableModal").modal("show");
                    } else {
                        alert("오류 발생");
                    }
                },
                error: function() {
                    alert("서버 오류");
                }
            });
        }

        function validateForm() {
            const pw = document.getElementById("password").value;
            const pwCheck = document.getElementById("passwordCheck").value;
            if (pw !== pwCheck) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<div class="container-box">
    <div class="text-center mb-4">
        <img src="https://i.postimg.cc/Dy7BstrB/logo2.png" alt="Qly 로고" width="400">

        
    </div>

    <form action="Qly_registerAction.jsp" method="post" onsubmit="return validateForm();">
        <div class="mb-3">
            <label for="userId" class="form-label"></label>
            <div class="input-group">
                <input type="text" class="form-control" id="userId" name="userId" placeholder="ID" required>
                <button type="button" class="btn btn-outline-secondary" onclick="checkIdDuplicate()">중복확인</button>
            </div>
        </div>
        
        

        <div class="mb-3">
            <label for="password" class="form-label"></label>
            <input type="password" class="form-control" id="password" name="password" placeholder="PW"required oninput="checkPasswordMatch();">
            <div class="text-end" id="pwStatus1"></div>
        </div>
        
   

        <div class="mb-3">
            <label for="passwordCheck" class="form-label"></label>
            <input type="password" class="form-control" id="passwordCheck" placeholder="PW(확인)"required oninput="checkPasswordMatch();">
            <div class="text-end" id="pwStatus2"></div>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label"></label>
            <input type="email" class="form-control" id="email" name="email" placeholder="aa@ondal.com"required>
        </div>

        <div class="mb-3">
            <label class="form-label">유저 유형</label><br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="userType" id="qlee" value="Qlee" required>
                <label class="form-check-label" for="qlee">Qly (의뢰인)</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="userType" id="qulator" value="Qulator">
                <label class="form-check-label" for="qulator">Qly (해결사)</label>
            </div>
        </div>

<button type="submit" class="btn w-100"
    style="background-color: #00FA9A; color: black; font-weight: bold; border: none;
           font-size: 1.3rem; padding: 18px; border-radius: 10px;">
    회원가입
</button>


    </form>
</div>

<!-- ✅ 모달: ID 사용 가능 -->
<div class="modal fade" id="idAvailableModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-success text-white">
        <h5 class="modal-title">ID 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
      </div>
      <div class="modal-body">
        사용 가능한 ID입니다!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>
