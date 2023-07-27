-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;



-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM WORKER;



-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM WORKER;
SELECT  DEPARTMENT  FROM  WORKER GROUP BY  DEPARTMENT;



-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT LEFT(FIRST_NAME,3) AS FIRST_THREE_LETTERS FROM WORKER;
SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER;



-- For printing last three characters.
SELECT RIGHT(FIRST_NAME,3) AS LAST_THREE_LETTERS FROM WORKER;



-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT LOCATE('B','Amitabh') AS POSITION; -- POSITION 6
SELECT INSTR(FIRST_NAME,'b') FROM WORKER WHERE FIRST_NAME='Amitabh'; -- position



-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) FROM WORKER;



-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(DEPARTMENT) FROM WORKER;



-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT,LENGTH(DEPARTMENT) FROM WORKER;



-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME,'a','A') FROM WORKER;



-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM WORKER;
SELECT CONCAT_WS(' ',FIRST_NAME,LAST_NAME) AS COMPLETE_NAME FROM WORKER;



-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT *FROM WORKER ORDER BY FIRST_NAME;



-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT *FROM WORKER ORDER BY FIRST_NAME,DEPARTMENT DESC;


-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT *FROM WORKER WHERE FIRST_NAME IN('VIPUL','SATISH');



-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT *FROM WORKER WHERE FIRST_NAME NOT IN ('VIPUL','SATISH');



-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT *FROM WORKER WHERE DEPARTMENT IN ('ADMIN');
SELECT *FROM WORKER WHERE DEPARTMENT LIKE 'ADMIN%';



-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT *FROM WORKER WHERE FIRST_NAME LIKE '%A%';



-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT *FROM WORKER WHERE FIRST_NAME LIKE '%A';



-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT *FROM WORKER WHERE FIRST_NAME LIKE '%H' AND LENGTH(FIRST_NAME)=6;
SELECT *FROM WORKER WHERE FIRST_NAME LIKE '_____H';




-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT *FROM WORKER WHERE SALARY>=100000 AND SALARY<=500000;
SELECT *FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;



-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT *FROM WORKER WHERE YEAR(JOINING_DATE)=2014 AND MONTH(JOINING_DATE)=02;



-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT DEPARTMENT, COUNT(*) FROM WORKER WHERE DEPARTMENT='ADMIN';
SELECT DEPARTMENT,COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING DEPARTMENT='ADMIN';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME FROM WORKER WHERE SALARY>=50000 AND SALARY<=100000;



-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT ,COUNT(WORKER_ID) AS NO_OF_WORKERS FROM WORKER GROUP BY DEPARTMENT ORDER BY COUNT(WORKER_ID) DESC;



-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT WORKER.* FROM WORKER JOIN TITLE ON WORKER.WORKER_ID=TITLE.WORKER_REF_ID WHERE TITLE.WORKER_TITLE='MANAGER';



-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT WORKER_TITLE,COUNT(WORKER_REF_ID) FROM TITLE GROUP BY WORKER_TITLE HAVING COUNT(WORKER_REF_ID)>1;



-- Q-26. Write an SQL query to show only odd rows from a table.
-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT *FROM WORKER WHERE MOD(WORKER_ID,2)!=0;
SELECT *FROM WORKER WHERE MOD(WORKER_ID,2)<>0; -- both are same 



-- Q-27. Write an SQL query to show only even rows from a table.
SELECT *FROM WORKER WHERE MOD(WORKER_ID,2)=0;



-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE WORKER_CLONE LIKE WORKER;  -- Creates the schema of the worker
INSERT INTO WORKER_CLONE SELECT *FROM WORKER;  -- Inserts all the data into the clone table from orginal table



-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT WORKER.* FROM WORKER INNER JOIN WORKER_CLONE   USING(WORKER_ID);



-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT WORKER.* FROM WORKER LEFT JOIN WORKER_CLONE USING(WORKER_ID) WHERE WORKER_CLONE.WORKER_ID IS NULL;



-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
SELECT CURDATE(); -- Gives the current date
SELECT CURTIME(); -- Gives the current time
SELECT NOW(); -- Gives the current date and time



-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT *FROM WORKER ORDER BY SALARY DESC LIMIT 5;



-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table
SELECT *FROM WORKER ORDER BY SALARY DESC LIMIT 4,1;  -- n-1,1.



-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
SELECT SALARY FROM WORKER W1
WHERE 4=(
SELECT COUNT(DISTINCT (W2.SALARY))
FROM WORKER W2
WHERE W2.SALARY >= W1.SALARY
);



-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT W1.* FROM WORKER W1,WORKER W2 WHERE W1.SALARY=W2.SALARY;
SELECT W2.* FROM WORKER W1,WORKER W2 WHERE W1.SALARY=W2.SALARY;
SELECT W1.* FROM WORKER W1,WORKER W2 WHERE W1.SALARY=W2.SALARY AND W1.WORKER_ID != W2.WORKER_ID; -- Ans



-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
SELECT MAX(SALARY) FROM WORKER WHERE SALARY != (SELECT MAX(SALARY) FROM WORKER);
SELECT MAX(SALARY) FROM WORKER WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM WORKER);



-- Q-37. Write an SQL query to show one row twice in results from a table.
SELECT *FROM WORKER 
UNION ALL
SELECT *FROM WORKER ORDER BY WORKER_ID;



-- Q-38. Write an SQL query to list worker_id who does not get bonus.
SELECT WORKER_ID FROM WORKER WHERE WORKER_ID NOT IN (SELECT WORKER_REF_ID FROM BONUS);



-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT *FROM WORKER WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM WORKER);



-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT DEPARTMENT, COUNT(DEPARTMENT) DEP_COUNT FROM WORKER GROUP BY DEPARTMENT HAVING DEP_COUNT<4;



-- Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT ,COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT;



-- Q-42. Write an SQL query to show the last record from a table;
SELECT *FROM WORKER ORDER BY WORKER_ID DESC LIMIT 1;
SELECT *FROM WORKER WHERE WORKER_ID=(SELECT MAX(WORKER_ID) FROM WORKER);



-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT *FROM WORKER LIMIT 1;
SELECT *FROM WORKER WHERE WORKER_ID=(SELECT MIN(WORKER_ID) FROM WORKER);



-- Q-44. Write an SQL query to fetch the last five records from a table.
(SELECT *FROM WORKER ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID;



-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.



-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY DESC LIMIT 3;
SELECT DISTINCT SALARY FROM WORKER W1
WHERE 3>=(SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W1.SALARY <= W2.SALARY) ORDER BY W1.SALARY DESC;
-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.



-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY  LIMIT 3;
SELECT DISTINCT SALARY FROM WORKER W1
WHERE 3>=(SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W1.SALARY >= W2.SALARY) ORDER BY W1.SALARY ;



-- Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT DISTINCT SALARY FROM WORKER ORDER BY SALARY  LIMIT N-1,1;
SELECT DISTINCT SALARY FROM WORKER W1
WHERE N>=(SELECT COUNT(DISTINCT SALARY) FROM WORKER W2 WHERE W1.SALARY >= W2.SALARY) ORDER BY W1.SALARY ;



-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT,SUM(SALARY) AS TOTALSALARY FROM WORKER GROUP BY DEPARTMENT ORDER BY TOTALSALARY DESC; 




-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY FROM WORKER  WHERE SALARY= (SELECT MAX(SALARY) FROM WORKER);





