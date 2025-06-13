<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����Ʈ ���</title>

<!-- Bootstrap & jQuery -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- ���� �� ��Ÿ�� -->
<style>
.status-dot {
  display: inline-block;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  margin-right: 6px;
  vertical-align: middle;
}
.dot-waiting { background-color: #000; }       /* ����� */
.dot-progress { background-color: #ffc107; }   /* ������ */
.dot-complete { background-color: #28a745; }   /* �Ϸ� */
</style>

<script>
  $(document).ready(function () {
    $("#searchInput").on("keyup", function () {
      const keyword = $(this).val().toLowerCase();
      $(".quest-card").each(function () {
        const cardText = $(this).text().toLowerCase();
        $(this).toggle(cardText.includes(keyword));
      });
    });
  });
</script>
</head>
<body>

<div class="container my-4">
  <h4 class="mb-4 fw-bold">����Ʈ ���</h4>

  <input type="text" id="searchInput" class="form-control mb-4" placeholder="����, ����, ī�װ� �� �˻�">

  <div class="row row-cols-1 row-cols-md-2 g-4">

    <!-- ī�� 1: ����� -->
    <div class="col quest-card">
      <div class="card shadow-sm p-3">
        <div class="mb-2">
          <span class="fw-bold">[ī�װ�]</span> ��Ȱ ����
        </div>
        <div class="mb-2 d-flex align-items-center">
          <div class="status-dot dot-waiting" title="�����"></div>
          <span class="fw-bold">����:</span> �������� �� ���Ϳ�
        </div>
        <div class="mb-2"><span class="fw-bold">��û��:</span> 2��</div>
        <div class="mb-3"><span class="fw-bold">�����:</span> 2025-06-12</div>
        <div class="d-flex justify-content-end gap-2">
          <button class="btn btn-outline-primary btn-sm">�󼼺���</button>
          <button class="btn btn-outline-secondary btn-sm">����</button>
          <button class="btn btn-outline-danger btn-sm">����</button>
        </div>
      </div>
    </div>

    <!-- ī�� 2: ������ -->
    <div class="col quest-card">
      <div class="card shadow-sm p-3">
        <div class="mb-2">
          <span class="fw-bold">[ī�װ�]</span> ��ǻ��
        </div>
        <div class="mb-2 d-flex align-items-center">
          <div class="status-dot dot-progress" title="������"></div>
          <span class="fw-bold">����:</span> ���� �����ּ���
        </div>
        <div class="mb-2"><span class="fw-bold">��û��:</span> 1��</div>
        <div class="mb-3"><span class="fw-bold">�����:</span> 2025-06-10</div>
        <div class="d-flex justify-content-end gap-2">
          <button class="btn btn-outline-primary btn-sm">�󼼺���</button>
          <button class="btn btn-outline-secondary btn-sm">����</button>
          <button class="btn btn-outline-danger btn-sm">����</button>
        </div>
      </div>
    </div>

    <!-- ī�� 3: �Ϸ� -->
    <div class="col quest-card">
      <div class="card shadow-sm p-3">
        <div class="mb-2">
          <span class="fw-bold">[ī�װ�]</span> û��
        </div>
        <div class="mb-2 d-flex align-items-center">
          <div class="status-dot dot-complete" title="�Ϸ�"></div>
          <span class="fw-bold">����:</span> ���� û�� ��Ź�ؿ�
        </div>
        <div class="mb-2"><span class="fw-bold">��û��:</span> 4��</div>
        <div class="mb-3"><span class="fw-bold">�����:</span> 2025-06-05</div>
        <div class="d-flex justify-content-end gap-2">
          <button class="btn btn-outline-primary btn-sm">�󼼺���</button>
          <button class="btn btn-outline-secondary btn-sm">����</button>
          <button class="btn btn-outline-danger btn-sm">����</button>
        </div>
      </div>
    </div>

  </div>
</div>

</body>
</html>
