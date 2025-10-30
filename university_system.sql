CREATE TABLE department (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE professor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE faculty (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE course (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    faculty_id INT NOT NULL,
    professor_id INT NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculty(id),
    FOREIGN KEY (professor_id) REFERENCES professor(id)
);

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    faculty_id INT NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculty(id)
);

CREATE TABLE enrollment (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

INSERT INTO department (name)
VALUES ('Computer Science and Engineering Department');

INSERT INTO professor (name, email, department_id)
VALUES
('Ali Karimov', 'ali.karimov@univ.uz', 1),
('Dilorom Sodiqova', 'dilorom.sodiqova@univ.uz', 1),
('Javohir Mamatov', 'javohir.mamatov@univ.uz', 1),
('Nodira Shukurova', 'nodira.shukurova@univ.uz', 1),
('Islom Tursunov', 'islom.tursunov@univ.uz', 1),
('Madina Eshonova', 'madina.eshonova@univ.uz', 1),
('Abdulaziz Rustamov', 'abdulaziz.rustamov@univ.uz', 1),
('Gulnora Xamidova', 'gulnora.xamidova@univ.uz', 1),
('Oybek Raxmonov', 'oybek.raxmonov@univ.uz', 1),
('Sardor To‘xtayev', 'sardor.toxtayev@univ.uz', 1);

INSERT INTO faculty (name, department_id)
VALUES
('Computer Engineering', 1),
('Software Engineering', 1);

INSERT INTO course (name, faculty_id, professor_id)
VALUES
('Programming Fundamentals', 1, 1),
('Database Systems', 1, 2),
('Computer Networks', 1, 3),
('Operating Systems', 1, 4),
('Data Structures', 1, 5),
('Web Development', 2, 6),
('Mobile App Development', 2, 7),
('Artificial Intelligence', 2, 8),
('Machine Learning', 2, 9),
('Software Project Management', 2, 10),
('Cybersecurity Basics', 1, 2),
('Cloud Computing', 1, 3);

INSERT INTO student (name, surname, email, faculty_id)
VALUES
('Abbos', 'Odilov', 'abbos.odilov@univ.uz', 1),
('Komiljon', 'Temurbekov', 'komiljon.temurbekov@univ.uz', 2),
('Dilnoza', 'Yuldasheva', 'dilnoza.yuldasheva@univ.uz', 1),
('Umid', 'Karimov', 'umid.karimov@univ.uz', 2),
('Shahnoza', 'Rustamova', 'shahnoza.rustamova@univ.uz', 1),
('Baxtiyor', 'Tursunov', 'baxtiyor.tursunov@univ.uz', 2),
('Zarnigor', 'Xamidova', 'zarnigor.xamidova@univ.uz', 1),
('Jasurbek', 'Raxmonov', 'jasurbek.raxmonov@univ.uz', 2),
('Gulruh', 'Qodirova', 'gulruh.qodirova@univ.uz', 1),
('Diyor', 'Mamatov', 'diyor.mamatov@univ.uz', 2),
('Sarvinoz', 'Eshonova', 'sarvinoz.eshonova@univ.uz', 1),
('Azizbek', 'To‘xtayev', 'azizbek.toxtayev@univ.uz', 2),
('Malika', 'Abdurahmonova', 'malika.abdurahmonova@univ.uz', 1),
('Sirojiddin', 'Yo‘ldoshev', 'sirojiddin.yoldoshev@univ.uz', 2),
('Asal', 'Karimova', 'asal.karimova@univ.uz', 1);

INSERT INTO enrolment (student_id, course_id)
VALUES
(1, 1),
(1, 2),
(1, 3),   
(2, 2),
(2, 4),
(2, 5),   
(3, 1),
(3, 6),
(3, 7),
(4, 8),
(5, 3),
(6, 4),
(7, 5),
(8, 6),
(9, 7),
(10, 8),
(11, 9),
(12, 10),
(13, 11),
(14, 12);
-- Output: Student Name ,ID and course name and enrolment date ;
-- Working: via FK we are joined it using  JOIN On(Inner join)
-- Aliases: Student :s, Course :c, enrolment:e;
SELECT s.id,s.name AS student_name,c.name AS course_name,e.enrollmentDate
FROM student s
JOIN enrolment e ON s.id = e.student_id
JOIN course c ON e.course_id = c.id;


--Output: Student Name ,ID and Operating Systems  and enrolment date
-- Working: via FK we are joined it using  JOIN On(Inner join)
-- Aliases: Student :s, Course :c, enrolment:e;
SELECT  s.id,s.name AS student_name,c.name AS course_name,e.enrollmentDate
FROM student s
JOIN enrolment e ON s.id = e.student_id
JOIN course c ON e.course_id = c.id
WHERE c.name = 'Operating Systems';

-- AS why we need it uses for naming table; 
--OUTPUT: Professor name ID TEACHING COURSE NAME;
SELECT p.id,p.name AS professor_name,c.name AS course_name
FROM professor p
JOIN course c ON p.id = c.id;

--output:cOURSE NAME  AND NUMBER OF STUDENTS WHO ENROLED 
SELECT c.name AS "Course Name",COUNT(e.student_id) AS "Number of Students"
FROM course c
LEFT JOIN enrolment e ON c.id = e.course_id --WHY LEFT JOIN WE NEED INFO ABOUT ONLY COURSE NOT STUDENTS
GROUP BY c.name
ORDER BY "Number of Students" DESC;










