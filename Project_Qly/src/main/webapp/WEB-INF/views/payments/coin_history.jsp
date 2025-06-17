<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>보유 코인 및 히스토리</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS CDN (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- DataTables CSS & JS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
</head>
<body>
<div id="modalContainer">
    <!-- Coin Charge Modal -->
    <jsp:include page="../template/coin_charge.jsp" />
</div>
<div class="container my-5">
    <h2 class="mb-4">코인 정보</h2>
    <div class="card p-3">
        <div class="mb-4 row">
            <div class="col-lg d-flex justify-content-start align-items-center">
                <span class="fs-4 fw-bold">보유 코인: 100,000,000 코인</span>
            </div>
            <div class="col-lg d-flex align-items-center">
                <button class="btn btn-success w-100" onclick="$('#chargeCoinModal').modal('show');">코인 충전하기</button>
            </div>
        </div>
        <!-- Bootstrap Tabs -->
        <ul class="nav nav-tabs" id="coinTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="holdings-tab" data-bs-toggle="tab" data-bs-target="#holdings" type="button" role="tab" aria-controls="holdings" aria-selected="true">
                    코인 내역
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="history-tab" data-bs-toggle="tab" data-bs-target="#history" type="button" role="tab" aria-controls="history" aria-selected="false">
                    충전 내역
                </button>
            </li>
        </ul>
        <div class="tab-content mt-3" id="coinTabContent">
            <div class="tab-pane fade show active" id="holdings" role="tabpanel" aria-labelledby="holdings-tab">
                <table class="table table-bordered table-hover">
                    <thead class="table-success">
                        <tr>
                            <th>일자</th>
                            <th>수량</th>
                            <th>거래 유형</th>
                            <th>잔여 코인</th>
                            <th>관련 퀘스트</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 예시 데이터, 실제 데이터로 대체 필요 -->
                        <tr>
                            <td>2025-06-13</td>
                            <td><span class="text-danger">+</span> 100 코인</td>
                            <td>퀘스트 성공 보상</td>
                            <td>300</td>
                            <td><a href="#">quest Page 링크...</a></td>
                        </tr>
                        <tr>
                            <td>2025-06-15</td>
                            <td><span class="text-primary">-</span> 70 코인</td>
                            <td>퀘스트 보상 지급</td>
                            <td>200</td>
                            <td><a href="#">quest Page 링크...</a></td>
                        </tr>
                        <c:forEach var="ch1" items="${coinHistories }">
                        <tr>
                            <td>${ch1.transactionDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${ch1.amount > 0 }">
                                        <span class="text-danger">+</span> ${ch1.amount} 코인
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-primary">-</span> ${Math.abs(ch1.amount)} 코인
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${ch1.type}</td>
                            <td>${ch1.remainCoin }</td>
                            <td><a href="quest/${ch1.questId}">quest Page 링크...</a></td>
                        </tr>
                        </c:forEach>
                        
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="history" role="tabpanel" aria-labelledby="history-tab">
                <table class="table table-striped">
                    <thead class="table-success">
                        <tr>
                            <th>일자</th>
                            <th>결제 방법</th>
                            <th>결제 상황</th>
                            <th>결제 금액</th>
                            <th>충전 수량</th>
                            <th>잔여 코인</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 예시 데이터, 실제 데이터로 대체 필요 -->
                        <tr>
                            <td>2024-05-20 14:30</td>
                            <td>카카오페이</td>
                            <td>성공</td>
                            <td>100,000원</td>
                            <td>10,000 코인</td>
                            <td>110,000 코인</td>
                        </tr>
                        <tr>
                            <td>2024-06-01 09:15</td>
                            <td>계좌이체</td>
                            <td>성공</td>
                            <td>50,000원</td>
                            <td>5,000 코인</td>
                            <td>115,000 코인</td>
                        </tr>
                        
                        <c:forEach var="ch2" items="${paymentHistories }">
                        <tr>
                            <td>${ch2.paymentDate}</td>
                            <td>${ch2.paymentMethod}</td>
                            <td>${ch2.status}</td>
                            <td>${ch2.amount.intValue()}원</td>
                            <td>${(ch2.amount * 10).intValue()} 코인</td>
                            <td>${ch2.remainCoin} 코인</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- table 태그 전체에 Datatable 을 달아준다. -->
<script>
    $(document).ready(function() {
        $('table').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
            "language": {
                "emptyTable": "결과가 없습니다.",
                "zeroRecords": "검색 결과가 없습니다.",
                "info": "총 _TOTAL_개의 결과 중 _START_부터 _END_까지 표시",
                "infoEmpty": "검색 결과가 없습니다.",
                "infoFiltered": "(전체 _MAX_개 중 필터링됨)",
                "paginate": {
                    "first": "처음",
                    "last": "마지막",
                    "next": "다음",
                    "previous": "이전"
                }
            }
        });
    });
</script>
</body>
</html>