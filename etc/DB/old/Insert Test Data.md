# Insert Test Data
```SQL
-- USERS
INSERT INTO USERS (USER_ID, PASSWORD, NICKNAME, EMAIL, TOTAL_TOKENS) 
VALUES ('user01', 'pass1234', '용감한토끼', 'rabbit@example.com', 100);

INSERT INTO USERS (USER_ID, PASSWORD, NICKNAME, EMAIL, TOTAL_TOKENS) 
VALUES ('user02', 'pass5678', '똑똑한너구리', 'raccoon@example.com', 50);

INSERT INTO USERS (USER_ID, PASSWORD, NICKNAME, EMAIL, TOTAL_TOKENS) 
VALUES ('user03', 'passabcd', '느긋한곰', 'bear@example.com', 200);

-- QUESTS
INSERT INTO QUESTS (QUEST_ID, TITLE, DESCRIPTION, REWARD_TOKENS, LOCATION, CREATOR_ID, STATUS, DEADLINE) 
VALUES (1, '동네 쓰레기 줍기', '우리 동네를 깨끗하게!', 10, '서울 강남구', 'user01', 'OPEN', TO_DATE('2025-06-30', 'YYYY-MM-DD'));

INSERT INTO QUESTS (QUEST_ID, TITLE, DESCRIPTION, REWARD_TOKENS, LOCATION, CREATOR_ID, STATUS, DEADLINE) 
VALUES (2, '강아지 산책 시켜주세요', '바쁘신 부모님 대신 부탁드립니다.', 20, '서울 마포구', 'user02', 'OPEN', TO_DATE('2025-06-20', 'YYYY-MM-DD'));

-- QUEST_APPLICATIONS
INSERT INTO QUEST_APPLICATIONS (APPLICATION_ID, QUEST_ID, APPLICANT_ID, STATUS) 
VALUES (1, 1, 'user02', 'APPROVED');

INSERT INTO QUEST_APPLICATIONS (APPLICATION_ID, QUEST_ID, APPLICANT_ID, STATUS) 
VALUES (2, 2, 'user03', 'PENDING');

-- QUEST_HISTORY
INSERT INTO QUEST_HISTORY (HISTORY_ID, QUEST_ID, USER_ID, RESULT, COMPLETED_AT) 
VALUES (1, 1, 'user02', 'SUCCESS', SYSDATE - 1);

-- PAYMENTS
INSERT INTO PAYMENTS (PAYMENT_ID, USER_ID, AMOUNT, TYPE, DESCRIPTION) 
VALUES (1, 'user01', 100, 'PURCHASE', '카드로 토큰 충전');

INSERT INTO PAYMENTS (PAYMENT_ID, USER_ID, AMOUNT, TYPE, DESCRIPTION) 
VALUES (2, 'user02', 10, 'QUEST_REWARD', '퀘스트 완료 보상 지급');

-- WITHDRAWALS
INSERT INTO WITHDRAWALS (WITHDRAWAL_ID, USER_ID, AMOUNT, STATUS) 
VALUES (1, 'user03', 50, 'REQUESTED');
```