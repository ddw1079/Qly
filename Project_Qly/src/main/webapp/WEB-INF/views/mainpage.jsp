<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:include page="/template/menubar.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QLY 메인페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage.css" type="text/css"/>
<style ></style>
</head>
<body class="d-flex flex-column min-vh-100">
	<%
	com.qly.dto.UserDto loginUser = (com.qly.dto.UserDto) session.getAttribute("loginUser");

	int userId = loginUser != null ? loginUser.getUserId() : 0;
	String userName = loginUser != null ? loginUser.getUsername() : "게스트";
	String userType = loginUser != null ? loginUser.getUserType() : "비회원";
	%>

	<c:if test="${not empty error}">
		<script>
			alert("${error}");
		</script>
	</c:if>
	<!-- ✅ 히어로 배너 전체 -->
	<div class="hero-banner">
	  <div class="hero-content">
	  	<!-- ✅ 왼쪽 텍스트 영역 -->
	    <div class="hero-text">
	      <h2>🌱 <span>생활 속 퀘스트</span>에 도전해보세요!</h2>
	      <p>지금, 도움이 필요한 일이<br> 가까운 곳에서 기다리고 있어요</p>
	      <p>누구나 요청하고 누구나 도와주는<br> 생활 속 퀘스트 플랫폼, <strong>QLY</strong></p>
	      <button class="hero-button">퀘스트 보러가기</button>
	    </div>
	    <!-- ✅ 오른쪽: 원형 로고 -->
	    <div class="hero-image">
	      <div class="logo-circle">
	        <img src="https://i.postimg.cc/fLQ19GDs/logo4.png" alt="QLY 로고" />
	      </div>
	    </div>
	  </div>
	</div>
	<form method="get" action="${pageContext.request.contextPath}/quest/list.do">
		<div class="search-bar d-flex flex-wrap gap-2 justify-content-center align-items-center p-2">
		<div class="flex-grow-1" style="min-width: 240px;">
			<input type="text" id="searchInput" class="form-control w-100" placeholder="검색어 입력" />
		</div>
		<button type="submit" class="btn search-btn">검색</button>
		</div>
	</form>

	
	<div class="d-flex justify-content-center mt-2 px-3">
	  <div class="w-100" id="suggestedTags" style="max-width: 1000px;">
	    <span class="text-muted"></span>
	  </div>
	</div>
	<!-- 검색창 카테고리 나오게 하는 이벤트 js -->
	<script>
	document.querySelector('#searchInput').addEventListener('input', function () {
		const keyword = document.getElementById('searchInput').value;

		fetch("/categories?keyword=" + keyword)
			.then(res => res.json())
			.then(data => {
			const tagContainer = document.getElementById("suggestedTags");
			tagContainer.innerHTML = "";

			if (data.length === 0) {
				tagContainer.innerHTML = "<span class='text-muted'>검색 결과가 없습니다</span>";
				return;
			}

			data.forEach(category => {
				  const span = document.createElement("span");
				  span.className = "badge bg-success me-2";
				  span.textContent = category;

				  // 클릭 시 input에 카테고리 값 입력
				  span.addEventListener("click", function () {
				    document.getElementById("searchInput").value = category;
				  });

				  tagContainer.appendChild(span);
				});
			});
		});
	</script>

	<!-- ✅ 자주 찾는 서비스 아이콘 전체 wrapper -->
	<div class="service-wrapper-custom">
	<c:choose>
	<c:when test="${loginUser.userType eq '의뢰인'}">
		<a href="#">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/1055/1055646.png"
					alt="">
				<div>퀘스트 목록</div>
			</div>
		</a>
		<a href="<c:url value='/quest/questRegisterForm.do' />">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/1055/1055647.png"
				alt="">
				<div>퀘스트 등록</div>
			</div>
		</a>
		<a href="#">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/2922/2922510.png"
					alt="">
				<div>마이페이지</div>
			</div>
		</a>
		<a href="#">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/159/159078.png"
					alt="">
				<div>코인 충전</div>
			</div>		
		</a>
		<a href="#">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/2922/2922510.png"
					alt="">
				<div>문의하기</div>
			</div>			
		</a>
	</c:when>
	<c:when test="${loginUser.userType eq '해결사'}">
		<a href="#">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/1055/1055646.png"
					alt="">
				<div>퀘스트 목록</div>
			</div>
		</a>
		<a href="<c:url value='/quest/questRegisterForm.do' />">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/1055/1055647.png"
				alt="">
				<div>퀘스트 신청</div>
			</div>
		</a>
		<a href="#">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/2922/2922510.png"
					alt="">
				<div>마이페이지</div>
			</div>
		</a>
		<a href="#">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/159/159078.png"
					alt="">
				<div>코인 충전</div>
			</div>		
		</a>
		<a href="#">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/2922/2922510.png"
					alt="">
				<div>문의하기</div>
			</div>			
		</a>
	</c:when>
	
	<c:when test="${loginUser.userType eq '관리자'}">
		<a href="#">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/1055/1055646.png"
					alt="">
				<div>퀘스트 목록</div>
			</div>
		</a>
		<a href="#">
			<div class="service-box text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/2922/2922510.png"
					alt="">
				<div>관리자 페이지</div>
			</div>
		</a>
	</c:when>
	</c:choose>

		<%-- <div class="service-box text-center">
			<img src="https://cdn-icons-png.flaticon.com/512/2991/2991148.png"
				alt="">
			<div>퀘스트 지도</div>
		</div> --%>

	</div>



	<!-- ✅ LATEST QUEST 게시판 형식 -->
	<div class="quest-section">
	  <h3 class="section-title text-center">
	    당신의 도움을 필요로 하는 최신 퀘스트들...
	  </h3>
	  
	  <div class="table-wrapper">
	    <table class="table table-hover table-bordered text-center align-middle">
	      <thead class="table-light">
	        <tr>
	          <th>등록일</th>
	          <th>카테고리</th>
	          <th>제목</th>
	          <th>퀘스트 보상</th>
	          <th>작성자</th>
	        </tr>
	      </thead>
	      <tbody>
	        <c:forEach var="quest" items="${latest5Quests}">
	          <tr>
	            <td><fmt:formatDate value="${quest.createdAt}" pattern="yyyy-MM-dd" /></td>
	            <td>${quest.category}</td>
	            <td class="text-start">
	              <a href="<c:url value='${pageContext.request.contextPath}/quest/particularForm.do?questId=${quest.questId}' />">
	                ${quest.title}
	              </a>
	            </td>
	            <td>${quest.rewardTokens} Coin</td>
	            <td>${quest.username}</td>
	          </tr>
	        </c:forEach>
	      </tbody>
	    </table>
	  </div>
	</div>

	<!-- ✅ 지도 위 텍스트 -->
	<!-- 위치 퀘스트 멘트 박스 -->
	<div class="w-100"
		style="background-color: #d0f0ec; padding: 12px 0; border-radius: 8px;">
		<h3 class="text-center"
			style="margin: 0; color: #004d40; font-weight: bold;">
			<img src="https://cdn-icons-png.flaticon.com/512/535/535137.png"
				style="height: 40px; vertical-align: middle; margin-right: 8px;">
			지금 내 근처엔 어떤 <span style="color: #00bfa5;">퀘스트</span>가 있을까요?
		</h3>
	</div>


	<div class="map-section-wrapper mt-2">
		<div class="map-box">
			<div id="map" style="width: 100%; height: 400px; border-radius: 8px;"></div>
		</div>
		<div class="region-section">
			<div style="border: 2px solid #2196F3; border-radius: 4px;">
				<div
					style="background-color: #49847e; color: white; padding: 8px 10px;">
					<strong>지역 선택</strong>
				</div>
				<div style="padding: 10px;">
					<%-- <div class="region-select-box">
					  	<div class="title">지역 선택</div>
					  	<div class="body">
						    <!-- select 요소들 -->
					  	</div>
					</div> --%>
					<select id="regionSelect" class="form-select mb-2">
						<option value="">-- 시/도 선택 --</option>
						<option value="서울시">서울시</option>
						<option value="부산시">부산시</option>
						<option value="대구시">대구시</option>
					</select> <select id="districtSelect" class="form-select">
						<option value="">-- 구/군 선택 --</option>
					</select>
				</div>
			</div>
			<div id="questListBox"
				style="padding: 10px; background: #ffffff; border-radius: 8px; border: 1px solid #ccc;">
				<c:choose>
				<c:when test="{ not empty }">
				</c:when>
				<c:otherwise>
				</c:otherwise>
				</c:choose>
				<h5 style="color: #00796b; font-weight: bold; margin-bottom: 10px;">📌
					관련 퀘스트</h5>
				<ul id="questList" style="padding-left: 15px; margin: 0;">
					<li style="color: gray;">선택된 지역이 없습니다.</li>
				</ul>
			</div>
		</div>
	</div>


	<div class="event-banner-wrapper">
		<div class="container" style="max-width: 1000px;">
			<h3 style="font-weight: bold; font-size: 24px; margin-bottom: 30px;">
				<img src="https://cdn-icons-png.flaticon.com/512/833/833472.png"
					style="height: 20px; margin-right: 8px;"> 이런 <span
					style="color: #ff9800;">퀘스트</span> 어떠세요?
			</h3>
			<div class="event-card-wrapper">
				<c:forEach var="quest2" items="${random3Quests}">
				<!-- 카드 템플릿 -->
				<div class="card event-card">
					<div>
						<span class="badge badge-pill badge-success">대기중...</span>
						<h5 class="card-title">${quest2.title }</h5>
						<p class="card-text">
						${quest2.content.length() > 30 ? quest2.content.substring(0, 30).concat('...') : quest2.content}
						</p>
						<p class="text-muted">리워드: ${quest2.rewardTokens }</p>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<footer class="footer-bar mt-auto">
		<div>
			<strong>이용안내</strong><br> 자주 묻는 질문<br> 이용약관<br>
			개인정보처리방침
		</div>
		<div>
			<strong>이용 혜택</strong><br> 광고 없이 깔끔한 이용<br> 팝업 없음 / 무료 이용<br>
			커뮤니티 바로가기
		</div>
		<div>
			<strong>회사 정보</strong><br> 주소: 서울시 어딘가<br> FAX:
			02-1234-5678<br> EMAIL: contact@qly.com
		</div>
		<div>
			<strong>SNS</strong><br> 인스타그램<br> 유튜브<br> 페이스북
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ffded417f5d8a057e299cf7acb7c310a&libraries=services"></script>
	<script>
    let map, marker, geocoder;
    function initMap() {
      const container = document.getElementById('map');
      map = new kakao.maps.Map(container, {
        center: new kakao.maps.LatLng(37.5665, 126.9780),
        level: 6
      });
      geocoder = new kakao.maps.services.Geocoder();
    }

    function setMarkerByAddress(address) {
      if (!address || !geocoder || !map) return;
      geocoder.addressSearch(address, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
          const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
          map.setCenter(coords);
          if (marker) marker.setMap(null);
          marker = new kakao.maps.Marker({ map: map, position: coords });
        }
      });
    }

    document.addEventListener('DOMContentLoaded', function () {
      initMap();
      const regionSelect = document.getElementById('regionSelect');
      const districtSelect = document.getElementById('districtSelect');
      const districts = {
        서울시: ['강남구', '마포구', '종로구'],
        부산시: ['해운대구', '수영구'],
        대구시: ['달서구', '중구']
      };
      regionSelect.addEventListener('change', function () {
        const region = this.value;
        districtSelect.innerHTML = '<option value="">-- 구 선택 --</option>';
        if (districts[region]) {
          districts[region].forEach(d => {
            const opt = document.createElement('option');
            opt.value = d;
            opt.innerText = d;
            districtSelect.appendChild(opt);
          });
        }
      });
      districtSelect.addEventListener('change', function () {
        const region = regionSelect.options[regionSelect.selectedIndex].text;
        const district = this.value;
        const fullAddress = region + ' ' + district;
        setMarkerByAddress(fullAddress);

        const list = document.getElementById('questList');
        list.innerHTML = '';
        const sampleQuests = {
          '서울 강남구': ['짐 옮기기 - 김철수', '청소 도우미 - 최은지'],
          '서울 마포구': ['강아지 산책 - 이영희'],
          '부산 해운대구': ['가구 조립 - 박민준'],
          '대구 중구': ['택배 수령 - 정다은']
        };
        const key = region + ' ' + district;
        
        
        if (sampleQuests[key]) {
          sampleQuests[key].forEach(item => {
            const li = document.createElement('li');
            li.textContent = item;
            list.appendChild(li);
          });
        } else {
          const li = document.createElement('li');
          li.textContent = '등록된 퀘스트가 없습니다.';
          list.appendChild(li);
        }
      });
    });
  </script>

	<!-- 기존 스크립트들 아래에 추가 -->
	<script>
  const keywordMap = {
    청소: ['청소', '청소도우미', '집청소', '가사도우미'],
    이사: ['이삿짐운반', '이사도우미', '짐정리'],
    배포: ['전단지', '배포작업', '거리홍보'],
    조립: ['가구조립', 'DIY', '설치작업'],
    산책: ['반려견산책', '강아지산책', '펫케어'],
  };

  document.getElementById('searchInput').addEventListener('input', function () {
    const input = this.value.trim().toLowerCase();
    const suggestions = [];

    for (const key in keywordMap) {
      if (input && key.includes(input)) {
        suggestions.push(...keywordMap[key]);
      }
    }

    const tagBox = document.getElementById('suggestedTags');
    tagBox.innerHTML = '';

    if (suggestions.length > 0) {
      suggestions.forEach(tag => {
        const span = document.createElement('span');
        span.textContent = '#' + tag;

        // ✅ 스타일
        span.style.marginRight = '16px';
        span.style.color = '#019267';
        span.style.fontWeight = '600';
        span.style.fontSize = '20px';
        span.style.cursor = 'pointer';
        span.style.padding = '6px 12px';
        span.style.borderRadius = '20px';
        span.style.backgroundColor = '#f0fefc';
        span.style.border = '1px solid #b2dfdb';
        span.style.transition = 'all 0.2s ease';
        span.style.display = 'inline-block';

        // ✅ 클릭 시 검색창에 입력
        span.addEventListener('click', function () {
          document.getElementById('searchInput').value = tag;
        });

        // ✅ 눌리는 느낌 효과
        span.addEventListener('mouseover', function () {
          span.style.backgroundColor = '#d2f3ed';
        });
        span.addEventListener('mouseout', function () {
          span.style.backgroundColor = '#f0fefc';
        });
        span.addEventListener('mousedown', function () {
          span.style.transform = 'scale(0.95)';
        });
        span.addEventListener('mouseup', function () {
          span.style.transform = 'scale(1)';
        });

        tagBox.appendChild(span);
      });
    }
  });
</script>


</body>
</html>

