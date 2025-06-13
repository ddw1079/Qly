<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>개인정보 수정</title>

    <!-- Bootstrap & 스타일 통일 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
        }
        .container-inner {
            padding: 2rem;
        }
        .card {
            border-radius: 0.75rem;
            box-shadow: 0 0 8px rgba(0,0,0,0.05);
        }
        h2 {
            font-weight: 600;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        label {
            font-weight: 500;
        }
        .btn-group {
            text-align: center;
            margin-top: 1.5rem;
        }
        button {
            padding: 10px 28px;
            border: none;
            border-radius: 4px;
            background: #1976d2;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        button.cancel {
            background: #888;
            margin-left: 10px;
        }
        button:hover {
            background: #1565c0;
        }
        button.cancel:hover {
            background: #555;
        }
    </style>
</head>
<body>

<div class="container-inner">
    <h2>개인정보 수정</h2>
    <div class="card">
        <div class="card-body">
            <form method="post" action="/mypage/updatePersonalInfo">
                <div class="mb-3 row">
                    <label for="username" class="col-sm-3 col-form-label">이름</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="email" class="col-sm-3 col-form-label">이메일</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="phone" class="col-sm-3 col-form-label">전화번호</label>
                    <div class="col-sm-9">
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="010-1234-5678"
                               pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="password" class="col-sm-3 col-form-label">새 비밀번호</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password" name="password" autocomplete="new-password">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="confirm_password" class="col-sm-3 col-form-label">비밀번호 확인</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="confirm_password" name="confirm_password" autocomplete="new-password">
                    </div>
                </div>

                <div class="btn-group">
                    <button type="submit">저장</button>
                    <button type="button" class="cancel" onclick="window.history.back();">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
