USE UniversityDB;

-- 1. Count rows WITHOUT considering NULL values
SELECT COUNT(Phone) FROM STUDENT;

-- 2. Count rows INCLUDING NULL values
SELECT COUNT(*) FROM STUDENT;

-- 3. Sum of CGPA values (Ignoring NULL)
-- (Assuming CGPA column exists; if not, replace with appropriate column)
SELECT SUM(CGPA) FROM STUDENT;

-- 4. Average CGPA (Ignoring NULL)
SELECT AVG(CGPA) FROM STUDENT;

-- 5. Maximum CGPA
SELECT MAX(CGPA) FROM STUDENT;

-- 6. Minimum CGPA
SELECT MIN(CGPA) FROM STUDENT;

-- 7. Display system current date
SELECT CURDATE();

-- 8. Add calendar months to a date
SELECT DATE_ADD('2024-01-01', INTERVAL 3 MONTH);

-- 9. Display last day of month
SELECT LAST_DAY('2024-02-15');

-- 10. Months between two dates
SELECT TIMESTAMPDIFF(MONTH, '2023-01-01', '2024-01-01');

-- 11. Next occurrence of a day from given date
SELECT DATE_ADD('2024-02-15', 
INTERVAL (7 - WEEKDAY('2024-02-15') + 0) % 7 DAY);

-- 12. Extract year, month, day
SELECT 
    YEAR('2024-02-15') AS Year,
    MONTH('2024-02-15') AS Month,
    DAY('2024-02-15') AS Day;

-- 13. Absolute value of n
SELECT ABS(-25);

-- 14. Smallest integer ≥ value
SELECT CEIL(5.3);

-- 15. Largest integer ≤ value
SELECT FLOOR(5.8);

-- 16a. e raised to power n
SELECT EXP(2);

-- 16b. Remainder of n/m
SELECT MOD(10,3);

-- 16c. m raised to power n
SELECT POW(2,3);

-- 16d. Square root
SELECT SQRT(16);

-- 16e. Truncated value
SELECT TRUNCATE(12.3456,2);

-- 17. Students from Bronx OR Iselin
SELECT * 
FROM STUDENT
WHERE City IN ('Bronx','Iselin');

-- 18. Students from Hope OR Clifton
SELECT *
FROM STUDENT
WHERE City IN ('Hope','Clifton');

-- 19. Students with FacultyID >200 AND <600 (sorted by Last name)
SELECT StudentID, Last, First
FROM STUDENT
WHERE FacultyID > 200 AND FacultyID < 600
ORDER BY Last ASC;

-- 20. Students with ID between 102 and 104
SELECT *
FROM STUDENT
WHERE StudentID BETWEEN '00102' AND '00104';

-- 21. Students whose name does NOT start between A and L
SELECT *
FROM STUDENT
WHERE Last NOT BETWEEN 'A' AND 'L';

-- 22. Same as 21 (all student info)
SELECT *
FROM STUDENT
WHERE Last NOT BETWEEN 'A' AND 'L';

-- 23. Faculty name beginning with M
SELECT *
FROM FACULTY
WHERE Name LIKE 'M%';

-- 24. Faculty name: 1st char 'C', 4th char 'l'
SELECT *
FROM FACULTY
WHERE Name LIKE 'C__l%';