<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>

</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">개인 정보 조회</h2>
        <div class="card">
            <div class="card-body">
                <form>
                    <div class="mb-3 row">
                        <label for="userName" class="col-sm-2 col-form-label">이름</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" id="userName" value="홍길동">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="userEmail" class="col-sm-2 col-form-label">이메일</label>
                        <div class="col-sm-10">
                            <input type="email" readonly class="form-control-plaintext" id="userEmail" value="honggildong@example.com">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="userPhone" class="col-sm-2 col-form-label">전화번호</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" id="userPhone" value="010-1234-5678">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="userAddress" class="col-sm-2 col-form-label">주소</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" id="userAddress" value="서울특별시 강남구 테헤란로 123">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
