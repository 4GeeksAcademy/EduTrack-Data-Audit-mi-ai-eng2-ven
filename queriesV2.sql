
--Queries — INNER JOIN
--List every enrollment showing the student's full name, the course title, and their completion percentage

SELECT S.name,C.title,E.completion_percentage from students S 
INNER JOIN enrollments E ON S.id=E.student_id
INNER JOIN courses C ON C.id=E.course_id

--Show the name and email of students who have passed at least one course, along with the title of the course they passed
SELECT 
    S.name, 
    S.email, 
    C.title AS course_title
    ,E.passed
FROM students S 
INNER JOIN enrollments E ON S.id = E.student_id
INNER JOIN courses C ON C.id = E.course_id
WHERE E.passed = true;


--Calculate the average completion percentage per instructor, ordered from highest to lowest
SELECT 
    C.instructor_name, 
    ROUND(AVG(E.completion_percentage)) AS average_percent 
FROM courses C 
INNER JOIN enrollments E ON C.id = E.course_id 
GROUP BY C.instructor_name
ORDER BY average_percent DESC;


--Queries — LEFT JOIN (detecting missing data)

--Find all students who have no enrollments - they registered on the platform but never signed up for a course
SELECT S.name 
FROM students S 
LEFT JOIN enrollments E ON S.id = E.student_id 
WHERE E.student_id IS NULL;

--Find all courses that have no enrollments - they exist in the catalog but no one has signed up
SELECT title from courses C
LEFT JOIN
enrollments E
ON
E.course_id=C.id
where E.course_id is NULL


--Queries — Aggregation across tables
SELECT * FROM students LIMIT 10;
SELECT student_ID  FROM enrollments order by student_id
SELECT * FROM courses LIMIT 5;

--Count how many courses each student is enrolled in; show only students enrolled in more than one course
SELECT 
    S.id,
    S.name, 
    COUNT(E.course_id) AS enrolled_courses_count
FROM students S
INNER JOIN enrollments E ON S.id = E.student_id
GROUP BY S.id, S.name
HAVING COUNT(E.course_id) > 1
ORDER BY enrolled_courses_count DESC;


--Calculate total revenue per category using the course price from the courses table (monthly_fee ), not the historical payment in enrollments
SELECT 
    C.category,
    SUM(C.monthly_fee) AS total_revenue
FROM courses C
INNER JOIN enrollments E ON C.id = E.course_id
GROUP BY C.category
ORDER BY total_revenue DESC;

--Show each instructor alongside the number of students currently enrolled in their courses. 

SELECT 
    C.instructor_name,
    COUNT(E.student_id) AS total_students_enrolled
FROM courses C
INNER JOIN enrollments E ON C.id = E.course_id
GROUP BY C.instructor_name
ORDER BY total_students_enrolled DESC;

--Queries — Data integrity
--Check for enrollments where the student_id does not match any existing student (orphaned records)

SELECT 
    E.id AS enrollment_id,
    E.student_id AS orphaned_student_id,
    E.course_id
FROM enrollments E
LEFT JOIN students S ON E.student_id = S.id
WHERE S.id IS NULL;
-- Check for enrollments where the course_id does not match any existing course (orphaned records)

SELECT 
    E.id AS enrollment_id,
    E.student_id,
    E.course_id AS orphaned_course_id
FROM enrollments E
LEFT JOIN courses C ON E.course_id = C.id
WHERE C.id IS NULL;