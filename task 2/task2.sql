-- task 2

-- 1. get students count college wise
select 	c.college_name, count(stid) 
from colleges c
left join students s  
on s.college  = c.college_id 
group by c.college_name 

-- 2. get students count in a college, course wise
select  s.college, c.course_name , count(s.stid) 
from courses c 
inner join students s on c.course_id  = s.course  
group by s.college , c.course_name  
order by s.college  

-- 3. get the university rank holder across all courses(1 student)
select m.candidate , s.stname, avg(m.marks) cgp
from exam_marks m
inner join students s on s.stid  = m.candidate  
group by m.candidate ,s.stname 
having avg(marks) = (
    select max(total)
    from (
        select avg(marks) total
        from exam_marks 
        group by candidate
    ) as max_avg
)

-- using rank function
select  stid, stname, cgpa as average
from (select stid, s.stname, avg(em.marks) as cgpa,
rank() over (order by avg(em.marks) desc) rank
from students s
inner join exam_marks em on s.stid = em.candidate 
group by  s.stname, s.stid
) ranked_students
where rank = 1;

-- 4. get the list of rank holders each course
select  candidate, stname, course_name, cgpa as average
from (select em.candidate, s.stname, c.course_name, avg(em.marks) as cgpa,
rank() over (partition by c.course_name order by avg(em.marks) desc) rank
from students s
inner join courses c on c.course_id = s.course
inner join exam_marks em on s.stid = em.candidate 
group by em.candidate, s.stname, c.course_name
) ranked_students
where rank = 1;

-- 5. get the college topper across all courses
select candidate ,stname, college_name, cgp AS average_marks
from(
	select m.candidate ,s.stname, c.college_name, AVG(m.marks) AS cgp,
rank() over(partition by c.college_id order by AVG(m.marks) DESC) as ranking
from exam_marks m  
join students s on s.stid  = m.candidate  
join colleges c on c.college_id = s.college  
group by m.candidate  ,s.stname , c.college_name,c.college_id) student_ranks
where ranking = 1;

-- 6. get the college toppers each course
select candidate,stname,college ,course_name,cgp as avg_marks
from(
	select em.candidate  ,s.stname , s.college,c.course_name, AVG(em.marks) AS cgp,
rank() over(partition by c.course_id,s.college order by AVG(em.marks) DESC) as ranking
from students s 
join exam_marks em on s.stid  = em.candidate  
join courses c on c.course_id = s.course  
group by em.candidate  ,s.stname, s.college ,c.course_id,s.college  ,c.course_name) course_rank
where ranking =1;

-- 7. get the failed students count each subject
select s.subject_name , count (em.candidate) as no_of_failed_students
from subjects s
inner join exam_marks em on em.subjects = s.subject_id 
where marks between 0 and 40
group by s.subject_name 


-- 8. get over all students list with semester marks
SELECT SUM(em.marks), em.candidate  
FROM exam_marks em group by em.candidate;

-- 9. get the student list who wasnt appear to the exams
select em.candidate , s.stname
from students s inner join exam_marks em 
on s.stid = em.candidate
where em.marks < 0; 
