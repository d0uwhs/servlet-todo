# 더미데이터는 다양하고, 실제적으로 사용가능한 데이터를 넣어야 기능테스트떄 오류가 안난다.
# 오라클은 AUTOCOMMIT FALSE. COMMIT을 안하면 값 안들어감. MARIADB는 기본이 AUTO COMMIT

use webdb;
DROP TABLE tbl1_todo;

CREATE TABLE tbl1_todo
(
    tno     INT AUTO_INCREMENT PRIMARY KEY,
    title   VARCHAR(500) NOT NULL,
    memo    TEXT         NOT NULL,
    regdate TIMESTAMP default now(),
    moddate TIMESTAMP default now()
);

SELECT *
FROM tbl1_todo;


INSERT INTO tbl1_todo (title, memo) VALUE ('Test Title', 'Test Memo');

INSERT INTO tbl1_todo (title, memo, duedate) VALUE ('Test Title', 'Test Memo', now());
# DUEDATE가 비어있는 상태
ALTER TABLE tbl1_todo
    ADD COLUMN duedate DATE NOT NULL;
# TINYDATE로 안하면 0
ALTER TABLE tbl1_todo
    ADD COLUMN complete BOOLEAN NOT NULL DEFAULT false;

UPDATE tbl1_todo
SET title = concat(title, '', tno)
where tno > 0;

UPDATE tbl1_todo
SET memo = concat(memo, '', tno)
where tno > 0;

UPDATE tbl1_todo SET duedate = ADDDATE('2022-09-27',INTERVAL tno DAY) where tno > 0;