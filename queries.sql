
--Queries — Reading and Filtering

SELECT student_name,student_email,completion_percentage from enrollments where course_id=1

SELECT * FROM enrollments where completion_percentage <10

SELECT * from enrollments where instructor IS NULL

SELECT * FROM enrollments WHERE passed=false ORDER BY completion_percentage  desc LIMIT 5

SELECT * FROM enrollments WHERE  EXTRACT(YEAR FROM enrollment_date) = EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '1 year') ORDER BY enrollment_date DESC

--Queries — Data Corrections

INSERT INTO enrollments (id, student_id, student_name, student_email, course_id, course_title, category, enrollment_date, completion_percentage, passed, monthly_fee_paid, instructor) VALUES
(18, 3,'Lucia Fernandes','lucia.fernandes@student.edutrack.com', 5, 'Advanced Python','Programming','2025-04-01', 0, false, 69.99,'Carlos Vega')
ON CONFLICT (id) 
DO NOTHING

Select * from enrollments where id=18

UPDATE enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL;

SELECT * from enrollments where instructor ='Pending assignment'

SELECT * FROM enrollments where student_email ILIKE '%@test.com'

DELETE FROM enrollments where student_email ILIKE '%@test.com'

SELECT * FROM enrollments where student_email ILIKE '%@test.com'

--Queries — Aggregation and Reporting

SELECT COUNT(*) ,Category FROM enrollments GROUP By category

SELECT 
  course_title, 
  ROUND(AVG(completion_percentage), 2) AS average_completion
FROM enrollments
GROUP BY course_title;

SELECT 
  course_title, 
  COUNT(STUDENT_id) AS total_enrollments
FROM enrollments 
GROUP BY course_title
HAVING COUNT(STUDENT_id) > 3;

SELECT 
  category, 
  SUM(monthly_fee_paid) AS total_revenue
FROM enrollments  
GROUP BY category
ORDER BY total_revenue DESC;

