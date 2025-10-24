CREATE TABLE departments (
    departmen_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    );
CREATE TABLE professors (
    professor_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    department_id INT REFERENCES departments(department_id)
    );
CREATE TABLE faculty (
    faculty_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    department_id REFERENCES departments(department_id)
    );
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    faculty_id INT REFERENCES faculty(faculty_id),
   professor_id INT REFERENCES professors(professor_id)
    );
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    faculty_id INT REFERENCES faculty(faculty_id)
    );
CREATE TABLE enrolments (
    enrolment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id),
    enrollmentDate DATE DEFAULT CURRENT_DATE
    );
INSERT INTO departments (name)
VALUES ('Computer Scinece and Engineering Department');
INSERT INTO professors (name, email, department_id)
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
INSERT INTO courses (name, faculty_id, professor_id)
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
INSERT INTO students (name, surname, email, faculty_id)
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
INSERT INTO enrolments (student_id, course_id)
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


-- SELECT s.id, s.name, c.name, e.enrollmentDate
-- FROM students s
-- JOIN enrolments e ON s.student_id = e.student_id
-- JOIN courses c ON e.course_id = c.course_id;

-- SELECT s.student_id, s.name, c.name, e.enrollmentDate
-- FROM students s
-- JOIN enrolments e ON s.student_id = e.student_id
-- JOIN courses c ON e.course_id = c.course_id
-- WHERE name='Operating Systems';

-- SELECT p.professor_id,p.name,c.name
-- From professors p
-- JOIN courses c ON p.professor_id=c.course_id;

-- SELECT c.name AS "Course Name",COUNT(e.student_id) AS "Number of Students"
-- FROM courses c
-- LEFT JOIN enrolments e ON c.course_id = e.course_id
-- GROUP BY c.name
-- ORDER BY "Number of Students" DESC;



