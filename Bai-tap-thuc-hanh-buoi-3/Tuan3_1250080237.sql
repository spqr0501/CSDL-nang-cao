CREATE TABLE COURSE (
    COURSENO        NUMBER(8,0)     NOT NULL,
    DESCRIPTION     VARCHAR2(50),
    COST            NUMBER(9,2),
    PREREQUISITE    NUMBER(8,0),
    CREATEDBY       VARCHAR2(30)    NOT NULL,
    CREATEDDATE     DATE            NOT NULL,
    MODIFIEDBY      VARCHAR2(30)    NOT NULL,
    MODIFIEDDATE    DATE            NOT NULL,
    CONSTRAINT PK_COURSE PRIMARY KEY (COURSENO),
    CONSTRAINT FK_COURSE_PREREQ FOREIGN KEY (PREREQUISITE) REFERENCES COURSE(COURSENO)
);

CREATE TABLE INSTRUCTOR (
    INSTRUCTORID    NUMBER(8)       NOT NULL,
    SALUTATION      VARCHAR2(10),
    FIRSTNAME       VARCHAR2(25),
    LASTNAME        VARCHAR2(25),
    ADDRESS         VARCHAR2(50),
    PHONE           VARCHAR2(15),
    CREATEDBY       VARCHAR2(30)    NOT NULL,
    CREATEDDATE     DATE            NOT NULL,
    MODIFIEDBY      VARCHAR2(30)    NOT NULL,
    MODIFIEDDATE    DATE            NOT NULL,
    CONSTRAINT PK_INSTRUCTOR PRIMARY KEY (INSTRUCTORID)
);

CREATE TABLE CLASS (
    CLASSID         NUMBER(8,0)     NOT NULL,
    COURSENO        NUMBER(8,0)     NOT NULL,
    CLASSNO         NUMBER(3)       NOT NULL,
    STARTDATETIME   DATE,
    LOCATION        VARCHAR2(50),
    INSTRUCTORID    NUMBER(8,0)     NOT NULL,
    CAPACITY        NUMBER(3,0),
    CREATEDBY       VARCHAR2(30)    NOT NULL,
    CREATEDDATE     DATE            NOT NULL,
    MODIFIEDBY      VARCHAR2(30)    NOT NULL,
    MODIFIEDDATE    DATE            NOT NULL,
    CONSTRAINT PK_CLASS PRIMARY KEY (CLASSID),
    CONSTRAINT FK_CLASS_COURSE FOREIGN KEY (COURSENO) REFERENCES COURSE(COURSENO),
    CONSTRAINT FK_CLASS_INSTRUCTOR FOREIGN KEY (INSTRUCTORID) REFERENCES INSTRUCTOR(INSTRUCTORID)
);

CREATE TABLE STUDENT (
    STUDENTID         NUMBER(8,0)     NOT NULL,
    SALUTATION        VARCHAR2(10),
    FIRSTNAME         VARCHAR2(25),
    LASTNAME          VARCHAR2(25)    NOT NULL,
    ADDRESS           VARCHAR2(50),
    PHONE             VARCHAR2(15),
    EMPLOYER          VARCHAR2(50),
    REGISTRATIONDATE  DATE            NOT NULL,
    CREATEDBY         VARCHAR2(30)    NOT NULL,
    CREATEDDATE       DATE            NOT NULL,
    MODIFIEDBY        VARCHAR2(30)    NOT NULL,
    MODIFIEDDATE      DATE            NOT NULL,
    CONSTRAINT PK_STUDENT PRIMARY KEY (STUDENTID)
);

CREATE TABLE ENROLLMENT (
    STUDENTID     NUMBER(8,0)     NOT NULL,
    CLASSID       NUMBER(8,0)     NOT NULL,
    ENROLLDATE    DATE            NOT NULL,
    FINALGRADE    NUMBER(3,0),
    CREATEDBY     VARCHAR2(30)    NOT NULL,
    CREATEDDATE   DATE            NOT NULL,
    MODIFIEDBY    VARCHAR2(30)    NOT NULL,
    MODIFIEDDATE  DATE            NOT NULL,
    CONSTRAINT PK_ENROLLMENT PRIMARY KEY (STUDENTID, CLASSID),
    CONSTRAINT FK_ENROLLMENT_STUDENT FOREIGN KEY (STUDENTID) REFERENCES STUDENT(STUDENTID),
    CONSTRAINT FK_ENROLLMENT_CLASS FOREIGN KEY (CLASSID) REFERENCES CLASS(CLASSID)
);

CREATE TABLE GRADE (
    STUDENTID     NUMBER(8)       NOT NULL,
    CLASSID       NUMBER(8)       NOT NULL,
    GRADE         NUMBER(3)       NOT NULL,
    COMMENTS      VARCHAR2(2000),
    CREATEDBY     VARCHAR2(30)    NOT NULL,
    CREATEDDATE   DATE            NOT NULL,
    MODIFIEDBY    VARCHAR2(30)    NOT NULL,
    MODIFIEDDATE  DATE            NOT NULL,
    CONSTRAINT PK_GRADE PRIMARY KEY (STUDENTID, CLASSID),
    CONSTRAINT FK_GRADE_ENROLLMENT FOREIGN KEY (STUDENTID, CLASSID) REFERENCES ENROLLMENT(STUDENTID, CLASSID)
);


INSERT INTO COURSE (COURSENO, DESCRIPTION, COST, PREREQUISITE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (10, 'C? s? d? li?u nâng cao', 1195, NULL, USER, SYSDATE, USER, SYSDATE);

INSERT INTO COURSE (COURSENO, DESCRIPTION, COST, PREREQUISITE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (20, 'Gi?i thi?u Tin h?c', 1195, 10, USER, SYSDATE, USER, SYSDATE);

INSERT INTO COURSE (COURSENO, DESCRIPTION, COST, PREREQUISITE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (30, 'L?p trình Java', 2195, 20, USER, SYSDATE, USER, SYSDATE);

INSERT INTO COURSE (COURSENO, DESCRIPTION, COST, PREREQUISITE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (40, 'Thi?t k? C? s? d? li?u', 1595, NULL, USER, SYSDATE, USER, SYSDATE);

INSERT INTO COURSE (COURSENO, DESCRIPTION, COST, PREREQUISITE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (50, 'L?p trình PL/SQL', 2595, 40, USER, SYSDATE, USER, SYSDATE);

INSERT INTO INSTRUCTOR (INSTRUCTORID, SALUTATION, FIRSTNAME, LASTNAME, ADDRESS, PHONE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (100, 'Th?y.', 'Ph?m', 'Tr?ng Huynh', 'Qu?n 1, TP.HCM', '0901234567', USER, SYSDATE, USER, SYSDATE);

INSERT INTO INSTRUCTOR (INSTRUCTORID, SALUTATION, FIRSTNAME, LASTNAME, ADDRESS, PHONE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (200, 'Cô.', 'Nguy?n', 'Th? Lan', 'Qu?n 7, TP.HCM', '0912345678', USER, SYSDATE, USER, SYSDATE);

INSERT INTO INSTRUCTOR (INSTRUCTORID, SALUTATION, FIRSTNAME, LASTNAME, ADDRESS, PHONE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (300, 'Th?y.', 'Lê', 'V?n Nam', 'Bình Th?nh, TP.HCM', '0987654321', USER, SYSDATE, USER, SYSDATE);

INSERT INTO STUDENT (STUDENTID, SALUTATION, FIRSTNAME, LASTNAME, ADDRESS, PHONE, EMPLOYER, REGISTRATIONDATE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (101, 'Ch?.', 'Tr?n', 'Th? H??ng', 'Qu?n 1, TP.HCM', '0123456789', 'FPT Software', SYSDATE-100, USER, SYSDATE, USER, SYSDATE);

INSERT INTO STUDENT (STUDENTID, SALUTATION, FIRSTNAME, LASTNAME, ADDRESS, PHONE, EMPLOYER, REGISTRATIONDATE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (102, 'Anh.', 'Nguy?n', 'Ph??ng Thiên V?', 'Qu?n 7, TP.HCM', '0987654321', 'VNG Corporation', SYSDATE-90, USER, SYSDATE, USER, SYSDATE);

INSERT INTO STUDENT (STUDENTID, SALUTATION, FIRSTNAME, LASTNAME, ADDRESS, PHONE, EMPLOYER, REGISTRATIONDATE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (103, 'Ch?.', 'Lê', 'Th? Bích', 'Bình Th?nh, TP.HCM', '0912345678', NULL, SYSDATE-80, USER, SYSDATE, USER, SYSDATE);

INSERT INTO STUDENT (STUDENTID, SALUTATION, FIRSTNAME, LASTNAME, ADDRESS, PHONE, EMPLOYER, REGISTRATIONDATE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (104, 'Anh.', 'Ph?m', 'Minh Quân', 'Qu?n 3, TP.HCM', '0909876543', 'TMA Solutions', SYSDATE-70, USER, SYSDATE, USER, SYSDATE);

INSERT INTO STUDENT (STUDENTID, SALUTATION, FIRSTNAME, LASTNAME, ADDRESS, PHONE, EMPLOYER, REGISTRATIONDATE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (105, 'Ch?.', '??ng', 'Th? Ng?c', 'Th? ??c, TP.HCM', '0934567890', 'Viettel', SYSDATE-60, USER, SYSDATE, USER, SYSDATE);

INSERT INTO CLASS (CLASSID, COURSENO, CLASSNO, STARTDATETIME, LOCATION, INSTRUCTORID, CAPACITY, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (1001, 10, 1, TO_DATE('2026-05-10 08:00', 'YYYY-MM-DD HH24:MI'), 'Phòng A101', 100, 20, USER, SYSDATE, USER, SYSDATE);

INSERT INTO CLASS (CLASSID, COURSENO, CLASSNO, STARTDATETIME, LOCATION, INSTRUCTORID, CAPACITY, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (1002, 20, 1, TO_DATE('2026-05-15 13:00', 'YYYY-MM-DD HH24:MI'), 'Phòng B202', 200, 25, USER, SYSDATE, USER, SYSDATE);

INSERT INTO CLASS (CLASSID, COURSENO, CLASSNO, STARTDATETIME, LOCATION, INSTRUCTORID, CAPACITY, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (1003, 30, 1, TO_DATE('2026-06-01 09:00', 'YYYY-MM-DD HH24:MI'), 'Phòng A101', 100, 15, USER, SYSDATE, USER, SYSDATE);

INSERT INTO CLASS (CLASSID, COURSENO, CLASSNO, STARTDATETIME, LOCATION, INSTRUCTORID, CAPACITY, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (1004, 40, 1, TO_DATE('2026-06-10 14:00', 'YYYY-MM-DD HH24:MI'), 'Phòng C303', 300, 18, USER, SYSDATE, USER, SYSDATE);

INSERT INTO CLASS (CLASSID, COURSENO, CLASSNO, STARTDATETIME, LOCATION, INSTRUCTORID, CAPACITY, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (1005, 50, 1, TO_DATE('2026-06-20 08:00', 'YYYY-MM-DD HH24:MI'), 'Phòng B202', 200, 22, USER, SYSDATE, USER, SYSDATE);

INSERT INTO ENROLLMENT (STUDENTID, CLASSID, ENROLLDATE, FINALGRADE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (101, 1001, SYSDATE-50, 85, USER, SYSDATE, USER, SYSDATE);

INSERT INTO ENROLLMENT (STUDENTID, CLASSID, ENROLLDATE, FINALGRADE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (101, 1002, SYSDATE-40, 92, USER, SYSDATE, USER, SYSDATE);

INSERT INTO ENROLLMENT (STUDENTID, CLASSID, ENROLLDATE, FINALGRADE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (102, 1001, SYSDATE-45, 78, USER, SYSDATE, USER, SYSDATE);

INSERT INTO ENROLLMENT (STUDENTID, CLASSID, ENROLLDATE, FINALGRADE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (103, 1003, SYSDATE-30, NULL, USER, SYSDATE, USER, SYSDATE);

INSERT INTO ENROLLMENT (STUDENTID, CLASSID, ENROLLDATE, FINALGRADE, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (104, 1004, SYSDATE-25, 88, USER, SYSDATE, USER, SYSDATE);

INSERT INTO GRADE (STUDENTID, CLASSID, GRADE, COMMENTS, CREATEDBY, CREATEDDATE, MODIFIEDBY, MODIFIEDDATE)
VALUES (101, 1001, 85, 'H?c viên ch?m ch?, n?m bài r?t t?t', USER, SYSDATE, USER, SYSDATE);

COMMIT;


--Cau 1a
CREATE TABLE Cau1 (
ID NUMBER,
NAME VARCHAR2(20)
);

--Cau 1b
CREATE SEQUENCE Cau1Seq
START WITH 5
INCREMENT BY 5;

--Cau 1c-f
DECLARE
v_name VARCHAR2(50);
v_id NUMBER;
BEGIN
-- [d] Them sinh vien dang ki nhieu mon nhat
SELECT firstname || ' ' || lastname
INTO v_name
FROM student
WHERE studentid = (
SELECT studentid FROM enrollment
GROUP BY studentid
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM enrollment GROUP BY
studentid)
FETCH FIRST 1 ROWS ONLY
);

INSERT INTO Cau1 (ID, NAME)
VALUES (Cau1Seq.NEXTVAL, v_name);
SAVEPOINT sp_a; -- Savepoint A

-- [e] Them sinh vien dang ki it mon nhat
SELECT firstname || ' ' || lastname
INTO v_name
FROM student
WHERE studentid = (
SELECT studentid FROM enrollment
GROUP BY studentid
HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM enrollment GROUP BY
studentid)
FETCH FIRST 1 ROWS ONLY
);

INSERT INTO Cau1 (ID, NAME)
VALUES (Cau1Seq.NEXTVAL, v_name);
SAVEPOINT sp_b; -- Savepoint B

-- [f] Them giao vien day nhieu lop nhat
SELECT i.firstname || ' ' || i.lastname
INTO v_name
FROM instructor i
WHERE i.instructorid = (
SELECT instructorid FROM class
GROUP BY instructorid
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM class GROUP BY
instructorid)
FETCH FIRST 1 ROWS ONLY
);

INSERT INTO Cau1 (ID, NAME)
VALUES (Cau1Seq.NEXTVAL, v_name);
SAVEPOINT sp_c; -- Savepoint C

-- [g] SELECT INTO: lay ID cua giao vien vua them vao bien v_id
SELECT ID INTO v_id
FROM Cau1
WHERE NAME = v_name;

DBMS_OUTPUT.PUT_LINE('ID giao vien nhieu lop: ' || v_id);

-- [h] Rollback giao vien nhieu lop (ve Savepoint B)
ROLLBACK TO sp_b;

-- [i] Them giao vien it lop nhat, dung v_id da luu
SELECT i.firstname || ' ' || i.lastname
INTO v_name
FROM instructor i
WHERE i.instructorid = (
SELECT instructorid FROM class
GROUP BY instructorid
HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM class GROUP BY
instructorid)
FETCH FIRST 1 ROWS ONLY
);

INSERT INTO Cau1 (ID, NAME)
VALUES (v_id, v_name); -- Dung v_id (khong phai sequence)

-- [j] Them lai giao vien nhieu lop, dung sequence
SELECT i.firstname || ' ' || i.lastname
INTO v_name
FROM instructor i
WHERE i.instructorid = (
SELECT instructorid FROM class
GROUP BY instructorid
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM class GROUP BY
instructorid)
FETCH FIRST 1 ROWS ONLY
);

INSERT INTO Cau1 (ID, NAME)
VALUES (Cau1Seq.NEXTVAL, v_name); -- Dung sequence

COMMIT;
DBMS_OUTPUT.PUT_LINE('Hoan tat! Kiem tra: SELECT * FROM Cau1;');

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Loi: Khong tim thay du lieu!');
ROLLBACK;
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Loi: ' || SQLERRM);
ROLLBACK;
END;
/

--Cau 2
DECLARE
v_sid NUMBER := &ma_sinh_vien;
v_fname VARCHAR2(25) := '&ho_sinh_vien';
v_lname VARCHAR2(25) := '&ten_sinh_vien';
v_addr VARCHAR2(50) := '&dia_chi';
v_found VARCHAR2(50);
v_classes NUMBER;
BEGIN
-- Thu tim sinh vien theo ma vua nhap
SELECT firstname || ' ' || lastname
INTO v_found
FROM student
WHERE studentid = v_sid;

-- Neu tim thay: dem so lop dang hoc
SELECT COUNT(*)
INTO v_classes
FROM enrollment
WHERE studentid = v_sid;

DBMS_OUTPUT.PUT_LINE('Ho ten: ' || v_found);
DBMS_OUTPUT.PUT_LINE('So lop dang hoc: ' || v_classes);

EXCEPTION
WHEN NO_DATA_FOUND THEN
-- Sinh vien chua ton tai: them moi
DBMS_OUTPUT.PUT_LINE('Sinh vien chua ton tai. Dang them moi...');
INSERT INTO student (studentid, firstname, lastname, address,
registrationdate, createdby, createddate,
modifiedby, modifieddate)
VALUES (v_sid, v_fname, v_lname, v_addr,
SYSDATE, USER, SYSDATE, USER, SYSDATE);
COMMIT;
DBMS_OUTPUT.PUT_LINE('Da them sinh vien moi: ' || v_fname || ' ' ||
v_lname);
END;
/

--Bai 2
--Cau 1
DECLARE
v_instructor_id NUMBER := &ma_giao_vien;
v_so_lop NUMBER;
BEGIN
-- Dem so lop giao vien dang day
SELECT COUNT(*)
INTO v_so_lop
FROM class
WHERE instructorid = v_instructor_id;

-- Phan nhanh theo ket qua
IF v_so_lop >= 5 THEN
DBMS_OUTPUT.PUT_LINE('Giao vien nay nen nghi ngoi!');
ELSE
DBMS_OUTPUT.PUT_LINE('So lop giao vien dang day: ' || v_so_lop);
END IF;

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Khong tim thay giao vien co ma: ' ||
v_instructor_id);
END;
/

--Cau 2
SET SERVEROUTPUT ON;

DECLARE
v_sid NUMBER := &ma_sinh_vien;
v_cid NUMBER := &ma_lop;
v_score NUMBER;
v_grade VARCHAR2(2);
v_check NUMBER;
BEGIN
-- Kiem tra sinh vien ton tai
SELECT COUNT(*) INTO v_check
FROM student WHERE studentid = v_sid;
IF v_check = 0 THEN
DBMS_OUTPUT.PUT_LINE('Loi: Ma sinh vien ' || v_sid || ' khong ton tai!');
RETURN;
END IF;

-- Kiem tra lop ton tai
SELECT COUNT(*) INTO v_check
FROM class WHERE classid = v_cid;
IF v_check = 0 THEN
DBMS_OUTPUT.PUT_LINE('Loi: Ma lop ' || v_cid || ' khong ton tai!');
RETURN;
END IF;

-- Lay diem cua sinh vien trong lop
SELECT finalgrade
INTO v_score
FROM enrollment
WHERE studentid = v_sid AND classid = v_cid;

-- Quy doi diem so sang diem chu bang CASE
CASE
WHEN v_score >= 90 THEN v_grade := 'A';
WHEN v_score >= 80 THEN v_grade := 'B';
WHEN v_score >= 70 THEN v_grade := 'C';
WHEN v_score >= 50 THEN v_grade := 'D';
ELSE v_grade := 'F';
END CASE;

DBMS_OUTPUT.PUT_LINE('Diem so: ' || v_score || ' -> Diem chu: ' || v_grade);

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Sinh vien chua dang ky lop nay hoac chua co diem!');
END;
/

--Bai 3
DECLARE
-- Cursor 1: Duyet tung mon hoc
CURSOR cur_course IS
SELECT courseno, description
FROM course
ORDER BY courseno;
-- Cursor 2: Lay lop hoc cua mot mon (co doi so)
CURSOR cur_class (p_courseno NUMBER) IS
SELECT c.classno, COUNT(e.studentid) AS so_sv
FROM class c
LEFT JOIN enrollment e ON c.classid = e.classid
WHERE c.courseno = p_courseno
GROUP BY c.classno
ORDER BY c.classno;
v_courseno course.courseno%TYPE;
v_desc course.description%TYPE;
v_classno class.classno%TYPE;
v_count NUMBER;
BEGIN
-- Duyet cursor ngoai: tung mon hoc
OPEN cur_course;
LOOP
FETCH cur_course INTO v_courseno, v_desc;
EXIT WHEN cur_course%NOTFOUND;
-- In ten mon hoc
DBMS_OUTPUT.PUT_LINE(v_courseno || ' ' || v_desc);
-- Mo cursor trong voi doi so la ma mon hoc hien tai
OPEN cur_class(v_courseno);
LOOP
FETCH cur_class INTO v_classno, v_count;
EXIT WHEN cur_class%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Lop: ' || v_classno || ' co so luong sinh vien dang ki: ' || v_count);
END LOOP;
CLOSE cur_class;
END LOOP;
CLOSE cur_course;
EXCEPTION
WHEN OTHERS THEN
IF cur_course%ISOPEN THEN CLOSE cur_course; END IF;
IF cur_class%ISOPEN THEN CLOSE cur_class; END IF;
DBMS_OUTPUT.PUT_LINE('Loi: ' || SQLERRM);
END;
/

--Bai 4
--Cau 1a
CREATE OR REPLACE PROCEDURE find_sname
(i_student_id IN student.studentid%TYPE,
o_first_name OUT student.firstname%TYPE,
o_last_name OUT student.lastname%TYPE)
IS
BEGIN
SELECT firstname, lastname
INTO o_first_name, o_last_name
FROM student
WHERE studentid = i_student_id;

EXCEPTION
WHEN NO_DATA_FOUND THEN
o_first_name := NULL;
o_last_name := NULL;
DBMS_OUTPUT.PUT_LINE('Khong tim thay sinh vien ID: ' ||
i_student_id);
END find_sname;
/

--Cau 1b
CREATE OR REPLACE PROCEDURE print_student_name
(i_student_id IN student.studentid%TYPE)
IS
v_first student.firstname%TYPE;
v_last student.lastname%TYPE;
BEGIN
-- Goi thu tuc find_sname da co san
find_sname(i_student_id, v_first, v_last);

IF v_first IS NOT NULL OR v_last IS NOT NULL THEN
DBMS_OUTPUT.PUT_LINE('Ho ten sinh vien: ' || v_first || ' ' ||
v_last);
END IF;
END print_student_name;
/

-- Goi thu tuc de kiem tra:
BEGIN
print_student_name(101);
END;
/

--Cau 2
CREATE OR REPLACE PROCEDURE Discount
IS
BEGIN
FOR rec IN (
SELECT c.courseno, c.description, c.cost
FROM course c
WHERE (SELECT COUNT(*) FROM enrollment e
JOIN class cl ON e.classid = cl.classid
WHERE cl.courseno = c.courseno) > 15

) LOOP
-- Giam gia 5%
UPDATE course
SET cost = cost * 0.95
WHERE courseno = rec.courseno;

DBMS_OUTPUT.PUT_LINE('Da giam gia mon hoc: ' || rec.description

|| ' | Gia cu: ' || rec.cost
|| ' | Gia moi: ' || ROUND(rec.cost * 0.95, 2));

END LOOP;

COMMIT;
DBMS_OUTPUT.PUT_LINE('Hoan tat giam gia.');
EXCEPTION
WHEN OTHERS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('Loi: ' || SQLERRM);
END Discount;
/

-- Goi thu tuc:
BEGIN Discount; END;
/

--Cau 3
CREATE OR REPLACE FUNCTION Total_cost_for_student
(p_student_id IN student.studentid%TYPE)
RETURN NUMBER
IS
v_total NUMBER;
v_check NUMBER;
BEGIN
-- Kiem tra sinh vien co ton tai khong
SELECT COUNT(*) INTO v_check
FROM student WHERE studentid = p_student_id;

IF v_check = 0 THEN
RETURN NULL; -- Sinh vien khong ton tai
END IF;

-- Tinh tong chi phi: sum(cost cua tung mon da dang ky)
SELECT NVL(SUM(co.cost), 0)
INTO v_total
FROM enrollment e
JOIN class cl ON e.classid = cl.classid
JOIN course co ON cl.courseno = co.courseno
WHERE e.studentid = p_student_id;

RETURN v_total;

EXCEPTION
WHEN OTHERS THEN
RETURN NULL;
END Total_cost_for_student;
/

-- Goi ham de kiem tra:
SELECT Total_cost_for_student(101) AS "Tong chi phi" FROM DUAL;

-- Hoac trong PL/SQL:
BEGIN
DBMS_OUTPUT.PUT_LINE('Tong chi phi: ' || Total_cost_for_student(101));
END;
/

--Bai 5
--Cau 1
CREATE OR REPLACE TRIGGER trg_course_audit
BEFORE INSERT OR UPDATE ON COURSE
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREATEDBY   := USER;
:NEW.CREATEDDATE := SYSDATE;
END IF;
-- Luon cap nhat modified (ca khi INSERT lan UPDATE)
:NEW.MODIFIEDBY   := USER;
:NEW.MODIFIEDDATE := SYSDATE;
END trg_course_audit;
/

CREATE OR REPLACE TRIGGER trg_class_audit
BEFORE INSERT OR UPDATE ON CLASS
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREATEDBY   := USER;
:NEW.CREATEDDATE := SYSDATE;
END IF;
    
:NEW.MODIFIEDBY   := USER;
:NEW.MODIFIEDDATE := SYSDATE;
END trg_class_audit;
/

-- STUDENT
CREATE OR REPLACE TRIGGER trg_student_audit
BEFORE INSERT OR UPDATE ON STUDENT 
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREATEDBY   := USER;
:NEW.CREATEDDATE := SYSDATE;
END IF;
    
:NEW.MODIFIEDBY   := USER;
:NEW.MODIFIEDDATE := SYSDATE;
END trg_student_audit;
/

-- ENROLLMENT
CREATE OR REPLACE TRIGGER trg_enrollment_audit
BEFORE INSERT OR UPDATE ON enrollment 
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREATEDBY   := USER;
:NEW.CREATEDDATE := SYSDATE;
END IF;
    
:NEW.MODIFIEDBY   := USER;
:NEW.MODIFIEDDATE := SYSDATE;
END trg_student_audit;
/

-- INSTRUCTOR
CREATE OR REPLACE TRIGGER trg_instructor_audit
BEFORE INSERT OR UPDATE ON instructor 
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREATEDBY   := USER;
:NEW.CREATEDDATE := SYSDATE;
END IF;
    
:NEW.MODIFIEDBY   := USER;
:NEW.MODIFIEDDATE := SYSDATE;
END trg_student_audit;
/

-- GRADE
CREATE OR REPLACE TRIGGER trg_grade_audit
BEFORE INSERT OR UPDATE ON grade 
FOR EACH ROW
BEGIN
IF INSERTING THEN
:NEW.CREATEDBY   := USER;
:NEW.CREATEDDATE := SYSDATE;
END IF;
    
:NEW.MODIFIEDBY   := USER;
:NEW.MODIFIEDDATE := SYSDATE;
END trg_student_audit;
/

--Cau 2
CREATE OR REPLACE TRIGGER trg_max_enrollment
BEFORE INSERT ON enrollment
FOR EACH ROW
DECLARE
v_so_lop NUMBER;
BEGIN
-- Dem so lop sinh vien nay dang dang ky
SELECT COUNT(*)
INTO v_so_lop
FROM enrollment
WHERE studentid = :NEW.studentid;

-- Neu da co 3 lop tro len thi tu choi
IF v_so_lop >= 3 THEN
RAISE_APPLICATION_ERROR(
-20001,
'Sinh vien ' || :NEW.studentid ||
' da dang ky du 3 lop! Khong the dang ky them.'
);
END IF;
END trg_max_enrollment;
/

-- Kiem tra trigger:
-- Gia su sinh vien 101 da co 3 lop, thu them lop thu 4:
INSERT INTO enrollment (studentid, classid, enrolldate, createdby, createddate, modifiedby, modifieddate)
VALUES (101, 1004, SYSDATE, USER, SYSDATE, USER, SYSDATE);
-- -> Oracle se bao loi ORA-20001