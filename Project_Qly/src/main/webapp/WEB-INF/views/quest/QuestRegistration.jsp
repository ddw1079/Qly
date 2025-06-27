<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/menubar.jsp" />
<jsp:include page="/template/coin_charge.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘스트 등록</title>

<!-- ✅ Bootstrap + FontAwesome CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
	background: linear-gradient(to right, #e8fff9, #ffe8ef);
	font-family: 'Noto Sans KR', sans-serif;
}

.container {
	width: 1080px;
	margin: 40px auto;
}

.section-title {
	font-size: 24px;
	font-weight: 600;
	color: #2e7d66;
	padding-left: 14px;
	border-left: 6px solid #2e7d66;
	margin-bottom: 30px;
	margin-top: 10px;
}

.section-label {
	font-size: 18px;
	font-weight: 600;
	color: #2e7d66;
	margin-bottom: 8px;
	display: inline-block;
	border-left: 4px solid #2e7d66;
	padding-left: 10px;
}

.icon-btn {
	background: #33c3aa;
	color: white !important;
	border: none;
	border-radius: 5px;
	font-size: 18px;
	width: 36px;
	height: 36px;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
}

.inline-row {
	display: flex;
	gap: 20px;
	margin-bottom: 26px;
}

.inline-row .title-group {
	flex: 7;
}

.inline-row .category-group {
	flex: 3;
}

.form-title-input {
	font-size: 22px;
	padding: 12px 16px;
	border: 1.5px solid #c2ece5;
	border-radius: 9px;
	background: #f4fefc;
	width: 100%;
}

.form-card {
	background: rgba(255, 255, 255, 0.8); /* 반투명 흰색으로 변경 */
	backdrop-filter: blur(6px); /* 살짝 흐림 효과로 유리 느낌 */
	border-radius: 20px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.06); /* 더 부드럽고 은은하게 */
	padding: 48px 38px;
	margin-bottom: 22px;
	display: flex;
	flex-direction: column;
	gap: 24px;
}

.flex-row {
	display: flex;
	justify-content: space-between;
	gap: 40px;
}

.left-area {
	flex: 2;
	display: flex;
	flex-direction: column;
}

.right-area {
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: flex-end;
}

.upload-box {
	width: 100%;
	max-width: 360px;
	height: 240px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #eaf6fd;
	border: 2px dashed #33c3aa;
	border-radius: 11px;
	color: #818181;
	font-size: 18px;
	font-weight: 500;
	margin-bottom: 12px;
	text-align: center;
}

.file-input-box {
	width: 100%;
	max-width: 360px;
	padding: 14px;
	background: #f8fdfc;
	border: 2px solid #c2ece5;
	border-radius: 9px;
	font-size: 15px;
	display: flex;
	align-items: center;
	gap: 12px;
}

.file-hidden {
	display: none;
}

.file-btn {
	padding: 8px 16px;
	background-color: #33c3aa;
	color: white;
	font-weight: bold;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 15px;
	transition: background 0.2s ease;
}

.file-btn:hover {
	background-color: #24a192;
}

#fileName {
	color: #444;
	font-size: 15px;
}

textarea {
	width: 100%;
	font-size: 17px;
	padding: 10px 14px;
	border-radius: 7px;
	resize: vertical;
	background: #f4fefc;
	border: 1.5px solid #c2ece5;
}

input[type="text"], input[type="number"], input[type="date"] {
	width: 100%;
	padding: 11px 14px;
	font-size: 18px;
	border: 1.5px solid #c2ece5;
	border-radius: 9px;
	background: #f4fefc;
	outline: none;
}

input:focus, textarea:focus {
	border-color: #24a192;
}

.charge-btn {
	background: #33c3aa;
	color: #fff;
	font-weight: bold;
	border: none;
	padding: 12px 28px;
	border-radius: 6px;
	cursor: pointer;
	font-size: 16px;
	white-space: nowrap;
}

.token-box {
	border: 1.5px dashed #33c3aa;
	padding: 12px 24px;
	border-radius: 8px;
	background: #f1fbf9;
	text-align: center;
	min-width: 130px;
	white-space: nowrap;
}

.token-box .coin-num {
	font-size: 18px;
	font-weight: bold;
	color: #24a192;
}

.token-flex {
	display: flex;
	align-items: center;
	gap: 16px;
	flex-wrap: nowrap;
}

.submit-btn-wide {
	width: 100%;
	background: #a2e4da;
	color: #064d44;
	border: none;
	padding: 18px 0;
	font-size: 22px;
	font-weight: bold;
	border-radius: 10px;
	cursor: pointer;
	margin-top: 40px;
	transition: background 0.25s;
}

.submit-btn-wide:hover {
	background: #85d7ca;
}

.task-item {
	display: flex;
	align-items: center;
	gap: 8px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="section-title">퀘스트 등록</h2>
		<form action="${pageContext.request.contextPath}/quest/insert.do"
			method="post" enctype="multipart/form-data">
			<div class="inline-row">
				<div class="form-group title-group">
					<label class="section-label">제목</label> <input type="text"
						name="title" class="form-title-input" placeholder="제목을 입력하세요"
						required />
				</div>
				<div class="form-group category-group">
					<label class="section-label">카테고리</label> <input type="text"
						name="category" placeholder="카테고리를 입력하세요" required />
				</div>
			</div>

			<div class="form-card">
				<div class="flex-row">
					<div class="left-area">
						<label class="section-label">의뢰내용</label>
						<div id="taskList">
							<div class="task-item">
								<input type="text" name="taskList" placeholder="의뢰 내용을 입력하세요" required />
								<button type="button" class="icon-btn" onclick="addTask()">
									<i class="fas fa-plus"></i>
								</button>
								<button type="button" class="icon-btn"
									onclick="removeTask(this)">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="right-area">
						<div class="upload-box">사진 파일을 넣어주세요</div>
						<div class="file-input-box">
							<input type="file" name="photo" id="photo" class="file-hidden"
								onchange="previewFileName(this)" required> <label for="photo"
								class="file-btn">파일 선택</label> <span id="fileName">선택된 파일
								없음</span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="section-label">추가 요청사항</label>
					<textarea name="content" placeholder="추가 요청사항을 적으세요!!!" rows="5" required></textarea>
				</div>

				<div class="form-group"
					style="display: flex; gap: 12px; align-items: center;">
					<label class="section-label">의뢰 기간</label> <input type="date"
						name="startDate" required style="width: 180px;" required/> <span>~</span>
					<input type="date" name="endDate" required style="width: 180px;" required/>
				</div>

				<div class="form-group" style="display: flex; gap: 20px;">
					<div style="flex: 1;">
						<label class="section-label">의뢰 장소</label> <input type="text"
							name="address" placeholder="구, 군, 시 입력" required/>
					</div>
					<div style="flex: 1;">
						<label class="section-label">상세 장소</label> <input type="text"
							name="location" placeholder="상세주소" required/>
					</div>
				</div>

				<div class="form-group">
					<label class="section-label">의뢰 가격 (코인)</label>
					<div class="token-flex">
						<input type="number" name="rewardTokens" placeholder="예: 100" required />
						<button type="button" class="charge-btn"
							onclick="showChargeModal()">충전</button>
						<div class="token-box">
							<p style="margin: 0;">보유 코인</p>
							<p class="coin-num">${sessionScope.loginUser.totalTokens}</p>
						</div>
					</div>
					<p id="tokenWarning"
						style="color: red; font-weight: bold; display: none;">코인이
						부족합니다.</p>
				</div>

				<button type="submit" class="submit-btn-wide">등록</button>
			</div>
		</form>
	</div>

	<script>
	function addTask() {
		const taskList = document.getElementById("taskList");
		const newTask = document.createElement("div");
		newTask.className = "task-item";
		newTask.innerHTML = `
			<input type="text" name="taskList" placeholder="의뢰 내용을 입력하세요" />
			<button type="button" class="icon-btn" onclick="addTask()"><i class="fas fa-plus"></i></button>
			<button type="button" class="icon-btn" onclick="removeTask(this)"><i class="fas fa-minus"></i></button>`;
		taskList.appendChild(newTask);
	}

	function removeTask(btn) {
		const taskList = document.getElementById("taskList");
		if (taskList.children.length > 1) {
			btn.parentElement.remove();
		} else {
			alert("최소 1개의 의뢰내용은 필요합니다.");
		}
	}

	function previewFileName(input) {
		const fileName = input.files[0]?.name || '선택된 파일 없음';
		document.getElementById("fileName").textContent = fileName;
	}

	function showChargeModal() {
		const modal = new bootstrap.Modal(document.getElementById('chargeCoinModal'));
		modal.show();
	}
	</script>
</body>
</html>
