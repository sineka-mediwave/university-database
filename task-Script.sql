-- task 2

-- 1. get students count college wise
select students.stid ,count(*),students.college from (select stid,college from students s group by college) students join colleges c on students.stid =colleges.college_id  

select 	count(stid) from students where college = 6;

-- 2. get students count in a college, course wise
-- 3. get the university rank holder across all courses(1 student)
-- 4. get the list of rank holders each course
-- 5. get the college topper across all courses
-- 6. get the college toppers each course
-- 7. get the failed students count each subject 
-- 8. get over all students list with semester marks
-- 9. get the student list who wasnt appear to the exams

--SELECT m.cname, m.wmname, t.mx
--FROM (
--  SELECT cname, MAX(avg) AS mx
 --   FROM makerar
   -- GROUP BY cname
    --) t JOIN makerar m ON m.cname = t.cname AND t.mx = m.avg
--;