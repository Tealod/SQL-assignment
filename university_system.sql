CREATE TABLE departments (
    Did SERIAL PRIMARY KEY,
    DName TEXT NOT NULL
    );
CREATE TABLE professors (
    Pid SERIAL PRIMARY KEY,
    PName TEXT NOT NULL,
    PEmail TEXT NOT NULL UNIQUE,
    Did INT REFERENCES departments(Did)
    );
CREATE TABLE faculty (
    FId SERIAL PRIMARY KEY,
    FName TEXT NOT NULL,
    Did INT REFERENCES departments(Did)
    );
CREATE TABLE courses (
    CId SERIAL PRIMARY KEY,
    CName TEXT NOT NULL,
    FId INT REFERENCES faculty(FId),
    PId INT REFERENCES professors(PId)
    );
CREATE TABLE students (
    SId SERIAL PRIMARY KEY,
    SName TEXT NOT NULL,
    SSurname TEXT NOT NULL,
    SEmail TEXT NOT NULL UNIQUE,
    FId INT REFERENCES faculty(FId)
    );
CREATE TABLE enrolments (
    EId SERIAL PRIMARY KEY,
    SId INT REFERENCES students(SId),
    CId INT REFERENCES courses(CId),
    EnrollmentDate DATE DEFAULT CURRENT_DATE
    );
INSERT INTO departments (DName)
VALUES ('Computer Scinece and Engineering Department');
INSERT INTO professors (PName, PEmail, Did)
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
INSERT INTO faculty (FName, Did)
VALUES
('Computer Engineering', 1),
('Software Engineering', 1);
INSERT INTO courses (CName, FId, PId)
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
INSERT INTO students (SName, SSurname, SEmail, FId)
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
INSERT INTO enrolments (SId, CId)
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


-- SELECT s.SId, s.SName, c.CName, e.EnrollmentDate
-- FROM students s
-- JOIN enrolments e ON s.SId = e.SId
-- JOIN courses c ON e.CId = c.CId;

-- SELECT s.SId, s.SName, c.CName, e.EnrollmentDate
-- FROM students s
-- JOIN enrolments e ON s.SId = e.SId
-- JOIN courses c ON e.CId = c.CId
-- WHERE CName='Operating Systems';

-- SELECT p.PId,p.PName,c.CName
-- From professors p
-- JOIN courses c ON p.PId=c.CId;

-- SELECT c.CName AS "Course Name",COUNT(e.SId) AS "Number of Students"
-- FROM courses c
-- LEFT JOIN enrolments e ON c.CId = e.CId
-- GROUP BY c.CName
-- ORDER BY "Number of Students" DESC;


