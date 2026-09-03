# QUERIES — READING AND FILTERING



## Enrollments in 'Intro to Python'

| student_name | student_email                     | completion_percentage |
| ------------ | --------------------------------- | --------------------- |
| Emily Watson | emily.watson@student.edutrack.com | 85                    |
| Klaus Weber  | klaus.weber@student.edutrack.com  | 92                    |
| Marco Rossi  | marco.rossi@student.edutrack.com  | 88                    |
| Priya Sharma | priya.sharma@student.edutrack.com | 55                    |




## Enrollments where completion percentage <10 -- Drop outs


| id | student_id | student_name    | student_email                        | course_id | course_title          | category    | enrollment_date | completion_percentage | passed | monthly_fee_paid | instructor         |
| -- | ---------- | --------------- | ------------------------------------ | --------- | --------------------- | ----------- | --------------- | --------------------- | ------ | ---------------- | ------------------ |
| 5  | 3          | Lucia Fernandes | lucia.fernandes@student.edutrack.com | 2         | Web Design Basics     | Design      | 2024-06-20      | 5                     | false  | 39.99            | Carlos Vega        |
| 6  | 3          | Lucia Fernandes | lucia.fernandes@student.edutrack.com | 4         | Digital Marketing 101 | Marketing   | 2024-07-01      | 3                     | false  | 29.99            | Lucia Prades       |
| 18 | 3          | Lucia Fernandes | lucia.fernandes@student.edutrack.com | 5         | Advanced Python       | Programming | 2025-04-01      | 0                     | false  | 69.99            | Carlos Vega        |
| 10 | 5          | Yuki Nakamura   | yuki.nakamura@student.edutrack.com   | 6         | UI/UX Fundamentals    | Design      | 2024-10-11      | 0                     | false  | 44.99            | Pending assignment |
| 11 | 6          | Pierre Dubois   | pierre.dubois@student.edutrack.com   | 6         | UI/UX Fundamentals    | Design      | 2024-11-05      | 0                     | false  | 44.99            | Pending assignment |


## Finding enrollments where instructor field is NULL

SELECT * from enrollments where instructor IS NULL
-- As these fileds are updated at the later stage no rows are returning.

## List 5 students with highest completion percentage

| id | student_id | student_name  | student_email                      | course_id | course_title           | category    | enrollment_date | completion_percentage | passed | monthly_fee_paid | instructor  |
| -- | ---------- | ------------- | ---------------------------------- | --------- | ---------------------- | ----------- | --------------- | --------------------- | ------ | ---------------- | ----------- |
| 2  | 1          | Emily Watson  | emily.watson@student.edutrack.com  | 2         | Web Design Basics      | Design      | 2024-04-15      | 60                    | false  | 39.99            | Carlos Vega |
| 15 | 7          | Priya Sharma  | priya.sharma@student.edutrack.com  | 1         | Intro to Python        | Programming | 2025-01-10      | 55                    | false  | 49.99            | Marta López |
| 9  | 5          | Yuki Nakamura | yuki.nakamura@student.edutrack.com | 3         | Data Analysis with SQL | Data        | 2024-09-03      | 45                    | false  | 59.99            | Marta López |
| 17 | 1          | Emily Watson  | emily.watson@student.edutrack.com  | 5         | Advanced Python        | Programming | 2025-03-05      | 40                    | false  | 69.99            | Carlos Vega |
| 16 | 6          | Pierre Dubois | pierre.dubois@student.edutrack.com | 3         | Data Analysis with SQL | Data        | 2025-02-20      | 20                    | false  | 59.99            | Marta López |

## Enrollments created last year order by descending

| id | student_id | student_name    | student_email                        | course_id | course_title           | category    | enrollment_date | completion_percentage | passed | monthly_fee_paid | instructor  |
| -- | ---------- | --------------- | ------------------------------------ | --------- | ---------------------- | ----------- | --------------- | --------------------- | ------ | ---------------- | ----------- |
| 18 | 3          | Lucia Fernandes | lucia.fernandes@student.edutrack.com | 5         | Advanced Python        | Programming | 2025-04-01      | 0                     | false  | 69.99            | Carlos Vega |
| 17 | 1          | Emily Watson    | emily.watson@student.edutrack.com    | 5         | Advanced Python        | Programming | 2025-03-05      | 40                    | false  | 69.99            | Carlos Vega |
| 16 | 6          | Pierre Dubois   | pierre.dubois@student.edutrack.com   | 3         | Data Analysis with SQL | Data        | 2025-02-20      | 20                    | false  | 59.99            | Marta López |
| 15 | 7          | Priya Sharma    | priya.sharma@student.edutrack.com    | 1         | Intro to Python        | Programming | 2025-01-10      | 55                    | false  | 49.99            | Marta López |


# QUERIES — DATA CORRECTIONS


## Inserted missing enrollment record with id 18
INSERT INTO enrollments (id, student_id, student_name, student_email, course_id, course_title, category, enrollment_date, completion_percentage, passed, monthly_fee_paid, instructor) VALUES
(18, 3,'Lucia Fernandes','lucia.fernandes@student.edutrack.com', 5, 'Advanced Python','Programming','2025-04-01', 0, false, 69.99,'Carlos Vega')

| id | student_id | student_name    | student_email                        | course_id | course_title    | category    | enrollment_date | completion_percentage | passed | monthly_fee_paid | instructor  |
| -- | ---------- | --------------- | ------------------------------------ | --------- | --------------- | ----------- | --------------- | --------------------- | ------ | ---------------- | ----------- |
| 18 | 3          | Lucia Fernandes | lucia.fernandes@student.edutrack.com | 5         | Advanced Python | Programming | 2025-04-01      | 0                     | false  | 69.99            | Carlos Vega |

## Updated records with NULL value as instructor with "Pending assignment"

| id | student_id | student_name  | student_email                      | course_id | course_title       | category | enrollment_date | completion_percentage | passed | monthly_fee_paid | instructor         |
| -- | ---------- | ------------- | ---------------------------------- | --------- | ------------------ | -------- | --------------- | --------------------- | ------ | ---------------- | ------------------ |
| 10 | 5          | Yuki Nakamura | yuki.nakamura@student.edutrack.com | 6         | UI/UX Fundamentals | Design   | 2024-10-11      | 0                     | false  | 44.99            | Pending assignment |
| 11 | 6          | Pierre Dubois | pierre.dubois@student.edutrack.com | 6         | UI/UX Fundamentals | Design   | 2024-11-05      | 0                     | false  | 44.99            | Pending assignment |

## Deleted test records with @test.com

DELETE FROM enrollments where student_email ILIKE '%@test.com'



# QUERIES — AGGREGATION AND REPORTING



## Number of enrollments group by category

| count | category    |
| ----- | ----------- |
| 2     | Marketing   |
| 7     | Programming |
| 4     | Design      |
| 3     | Data        |

## Calculate the average completion_percentage group by course_title

| course_title           | average_completion |
| ---------------------- | ------------------ |
| Data Analysis with SQL | 47.67              |
| Web Design Basics      | 32.50              |
| Digital Marketing 101  | 36.50              |
| Advanced Python        | 45.00              |
| UI/UX Fundamentals     | 0.00               |
| Intro to Python        | 80.00              |

## Courses with more than 3 enrollments

| course_title    | total_enrollments |
| --------------- | ----------------- |
| Intro to Python | 4                 |


## Calculate the revenue SUM of monthly_fee_Paid group by category

| category    | total_revenue |
| ----------- | ------------- |
| Programming | 409.93        |
| Data        | 179.97        |
| Design      | 169.96        |
| Marketing   | 59.98         |