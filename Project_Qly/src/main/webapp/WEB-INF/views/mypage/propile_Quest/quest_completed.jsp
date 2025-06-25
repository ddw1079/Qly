<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완료된 퀘스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
.card {
	min-height: 500px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.card img {
	height: 300px;
	object-fit: cover;
	border-radius: 6px;
}
</style>
</head>
<body>


	<div class="container my-4">
		<h3 class="text-center mb-4">완료된 퀘스트</h3>

		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="quest" items="${completedQuests}">

				<%-- 콘솔 로그 출력 --%>
				<%
				com.qly.dto.QuestDto q = (com.qly.dto.QuestDto) pageContext.getAttribute("quest");
				System.out.println("📸 사진: " + q.getPhotoPath());
				System.out.println("🗓️ 등록일: " + q.getRegDate());
				%>

				<div class="col quest-card">
					<div class="card shadow-sm p-3">

						<!-- 이미지 -->
						<c:if test="${not empty quest.photoPath}">
							<img src="${quest.photoPath}" class="card-img-top mb-3"
								alt="퀘스트 이미지" />
						</c:if>

						<!-- 카드 본문 -->
						<div
							class="card-body d-flex flex-column justify-content-between p-0">
							<div>
								<div class="mb-2">
									<strong>카테고리:</strong> ${quest.category}
								</div>
								<div class="mb-2">
									<strong>제목:</strong> ${quest.title}
								</div>
								<div class="mb-3">
									<strong>등록일:</strong>
									<c:choose>
										<c:when test="${not empty quest.regDate}">
											<fmt:formatDate value="${quest.regDate}"
												pattern="yyyy년 M월 d일" />
										</c:when>
										<c:otherwise>정보 없음</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>