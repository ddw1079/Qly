<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>요청한 퀘스트 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <style>
        body { font-family: 'Segoe UI', sans-serif; margin: 40px; }
        h1 { margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border-bottom: 1px solid #ddd; text-align: left; }
        th { background: #f5f5f5; }
        tr:hover { background: #f9f9f9; }
        .no-posts { text-align: center; color: #888; padding: 40px 0; }
    </style>
</head>
<body>
    <h1>퀘스트 목록</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>사진</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>신청자 수</th>
            </tr>
        </thead>
        <tbody>
            <!-- 게시글이 없을 때 -->
            <!--
            <tr>
                <td colspan="6" class="no-posts">작성한 게시글이 없습니다.</td>
            </tr>
            -->
            <!-- 게시글 목록 예시 -->
            <tr>
                <td>1</td>
                <td>
                    <img src="/images/quest1.jpg" alt="첫 번째 퀘스트 사진" style="width:48px;height:48px;object-fit:cover;border-radius:6px;">
                </td>
                <td><a href="/mypage/contents/view/1">첫 번째 퀘스트 제목</a></td>
                <td>2024-06-20</td>
                <td>123</td>
                <td>1 명</td>
            </tr>
            <tr>
                <td>2</td>
                <td>
                    <img src="/images/quest2.jpg" alt="두 번째 퀘스트 사진" style="width:48px;height:48px;object-fit:cover;border-radius:6px;">
                </td>
                <td><a href="/mypage/contents/view/2">두 번째 퀘스트 제목</a></td>
                <td>2024-06-20</td>
                <td>98</td>
                <td>아직 없어요...</td>
            </tr>
            <!-- 반복 영역 끝 -->
        </tbody>
    </table>
    <!-- 테이블 페이지네이션. jquery 와 datatable 을 사용해야함. head 태그 부분의 CDN 사용하세요. -->
    <script>
        $(document).ready(function() {
            $('table').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "responsive": true,
                "language": {
                    "emptyTable": "작성한 게시글이 없습니다.",
                    "zeroRecords": "검색 결과가 없습니다.",
                    "info": "총 _TOTAL_개의 퀘스트",
                    "infoEmpty": "퀘스트가 없습니다.",
                    "infoFiltered": "(전체 _MAX_개 중 필터링됨)",
                    "paginate": {
                        "first": "처음",
                        "last": "마지막",
                        "next": "다음",
                        "previous": "이전"
                    }
                }
            });
        });
    </script>

</body>
</html>