<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>
<style>
body {
	font-family: 'Segoe UI', sans-serif;
	margin: 40px;
}

.request::placeholder {
	color: rgba(0, 0, 0, 0.3);
}

label {
	font-weight: bold;
	font-size: 16px;
}

.style {
	width: 100%;
	height: 40px;
	text-align: center;
	font-size: 16px;
}

/* .can 제거하고 대신 아래처럼 스타일 변경 */
.can {
	background-color: silver;
	padding: 20px;
	border-radius: 8px;
}

.request-item {
	display: flex;
	gap: 10px;
	margin-bottom: 8px;
}

.request-item input {
	flex: 1;
}

.image-upload {
	background-color: #f8f9fa;
	border: 2px dashed #6c757d;
	height: 500px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 8px;
	flex-direction: column;
}

.image-upload input[type="file"] {
	cursor: pointer;
}

.image-upload p {
	color: #6c757d;
	font-size: 16px;
	margin-top: 10px;
}
</style>
</head>
<body>

	<div class="container" style="max-width: 900px;">

		<!-- 제목 -->
		<div class="mb-4 d-flex justify-content-center align-items-center"
			style="gap: 8px;">
			<label for="title" class="form-label mb-0"
				style="white-space: nowrap;">제목</label>
			<input type="text" id="title" class="form-control style"
				style="width: 600px; height: 50px; text-align: center;"
				placeholder="제목을 입력하세요">
		</div>

		<!-- 좌우 그리드 -->
		<div class="row can">
			<!-- 왼쪽: 의뢰내용 여러 개 입력 UI로 변경 -->
			<div class="col-md-6">
				<label class="form-label">의뢰내용</label>
				<div id="requestItemsContainer">
					<div class="request-item">
						<input type="text" name="requestContents" class="form-control"
							placeholder="의뢰 내용을 입력하세요" required />
						<button type="button" class="btn btn-danger btn-remove-item">삭제</button>
					</div>
				</div>
				<button type="button" id="addRequestItem"
					class="btn btn-primary mt-2">+ 의뢰내용 추가</button>
			</div>

			<!-- 오른쪽: 사진 업로드 -->
			<div class="col-md-6">
				<div class="image-upload">
					<label for="fileInput" class="form-label">사진 업로드</label>
					<input type="file" id="fileInput" accept="image/*" />
					<p>여기에 사진을 올려주세요</p>
				</div>
			</div>

			<div class="mb-4">
				<label class="form-label d-block">의뢰 기간</label>
				<div class="d-inline-flex gap-3">
					<input type="datetime-local" id="start" class="form-control"
						style="width: 250px;" placeholder="시작 시간 선택"> <input
						type="datetime-local" id="end" class="form-control"
						style="width: 250px;" placeholder="종료 시간 선택">
				</div>
			</div>

			<div class="mb-4">
				<label for="address" class="form-label">주소</label>
				<br> <input type="text" id="address" class="form-control"
					style="width: 515px;" placeholder="의뢰 장소를 입력하세요">
			</div>

			<div class="mb-4">
				<label for="price" class="form-label">의뢰 가격 (코인)</label>
				<div class="d-flex align-items-center" style="gap: 10px;">
					<input type="number" id="price" class="form-control"
						style="width: 200px;" placeholder="예: 100">
					<button type="button" class="btn"
						style="background-color: #00FA9A; color: black;">충전</button>
				</div>
			</div>


			<div class="text-end mt-auto">
				<button type="submit" class="btn btn-lg submit-btn"
					style="background-color: #00FA9A; color: black;">등록</button>
			</div>

		</div>
	</div>

	<script>
	const container = document.getElementById('requestItemsContainer');
	const addBtn = document.getElementById('addRequestItem');

	addBtn.addEventListener('click', () => {
		const div = document.createElement('div');
		div.className = 'request-item';
		div.innerHTML = `
			<input type="text" name="requestContents" class="form-control" placeholder="의뢰 내용을 입력하세요" required />
			<button type="button" class="btn btn-danger btn-remove-item">삭제</button>
		`;
		container.appendChild(div);
	});

	container.addEventListener('click', (e) => {
		if (e.target.classList.contains('btn-remove-item')) {
			const parent = e.target.closest('.request-item');
			if (parent) parent.remove();
		}
	});
</script>
</body>
</html>
