<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:include page="/template/menubar.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QLY 메인페이지</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	font-family: 'Malgun Gothic', sans-serif;
	margin-bottom: 120px;
}

.search-bar {
	width: 1200px;
	margin: 40px auto 20px;
	display: flex;
	justify-content: center;
}

.search-bar input.form-control {
	height: 50px;
	font-size: 18px;
}

.section-title {
	background-color: #49847e;
	color: white;
	padding: 10px;
	font-weight: bold;
	margin: 40px 0 20px;
}
/* 🔸 둥근 박스 wrapper */
.service-wrapper {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 1000px;
	margin: 30px auto;
	padding: 20px 10px;
	background-color: #ffffff;
	border-radius: 20px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
	height: 120px;
	position: relative;
	box-sizing: border-box;
	overflow: visible;
}

/* 아이콘 5개 정렬 */
/* ✅ 자주 찾는 서비스 영역 */

/* 전체 wrapper 박스 */
.service-wrapper-custom {
	background-color: #e6f4f2; /* 옅은 민트 */
	border-radius: 20px;
	padding: 30px 40px;
	margin: 40px auto;
	width: 1000px;
	display: flex;
	justify-content: space-between;
	box-shadow: inset 0 2px 8px rgba(0, 0, 0, 0.03); /* 약간 안쪽 입체감 */
}

/* 각 아이콘 박스 */
.service-box {
	width: 150px;
	height: 130px;
	background-color: white;
	border-radius: 16px;
	padding: 15px 10px;
	box-shadow: inset 0 2px 6px rgba(0, 0, 0, 0.06); /* 안쪽으로 쏙 들어간 느낌 */
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	transition: 0.3s ease;
}

.service-box:hover {
	transform: translateY(-3px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* hover 시 위로 뜨는 느낌 */
}

/* 아이콘 이미지 */
.service-box img {
	width: 40px;
	height: 40px;
	margin-bottom: 8px;
}

.map-section-wrapper {
	max-width: 1000px;
	margin: 40px auto;
	display: flex;
	gap: 30px;
}

.map-box {
	flex: 1;
	background-color: rgba(73, 132, 126, 0.15); /* 흐리게 적용 */
	padding: 10px;
	border-radius: 8px;
}

.region-section {
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.event-banner-wrapper {
	background-color: #f6fbfd;
	padding: 40px 0;
}

.event-card-wrapper {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
}

.event-card {
	background-color: #eef5fa;
	border-radius: 16px;
	padding: 20px;
	height: 160px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	transition: 0.3s ease;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	position: relative; /* 아이콘 위치 기준 */
	flex: 1 1 calc(33% - 20px);
}

.event-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.card-icon {
	width: 40px;
	height: 40px;
	position: absolute;
	bottom: 12px;
	right: 12px;
	object-fit: contain;
}

.footer-bar {
	background: linear-gradient(to right, #eeeeee, #e0f4f2);
	color: #444;
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	padding: 18px 40px;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
	box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.05);
	border-top: 1px solid #ccc;
}

.footer-bar div {
	flex: 1;
	padding: 0 10px;
	line-height: 1.6;
}

.footer-bar div:not(:last-child) {
	border-right: 1px solid #ccc;
}
</style>
</head>
<body>

	<c:if test="${not empty error}">
		<script>
		alert("${error}");
	</script>
	</c:if>
	<!-- ✅ 히어로 배너 전체 -->
	<div style="background-color: #e6f4f2; padding: 60px 0;">
		<div
			style="max-width: 1600px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; gap: 60px;">

			<!-- ✅ 왼쪽 텍스트 영역 -->
			<div style="flex: 1.2;">
				<h2
					style="font-size: 50px; font-weight: bold; color: #009688; margin-bottom: 24px; line-height: 1.4;">
					🌱 <span style="color: #41867e;">생활 속 퀘스트</span>에 도전해보세요!
				</h2>
				<p
					style="font-size: 20px; color: #333; margin-bottom: 12px; line-height: 1.6;">
					지금, 도움이 필요한 일이<br> 가까운 곳에서 기다리고 있어요
				</p>
				<p
					style="font-size: 20px; color: #333; margin-bottom: 24px; line-height: 1.6;">
					누구나 요청하고 누구나 도와주는<br> 생활 속 퀘스트 플랫폼, <strong
						style="color: #ff9800;">QLY</strong>
				</p>
				<button
					style="padding: 12px 28px; background-color: #019267; color: white; border: none; border-radius: 30px; font-weight: bold; font-size: 16px;">
					퀘스트 보러가기</button>
			</div>

			<!-- ✅ 오른쪽: 원형 로고 -->
			<div
				style="flex: 0.8; display: flex; justify-content: center; align-items: center;">
				<div
					style="width: 420px; height: 420px; border-radius: 50%; background-color: #ffffff; border: 8px solid #c6ece5; display: flex; justify-content: center; align-items: center; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);">
					<img src="https://i.postimg.cc/fLQ19GDs/logo4.png" alt="QLY 로고"
						style="width: 360px; height: 360px; object-fit: contain;" />
				</div>
			</div>

		</div>
	</div>




	<div class="search-bar">
		<div style="flex-grow: 1;">
			<input type="text" id="searchInput" class="form-control"
				placeholder="검색어 입력">
		</div>
		<button class="btn ms-2"
			style="background-color: #40746e; color: white; font-weight: bold;">검색</button>
	</div>

	<div class="d-flex justify-content-center mt-1">
		<div style="width: 1000px; text-align: left;" id="suggestedTags">
			<span class="text-muted"></span>
		</div>
	</div>

	<!-- ✅ 자주 찾는 서비스 아이콘 전체 wrapper -->
	<div class="service-wrapper-custom">
		<div class="service-box text-center">
			<img src="https://cdn-icons-png.flaticon.com/512/1055/1055646.png"
				alt="">
			<div>퀘스트 서비스</div>
		</div>
		<div class="service-box text-center">
			<img src="https://cdn-icons-png.flaticon.com/512/2922/2922510.png"
				alt="">
			<div>서비스 신청</div>
		</div>
		<div class="service-box text-center">
			<img src="https://cdn-icons-png.flaticon.com/512/159/159078.png"
				alt="">
			<div>퀘스트 도움</div>
		</div>
		<div class="service-box text-center">
			<img src="https://cdn-icons-png.flaticon.com/512/2991/2991148.png"
				alt="">
			<div>퀘스트 지도</div>
		</div>
		<div class="service-box text-center">
			<img src="https://cdn-icons-png.flaticon.com/512/709/709496.png"
				alt="">
			<div>마이페이지</div>
		</div>
	</div>



	<!-- ✅ BEST QUEST 게시판 형식 -->
	<div class="quest-section" style="width: 1000px; margin: 40px auto;">
		<h3 class="section-title text-center">BEST QUEST</h3>
		<table
			class="table table-hover table-bordered text-center align-middle">
			<thead class="table-light">
				<tr>
					<th style="width: 60px;">순위</th>
					<th>제목</th>
					<th style="width: 120px;">작성자</th>
					<th style="width: 150px;">등록일</th>
					<th style="width: 80px;">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td class="text-start">강남 퀘스트 도와주실 분 구합니다</td>
					<td>홍길동</td>
					<td>2025-06-15</td>
					<td>34</td>
				</tr>
				<tr>
					<td>2</td>
					<td class="text-start">홍대 미션 페인트 작업 퀘스트</td>
					<td>김영희</td>
					<td>2025-06-14</td>
					<td>27</td>
				</tr>
				<tr>
					<td>3</td>
					<td class="text-start">성수동 페인트 봉사 도우미</td>
					<td>이준호</td>
					<td>2025-06-13</td>
					<td>42</td>
				</tr>
				<tr>
					<td>4</td>
					<td class="text-start">이삿짐 운반 도와주실 분</td>
					<td>박민수</td>
					<td>2025-06-13</td>
					<td>19</td>
				</tr>
				<tr>
					<td>5</td>
					<td class="text-start">전단지 배포 알바 구합니다</td>
					<td>최지은</td>
					<td>2025-06-12</td>
					<td>56</td>
				</tr>
			</tbody>
		</table>
	</div>


	<!-- ✅ 지도 위 텍스트 -->
	<!-- 위치 퀘스트 멘트 박스 -->
	<div
		style="background-color: #d0f0ec; width: 1000px; margin: 40px auto 20px; padding: 12px 0; border-radius: 8px;">
		<h3 class="text-center"
			style="margin: 0; color: #004d40; font-weight: bold;">
			<img src="https://cdn-icons-png.flaticon.com/512/535/535137.png"
				style="height: 40px; vertical-align: middle; margin-right: 8px;">
			지금 내 근처엔 어떤 <span style="color: #00bfa5;">퀘스트</span>가 있을까요?
		</h3>
	</div>


	<div class="map-section-wrapper">
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
					<select id="regionSelect" class="form-select mb-2">
						<option value="">-- 시/도 선택 --</option>
						<option value="서울">서울</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
					</select> <select id="districtSelect" class="form-select">
						<option value="">-- 구/군 선택 --</option>
					</select>
				</div>
			</div>
			<div id="questListBox"
				style="padding: 10px; background: #ffffff; border-radius: 8px; border: 1px solid #ccc;">
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

				<!-- 카드 1 -->
				<div class="card event-card">
					<div>
						<h5 class="card-title">전단지 배포 퀘스트</h5>
						<p class="card-text">하루 2시간, 동네에 전단지를 배포해보세요!</p>
						<p class="text-muted">리워드: 3 Qubit</p>
					</div>
					<img class="card-icon"
						src="https://cdn-icons-png.flaticon.com/512/3715/3715122.png"
						alt="배포 아이콘">
				</div>

				<!-- 카드 2 -->
				<div class="card event-card">
					<div>
						<h5 class="card-title">가구 조립 도움 요청</h5>
						<p class="card-text">혼자 하기 어려운 조립 작업, 도움을 줄 수 있어요!</p>
						<p class="text-muted">리워드: 10 Qubit</p>
					</div>
					<img class="card-icon"
						src="https://cdn-icons-png.flaticon.com/512/3121/3121910.png"
						alt="조립 아이콘">
				</div>

				<!-- 카드 3 -->
				<div class="card event-card">
					<div>
						<h5 class="card-title">이사짐 운반 도움</h5>
						<p class="card-text">가까운 거리 짐 운반, 함께 해주실 분을 구합니다.</p>
						<p class="text-muted">리워드: 15 Qubit + 식사 제공</p>
					</div>
					<img class="card-icon"
						src="https://cdn-icons-png.flaticon.com/512/4385/4385008.png"
						alt="운반 아이콘">
				</div>

			</div>
		</div>
	</div>

	<div class="footer-bar">
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
	</div>

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
        서울: ['강남구', '마포구', '종로구'],
        부산: ['해운대구', '수영구'],
        대구: ['달서구', '중구']
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


</body>
</html>
