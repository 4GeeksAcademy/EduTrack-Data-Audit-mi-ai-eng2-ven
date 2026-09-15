
--List every enrollment showing the student's full name, the course title, and their completion percentage

| name            | title                  | completion_percentage |
| --------------- | ---------------------- | --------------------- |
| Emily Watson    | Intro to Python        | 85                    |
| Emily Watson    | Web Design Basics      | 60                    |
| Klaus Weber     | Intro to Python        | 92                    |
| Klaus Weber     | Data Analysis with SQL | 78                    |
| Lucia Fernandes | Web Design Basics      | 5                     |
| Lucia Fernandes | Digital Marketing 101  | 3                     |
| Marco Rossi     | Advanced Python        | 95                    |
| Marco Rossi     | Intro to Python        | 88                    |
| Yuki Nakamura   | Data Analysis with SQL | 45                    |
| Yuki Nakamura   | UI/UX Fundamentals     | 0                     |
| Pierre Dubois   | UI/UX Fundamentals     | 0                     |
| Priya Sharma    | Digital Marketing 101  | 70                    |
| Priya Sharma    | Intro to Python        | 55                    |
| Pierre Dubois   | Data Analysis with SQL | 20                    |
| Emily Watson    | Advanced Python        | 40                    |
| Lucia Fernandes | Advanced Python        | 0                     |

--Show the name and email of students who have passed at least one course, along with the title of the course they passed

| name         | email                             | course_title           | passed |
| ------------ | --------------------------------- | ---------------------- | ------ |
| Emily Watson | emily.watson@student.edutrack.com | Intro to Python        | true   |
| Klaus Weber  | klaus.weber@student.edutrack.com  | Intro to Python        | true   |
| Klaus Weber  | klaus.weber@student.edutrack.com  | Data Analysis with SQL | true   |
| Marco Rossi  | marco.rossi@student.edutrack.com  | Advanced Python        | true   |
| Marco Rossi  | marco.rossi@student.edutrack.com  | Intro to Python        | true   |
| Priya Sharma | priya.sharma@student.edutrack.com | Digital Marketing 101  | true   |

--Calculate the average completion percentage per instructor, ordered from highest to lowest
| instructor_name    | average_percent |
| ------------------ | --------------- |
| Marta López        | 66              |
| Carlos Vega        | 40              |
| Lucia Prades       | 37              |
| Pending assignment | 0               |

--Find all students who have no enrollments - they registered on the platform but never signed up for a course
| name          |
| ------------- |
| Giulia Romano |

--Find all courses that have no enrollments - they exist in the catalog but no one has signed up
| title           |
| --------------- |
| Email Campaigns |

--Count how many courses each student is enrolled in; show only students enrolled in more than one course
| id | name            | enrolled_courses_count |
| -- | --------------- | ---------------------- |
| 3  | Lucia Fernandes | 3                      |
| 1  | Emily Watson    | 3                      |
| 4  | Marco Rossi     | 2                      |
| 2  | Klaus Weber     | 2                      |
| 7  | Priya Sharma    | 2                      |
| 6  | Pierre Dubois   | 2                      |
| 5  | Yuki Nakamura   | 2                      |

--Calculate total revenue per category using the course price from the courses table (monthly_fee ), not the historical payment in enrollments

| category    | total_revenue |
| ----------- | ------------- |
| Programming | 409.93        |
| Data        | 179.97        |
| Design      | 169.96        |
| Marketing   | 59.98         |


--Show each instructor alongside the number of students currently enrolled in their courses. 
| instructor_name    | total_students_enrolled |
| ------------------ | ----------------------- |
| Marta López        | 7                       |
| Carlos Vega        | 5                       |
| Pending assignment | 2                       |
| Lucia Prades       | 2                       |

--Check for enrollments where the student_id does not match any existing student (orphaned records)
--Success. No rows returned

-- Check for enrollments where the course_id does not match any existing course (orphaned records)
--Success. No rows returned