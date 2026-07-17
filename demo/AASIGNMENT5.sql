USE UNIVERSITYDB;
SELECT COUNT(*) AS Total_Rooms
FROM Location;
SELECT COUNT(DISTINCT Building) AS Distinct_Buildings
FROM Location;
SELECT 
    CONCAT(First, ' ', Last) AS Full_Name,
    DATE_FORMAT(Birthday, '%d %M, %Y') AS Formatted_Birthday
FROM Student;
SELECT 
    AVG(TIMESTAMPDIFF(YEAR, Birthday, CURDATE())) AS Avg_Age,
    MAX(TIMESTAMPDIFF(YEAR, Birthday, CURDATE())) AS Max_Age,
    MIN(TIMESTAMPDIFF(YEAR, Birthday, CURDATE())) AS Min_Age
FROM Student;
SELECT 
    TermID,
    CourseID,
    SUM(MaxCount) AS Total_MaxCount
FROM Crssection
GROUP BY TermID, CourseID;
SELECT 
    CourseID,
    Title,
    CASE 
        WHEN PreReq IS NULL THEN 'none'
        ELSE 'one'
    END AS Prerequisite_Status
FROM Course;
SELECT 
    DeptID,
    COUNT(*) AS Faculty_Count
FROM Faculty
GROUP BY DeptID;
SELECT *
FROM Student
WHERE MONTH(Birthday) = 2;
SELECT 
    CONCAT(s.First, ' ', s.Last) AS Student_Name,
    m.MajorDesc
FROM Student s
JOIN Major m ON s.MajorID = m.MajorID;
SELECT DISTINCT 
    CONCAT(s.First, ' ', s.Last) AS Student_Name
FROM Student s
JOIN Registration r ON s.StudentID = r.StudentID
JOIN Crssection c ON r.CsID = c.CsID
WHERE r.Final = 'F'
AND c.TermID = 'WN03';
SELECT 
    CONCAT(s.First, ' ', s.Last) AS Student_Name,
    f.Name AS Faculty_Advisor,
    CONCAT(l.Building, ' Room ', l.RoomNo) AS Office_Location
FROM Student s
JOIN Faculty f ON s.FacultyID = f.FacultyID
JOIN Location l ON f.RoomID = l.RoomID;
SELECT 
    cs.CsID,
    cs.CourseID,
    f.Name AS Faculty_Name
FROM Crssection cs
LEFT JOIN Faculty f ON cs.FacultyID = f.FacultyID
WHERE cs.TermID = 'SP03';
SELECT 
    c1.Title AS Course_Title,
    IFNULL(c2.Title, 'No Prerequisite') AS Prerequisite_Title
FROM Course c1
LEFT JOIN Course c2 ON c1.PreReq = c2.CourseID;
SELECT FacultyID, Name, DeptID
FROM Faculty
ORDER BY DeptID, RoomID;
SELECT 
    DeptID,
    COUNT(*) AS Total_Faculty
FROM Faculty
GROUP BY DeptID;
