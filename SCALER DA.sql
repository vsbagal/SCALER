/*
### Basic Problem Statements:
1. Enrollment Count: Retrieve the total number of enrollments in the courses offered by Scaler.*/
SELECT COUNT(*) FROM enrollments;

-- 2. Youngest Student: Find the details of the youngest student enrolled, including their name, age, and enrolled course.
SELECT S.*, c.coursename FROM Students s
JOIN  Enrollments e 
ON s.studentid = e.studentid
JOIN Courses c
ON e.courseid = c.courseid
WHERE Age = (SELECT MIN(Age) FROM Students);

SELECT s.FirstName, s.LastName, s.email, s.Age, c.coursename FROM Students s
JOIN  Enrollments e 
ON s.studentid = e.studentid
JOIN Courses c
ON e.courseid = c.courseid
ORDER BY s.Age LIMIT 1;

-- 3. Course Popularity: Identify the most popular course by calculating the total number of enrollments for each course.
SELECT
    Courses.CourseName,
    COUNT(Enrollments.EnrollmentID) AS TotalEnrollments
FROM
    Courses
JOIN
    Enrollments ON Courses.CourseID = Enrollments.CourseID
GROUP BY
    Courses.CourseID
ORDER BY
    TotalEnrollments DESC
LIMIT 1;

-- 4. Average Enrollment Age: Calculate the average age of students enrolled in Scaler's courses.
SELECT AVG(Age) AS AvrageAge FROM Students;

-- 5. Instructor Experience: Determine the instructor with the highest years of experience and list their name and expertise area.
SELECT * FROM instructors 
ORDER BY ExperienceInYears DESC LIMIT 1;

-- 6. Student Count by College: Provide a breakdown of the number of students enrolled from each college.
SELECT COUNT(CollegeName) AS NumberOfStudents, CollegeName 
FROM Students
GROUP BY CollegeName 
ORDER BY NumberOfStudents DESC;

-- 7. Course Enrollment Timeline: Display the course name and enrollment date for each enrollment in the dataset.
SELECT e.enrollmentID, e.EnrollmentDate, e.CourseID, c.coursename FROM Enrollments e 
JOIN Courses c
ON e.CourseID = c.CourseID 
ORDER BY e.EnrollmentID;

-- 8. Working Professionals Enrollment: Count the number of working professionals enrolled in Scaler's courses.
SELECT COUNT(EmploymentStatus) FROM Students
WHERE EmploymentStatus = 'Working Professional';

-- 9. Youngest Instructor: Find the youngest instructor based on their age and list their details.
SELECT * FROM instructors
WHERE ExperienceInYears = (SELECT MIN(ExperienceInYears)
FROM instructors);

-- 10. Course Fee Analysis: Calculate the average, minimum, and maximum course fees across all courses.
SELECT AVG(Fee) AS AverageFees, 
MIN(Fee) AS MinimumFees, 
MAX(Fee) AS MaximumFees FROM Courses;

/*### Moderate Problem Statements:
1. Enrollment Patterns: Analyze enrollment patterns by finding the month with the highest number of enrollments.*/
SELECT MONTHNAME(EnrollmentDate) AS EnrollmentMonth, 
COUNT(EnrollmentID) AS StudentEnrolled 
FROM Enrollments
GROUP BY EnrollmentMonth
ORDER BY StudentEnrolled DESC;

-- 2. Course Diversity: Identify the course category with the most diverse range of students in terms of age.
SELECT Courses.Category,
    COUNT(DISTINCT Students.StudentID) AS UniqueStudents,
     MAX(Students.Age) AS MaxAge, MIN(Students.Age) AS MinAge,
    CONCAT('20','-','29') AS AgeRange
FROM
    Courses
JOIN
    Enrollments ON Courses.CourseID = Enrollments.CourseID
JOIN
    Students ON Enrollments.StudentID = Students.StudentID
GROUP BY
    Courses.Category
ORDER BY
    AgeRange DESC
LIMIT 1;

-- 3. Top Enrolling Colleges: Determine the top 3 colleges contributing the most enrollments and display their details.
SELECT S.CollegeName, COUNT(E.EnrollmentID) AS TotalEnrollments
FROM 
	Students S
JOIN
	Enrollments E ON S.StudentID = E.StudentID
GROUP BY 
	S.CollegeName
ORDER BY 
	TotalEnrollments DESC LIMIT 3;

-- 4. Enrollment Trends: Create a time series analysis of enrollments to Check how enrollments have evolved over time.
SELECT 	YEAR(Enrollments.EnrollmentDate) AS EnrollmentYear,
		MONTH(Enrollments.EnrollmentDate) AS EnrollmentMonth,
		COUNT(Enrollments.EnrollmentID) AS EnrollmentCount
FROM Enrollments
GROUP BY
    YEAR(Enrollments.EnrollmentDate), MONTH(Enrollments.EnrollmentDate)
ORDER BY
    EnrollmentYear, EnrollmentMonth;

-- 5. Course Popularity Over Time: Display the popularity trend of a specific course over the years.


-- 6. Age Distribution Analysis: Divide students into age groups (e.g., 20-25, 26-30, etc.) and analyze enrollment distribution.
SELECT CASE
	WHEN AGE >= 20 AND AGE < 25 THEN '20-25'
    WHEN AGE >=26 AND  AGE < 30 THEN '26-30'
    ELSE 'More Than 30'
    END AS Age_Range, COUNT(*) AS NumberOfStudents
FROM Students
GROUP BY Age_Range 
ORDER BY NumberOfStudents DESC;

-- 7. Instructor Course Load: Calculate the average number of courses taught by each instructor.


-- 8. Revenue Forecast: Estimate the potential revenue for the upcoming year based on the current enrollment data.
-- Find Year on year growth rate
SELECT YEAR(SaleDate) Years, SUM(Amount) FROM Sales
GROUP BY Years;

-- 9. Course Pairing Analysis: Identify which courses are often enrolled together by the same students.
SELECT
    E1.CourseID AS Course1,
    E2.CourseID AS Course2,
    COUNT(*) AS EnrollmentCount
FROM
    Enrollments E1
JOIN
    Enrollments E2 ON E1.StudentID = E2.StudentID 
GROUP BY
    E1.CourseID, E2.CourseID
HAVING
    COUNT(*) > 1
ORDER BY
    EnrollmentCount DESC;

-- 10. Retention Analysis: Analyze the retention rate of students who have completed multiple courses at Scaler.


/*### Advanced Problem Statements:
1. Enrollment Clustering: Perform clustering analysis on students' attributes to identify distinct student segments.*/

2. Churn Prediction: Build a machine learning model to predict student churn based on enrollment and interaction patterns.

3. Course Recommendation: Develop a recommendation system to suggest courses to students based on their preferences and enrollment history.

4. Instructor Performance: Evaluate instructor performance by considering factors like student satisfaction, enrollment growth, and course completion rates.

5. Student Engagement Analysis: Utilize data to measure and enhance student engagement throughout the course duration.

6. Revenue Optimization Strategy: Devise a strategy to optimize course fees and discounts to maximize revenue while considering market trends.

7. Course Effectiveness: Analyze the effectiveness of courses by correlating enrollment data with post-course career advancements.

8. Market Expansion Analysis: Identify potential regions or colleges for Scaler to expand its offerings based on enrollment data and trends.

9. Resource Allocation Optimization: Optimize instructor assignments and resources to ensure balanced course workloads and student satisfaction.

10. Lifelong Learning Patterns: Study the learning journey of working professionals by analyzing their multiple course enrollments and outcomes.
*/
