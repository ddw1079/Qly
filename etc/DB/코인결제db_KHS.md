# 들어가야 하는 데이터
1. 코인 내역
- 일자 date
- 수량(+ ,- 숫자)
- 거래 유형 (퀘스트 성공 보상, 퀘스트 요청, 코인 충전 등)
- 거래 대상 (유저)
- 관련 퀘스트 링크

2. 충전 내역 history
- 일자 date
- 결제 방법
- 결제 상황(성공, 실패)
- 결제 금액(금액)
- 충전 수량(코인)
- 잔여 코인(코인 잔여량)

3. 코인 결제 모달 팝업
- pg: payments gateway
- pay_method: 카드 간편결제 등
- merchant_uid: "order_" + new Date().getTime() // 주문 고유 ID
- amount: totalAmount // 1 코인 = 10원 가정
- name: '퀘스트 코인 충전 - ' + totalAmount + '코인',

- buyer_name: '사용자 이름',
- buyer_tel: '010-1234-5678',
- buyer_email: 'email@email.co.kr',
- buyer_addr: '서울특별시 강남구',
- buyer_postcode: '12345',

- 결제 성공 실패 여부
