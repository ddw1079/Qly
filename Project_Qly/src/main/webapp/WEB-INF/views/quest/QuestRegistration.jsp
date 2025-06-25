<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/menubar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀘스트 등록</title>
<style>
body {
	background: #fafbfc;
	font-family: 'Noto Sans KR', sans-serif;
}

.container {
	width: 870px; /* 1.5배 */
	margin: 40px auto;
}

h2 {
	color: #d32f2f;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 26px;
	margin-left: 2px;
}

.form-title-row {
	display: flex;
	align-items: center;
	margin-bottom: 28px;
}

.form-title-label {
	font-size: 24px;
	font-weight: 600;
	margin-right: 16px;
	min-width: 58px;
	letter-spacing: -1px;
}

.form-title-input {
	flex: 1;
	font-size: 22px;
	padding: 12px 16px;
	border: 1.5px solid #b0b0b0;
	border-radius: 7px;
	background: #f7f7f7;
}

.form-card {
	background: #ededed;
	border-radius: 16px;
	box-shadow: 0 4px 16px rgba(80, 100, 140, 0.09);
	padding: 48px 38px 50px 38px;
	margin-top: 0;
	margin-bottom: 22px;
	min-height: 530px; /* 2배 */
	min-width: 0;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
}

.flex-row {
	display: flex;
	gap: 38px;
	margin-bottom: 36px;
}

.flex-col {
	flex: 1;
}

.left-area {
	flex: 1.15;
}

.right-area {
	flex: 1;
	display: flex;
	align-items: flex-start;
	justify-content: center;
	min-width: 200px;
}

#taskList input[type="text"] {
	font-size: 18px;
	padding: 11px 14px;
	border-radius: 5px;
}

#taskList {
	margin-bottom: 10px;
}

.add-btn, .delete-btn {
	background: #2c7ff6;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 7px;
	font-size: 17px;
	font-weight: bold;
	cursor: pointer;
	margin-top: 7px;
	margin-bottom: 10px;
	margin-left: 3px;
}

.add-btn:hover, .delete-btn:hover {
	background: #005bb3;
}

.upload-box {
	width: 300px;
	height: 200px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #eaf6fd;
	border: 2px dashed #a4d1f3;
	border-radius: 11px;
	color: #818181;
	font-size: 18px;
	font-weight: 500;
	flex-direction: column;
	position: relative;
	margin-top: 12px;
}

input[type="file"] {
	margin-top: 14px;
	font-size: 15px;
}

.form-group {
	margin-bottom: 22px;
	font-size: 18px;
}

.inline {
	display: flex;
	gap: 20px;
	align-items: center;
	font-size: 18px;
}

label {
	display: block;
	font-size: 18px;
	margin-bottom: 6px;
	color: #414141;
	font-weight: 500;
}

input[type="text"], input[type="number"], input[type="date"] {
	width: 97%;
	padding: 11px 14px;
	font-size: 18px;
	border: 1.5px solid #b0b0b0;
	border-radius: 7px;
	background: #f7f7f7;
	outline: none;
	margin-bottom: 7px;
	transition: border-color 0.2s;
}

input[type="text"]:focus, input[type="number"]:focus, input[type="date"]:focus
	{
	border-color: #1976d2;
}

.submit-btn {
	background: #08c762;
	color: #fff;
	border: none;
	padding: 15px 50px;
	font-size: 22px;
	font-weight: bold;
	border-radius: 11px;
	position: absolute;
	bottom: 42px;
	right: 70px;
	cursor: pointer;
	transition: background 0.18s;
}

.submit-btn:hover {
	background: #08975a;
}

.charge-btn {
	background: #33d193;
	color: #fff;
	border: none;
	padding: 9px 23px;
	border-radius: 7px;
	font-size: 16px;
	margin-left: 10px;
	font-weight: bold;
	cursor: pointer;
}

.charge-btn:hover {
	background: #158865;
}

.box-footer {
	position: relative;
	min-height: 60px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>퀘스트 등록</h2>
		<form action="${pageContext.request.contextPath}/quest/insert.do"
			method="post" enctype="multipart/form-data">
			<div class="form-title-row">
				<div class="form-title-label">제목</div>
				<input type="text" name="title" class="form-title-input"
					placeholder="제목을 입력하세요" required />
			</div>
			<div class="form-group inline">
				<label>카테고리</label> <input type="text" name="category"
					placeholder="카테고리를 입력하세요"
					style="width: 250px; font-size: 17px; padding: 9px 12px; border-radius: 6px; margin-bottom: 7px;"
					required />
			</div>
			<div class="form-card">
				<div class="flex-row">
					<div class="left-area flex-col">
						<label>의뢰내용</label>

						<div id="taskList">
							<div>
								<input type="text" name="taskList" placeholder="의뢰 내용을 입력하세요"
									style="width: 88%; font-size: 18px; padding: 10px 14px; border-radius: 5px;" />
								<button type="button" class="delete-btn add-btn"
									style="padding: 8px 14px; font-size: 15px;"
									onclick="this.parentNode.remove();">삭제</button>
							</div>
						</div>

						<button type="button" class="add-btn" onclick="addTask()">의뢰내용
							추가</button>
					</div>
					<div class="right-area flex-col">
						<div class="upload-box">
							사진 파일을 넣어주세요 <input type="file" name="photo">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="content">추가 요청사항</label>
					<textarea name="content" id="content"
						placeholder="추가 요청사항을 적으세요!!!" rows="5"
						style="width: 50%; font-size: 17px; padding: 10px 14px; border-radius: 7px; resize: vertical; background: #f7f7f7; border: 1.5px solid #b0b0b0; margin-bottom: 13px;"
						required></textarea>
				</div>
				<div class="form-group inline">
					<label>의뢰 기간</label> <input type="date" name="startDate" required
						style="width: 180px;" /> <span style="font-size: 18px;">~</span>
					<input type="date" name="endDate" required style="width: 180px;" />
				</div>
				<div class="form-group inline">
					<label>의뢰 장소</label> <input type="text" name="address"
						placeholder="구, 군, 시 입력" style="width: 250px;" /> <label>상세
						장소</label> <input type="text" name="location" placeholder="상세주소"
						style="width: 250px;" />
				</div>
				<!-- <div class="form-group inline">
					<label>의뢰 가격 (코인)</label> <input type="number" name="rewardTokens"
						min="0" placeholder="예: 100" style="width: 120px;" />
					<button type="button" class="charge-btn">충전</button>
				</div> -->
				<div class="form-group inline">
					<label>의뢰 가격 (코인)</label> <input type="number" name="rewardTokens"
						id="rewardTokens" min="0" placeholder="예: 100"
						style="width: 120px;" oninput="checkTokens()" />
					<button type="button" class="charge-btn">충전</button>

					<!-- 현재 코인 -->
					<span style="margin-left: 12px;">보유 코인: <span
						id="currentTokens">${sessionScope.loginUser.totalTokens}</span>
					</span>
				</div>

				<p id="tokenWarning"
					style="color: red; font-weight: bold; margin-top: -14px; margin-bottom: 18px; display: none;">
					코인이 부족합니다.</p>
				<div class="box-footer">
					<button type="submit" class="submit-btn">등록</button>
				</div>
			</div>
		</form>
	</div>
	<script>
		function addTask() {
			let div = document.createElement("div");
			div.innerHTML = '<input type="text" name="taskList" placeholder="의뢰 내용을 입력하세요" style="width:88%;font-size:18px;padding:10px 14px;border-radius:5px;" /> <button type="button" class="delete-btn add-btn" style="padding:8px 14px;font-size:15px;" onclick="this.parentNode.remove();">삭제</button>';
			document.getElementById("taskList").appendChild(div);
		}

		function checkTokens() {
			const rewardInput = document.getElementById("rewardTokens");
			const currentTokens = parseInt(document
					.getElementById("currentTokens").innerText);
			const warningText = document.getElementById("tokenWarning");

			if (rewardInput.value
					&& parseInt(rewardInput.value) > currentTokens) {
				warningText.style.display = 'block';
			} else {
				warningText.style.display = 'none';
			}
		}
	</script>
</body>
</html>
