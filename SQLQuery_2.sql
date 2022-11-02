select STUDENT.STNAME, CITY.CNAME
from STUDENT
left outer JOIN CITY on CITY.ID_CITY=STUDENT.ID_CITY
left outer JOIN UNIVERSITY ON CITY.ID_CITY=UNIVERSITY.ID_CITY
WHERE UNIVERSITY.ADDRESS like '%Brovki%'
order by stname ASC;

Select CITY.ID_CITY, CITY.CNAME, CITY.POPULATION, UNIVERSITY.UNAME
from CITY
left JOIN UNIVERSITY on UNIVERSITY.ID_CITY=CITY.ID_CITY
order by ID_UNIVERSITY ASC;

SELECT SUBJECT.SNAME, TEACHER.TNAME, AVG(convert(real, UNITEACHER.WAGE)) as REVENUE
from UNITEACHER
left outer JOIN TEACHER on UNITEACHER.ID_TEACHER=TEACHER.ID_TEACHER
left outer JOIN SUBJECT on TEACHER.ID_SUBJECT=SUBJECT.ID_SUBJECT
GROUP BY SUBJECT.SNAME, TEACHER.TNAME;

SELECT SUBJECT.SNAME, TEACHER.TNAME, AVG(convert(real, SUBJECT.DURATION)) as REVENUE
from UNITEACHER
RIGHT JOIN TEACHER on UNITEACHER.ID_TEACHER=TEACHER.ID_TEACHER
RIGHT JOIN SUBJECT on TEACHER.ID_SUBJECT=SUBJECT.ID_SUBJECT
GROUP BY SUBJECT.SNAME, TEACHER.TNAME;

SELECT SUBJECT.SNAME, TEACHER.TNAME
from SUBJECT FULL JOIN TEACHER
on SUBJECT.ID_SUBJECT=TEACHER.ID_SUBJECT;

SELECT 'The average amount of inhabitans is ' + ltrim(avg(convert(real, POPULATION))) + ' humans' as 'The average amount'
from CITY;

SELECT STNAME, BIRTHDAY
from STUDENT
Where BIRTHDAY = (select max(BIRTHDAY) from STUDENT)

SELECT CITY.CNAME, count(UNIVERSITY.UNAME) as UNIVERSITY
from UNIVERSITY
RIGHT outer join CITY on CITY.ID_CITY=UNIVERSITY.ID_CITY
GROUP BY CITY.CNAME;

SELECT CITY.CNAME, count(UNIVERSITY.UNAME) as UNIVERSITY
from UNIVERSITY
RIGHT outer join CITY on CITY.ID_CITY=UNIVERSITY.ID_CITY
GROUP BY CITY.CNAME;


SELECT CITY.ID_CITY, CITY.CNAME, CITY.POPULATION
from CITY
left JOIN UNIVERSITY on UNIVERSITY.ID_CITY=CITY.ID_CITY
WHERE NOT EXISTS (select ID_CITY
from STUDENT
where UNIVERSITY.ID_CITY=STUDENT.ID_CITY);

SELECT CITY.ID_CITY, CITY.CNAME, CITY.POPULATION
FROM CITY
left JOIN UNIVERSITY ON CITY.ID_CITY=UNIVERSITY.ID_CITY
left JOIN UGROUP ON UGROUP.ID_UNIVERSITY=UNIVERSITY.ID_UNIVERSITY
left JOIN STUDENT ON STUDENT.ID_GROUP=UGROUP.ID_GROUP
WHERE NOT EXISTS (SELECT * FROM STUDENT WHERE STUDENT.ID_CITY=CITY.ID_CITY);

SELECT STUDENT.ID_GROUP, AVG(convert(real,STUDENT.BURSARY+STUDENT.BONUS)) as REVENUE
FROM STUDENT
left JOIN CITY on STUDENT.ID_CITY=CITY.ID_CITY
where CITY.ID_CITY=1
GROUP by STUDENT.ID_GROUP
order by REVENUE DESC;

select STUDENT.STNAME, CITY.CNAME
from STUDENT
left outer JOIN CITY on CITY.ID_CITY=STUDENT.ID_CITY
left outer JOIN UNIVERSITY ON CITY.ID_CITY=UNIVERSITY.ID_CITY
WHERE UNIVERSITY.ADDRESS like '%Brovki%'
order by stname ASC;

Select CITY.ID_CITY, CITY.CNAME, CITY.POPULATION, UNIVERSITY.UNAME
from CITY
left JOIN UNIVERSITY on UNIVERSITY.ID_CITY=CITY.ID_CITY
order by ID_UNIVERSITY ASC;

SELECT SUBJECT.SNAME, TEACHER.TNAME, AVG(convert(real, UNITEACHER.WAGE)) as REVENUE
from UNITEACHER
left outer JOIN TEACHER on UNITEACHER.ID_TEACHER=TEACHER.ID_TEACHER
left outer JOIN SUBJECT on TEACHER.ID_SUBJECT=SUBJECT.ID_SUBJECT
GROUP BY SUBJECT.SNAME, TEACHER.TNAME;

SELECT SUBJECT.SNAME, TEACHER.TNAME, AVG(convert(real, SUBJECT.DURATION)) as REVENUE
from UNITEACHER
RIGHT JOIN TEACHER on UNITEACHER.ID_TEACHER=TEACHER.ID_TEACHER
RIGHT JOIN SUBJECT on TEACHER.ID_SUBJECT=SUBJECT.ID_SUBJECT
GROUP BY SUBJECT.SNAME, TEACHER.TNAME;

SELECT SUBJECT.SNAME, TEACHER.TNAME
from SUBJECT FULL JOIN TEACHER
on SUBJECT.ID_SUBJECT=TEACHER.ID_SUBJECT;

SELECT 'The average amount of inhabitants is ' + ltrim(avg(convert(real, POPULATION))) + ' humans' as 'The average amount'
from CITY;

SELECT STNAME, BIRTHDAY
from STUDENT
Where BIRTHDAY = (select max(BIRTHDAY) from STUDENT);

SELECT CITY.CNAME, count(UNIVERSITY.UNAME) as UNIVERSITY
from UNIVERSITY
RIGHT outer join CITY on CITY.ID_CITY=UNIVERSITY.ID_CITY
GROUP BY CITY.CNAME;

SELECT CITY.CNAME, count(UNIVERSITY.UNAME) as UNIVERSITY
from UNIVERSITY
RIGHT outer join CITY on CITY.ID_CITY=UNIVERSITY.ID_CITY
GROUP BY CITY.CNAME;


SELECT CITY.ID_CITY, CITY.CNAME, CITY.POPULATION
from CITY
left JOIN UNIVERSITY on UNIVERSITY.ID_CITY=CITY.ID_CITY
WHERE NOT EXISTS (select ID_CITY
from STUDENT
where UNIVERSITY.ID_CITY=STUDENT.ID_CITY);

SELECT CITY.ID_CITY, CITY.CNAME, CITY.POPULATION
FROM CITY
left JOIN UNIVERSITY ON CITY.ID_CITY=UNIVERSITY.ID_CITY
left JOIN UGROUP ON UGROUP.ID_UNIVERSITY=UNIVERSITY.ID_UNIVERSITY
left JOIN STUDENT ON STUDENT.ID_GROUP=UGROUP.ID_GROUP
WHERE NOT EXISTS (SELECT * FROM STUDENT WHERE STUDENT.ID_CITY=CITY.ID_CITY);


SELECT STUDENT.ID_GROUP, COALESCE(AVG(convert(int, STUDENT.BURSARY+STUDENT.BONUS)), STUDENT.BURSARY, STUDENT.BONUS) as REVENUE
from STUDENT where STUDENT.ID_CITY=1
GROUP BY STUDENT.ID_GROUP, STUDENT.BURSARY, STUDENT.BONUS
Order by REVENUE DESC;


select CITY.CNAME, UNIVERSITY.UNAME, Convert(int, AVG(STUDENT.BURSARY)) AS 'AVERAGE BURSARY'
from UNIVERSITY 
join CITY on CITY.ID_CITY=UNIVERSITY.ID_CITY
join STUDENT on CITY.ID_CITY=STUDENT.ID_CITY
GROUP BY CITY.CNAME, UNIVERSITY.UNAME
having sum(STUDENT.BURSARY+isnull(STUDENT.BONUS, 0))>10000


select TEACHER.TNAME, SUM(WAGE) as 'TOTAL SALARY'
from TEACHER
Left Join UNITEACHER on TEACHER.ID_TEACHER=UNITEACHER.ID_TEACHER
group by TEACHER.TNAME


select UNIVERSITY.UNAME, TEACHER.TNAME from TEACHER
join UNITEACHER on UNITEACHER.ID_TEACHER=TEACHER.ID_TEACHER
join UNIVERSITY on UNITEACHER.ID_UNIVERSITY=UNITEACHER.ID_UNIVERSITY
union
select max(UNITEACHER.WAGE) as WAGE, max(STUDENT.BURSARY) as BURSARY 
from STUDENT
join UGROUP on UGROUP.ID_GROUP=STUDENT.ID_GROUP
join UNIVERSITY on UGROUP.ID_UNIVERSITY=UNIVERSITY.ID_UNIVERSITY
join UNITEACHER on UNIVERSITY.ID_UNIVERSITY=UNITEACHER.ID_UNIVERSITY


select UNIVERSITY.UNAME, TEACHER.TNAME from UNIVERSITY
join UNITEACHER on UNITEACHER.ID_UNIVERSITY=UNIVERSITY.ID_UNIVERSITY
join TEACHER on UNITEACHER.ID_TEACHER=TEACHER.ID_TEACHER
union
select max(UNITEACHER.WAGE) as WAGE, max(STUDENT.BURSARY) as BURSARY
from UNITEACHER
GROUP BY UNIVERSITY.UNAME, TEACHER.TNAME, UNITEACHER.WAGE, STUDENT.BURSARY
Order by UNIVERSITY.UNAME, TEACHER.TNAME



select UNIVERSITY.UNAME, count (STNAME) as 'STUDENTS AMOUNT' from student
join UGROUP on UGROUP.ID_GROUP=STUDENT.ID_GROUP
join UNIVERSITY on UNIVERSITY.ID_UNIVERSITY=UGROUP.ID_UNIVERSITY
GROUP BY UNIVERSITY.UNAME





select STNAME from STUDENT
where ID_GROUP=102

select STNAME from STUDENT
where BURSARY=2000 and ID_GROUP=101 or ID_GROUP=107 or ID_GROUP=109 or ID_GROUP=119

select STNAME, BIRTHDAY from STUDENT
where STNAME like '%l_'

select DISTINCT STUDENT.BURSARY from STUDENT
join CITY on CITY.ID_CITY=STUDENT.ID_CITY where CNAME like 'Borisov'

select DISTINCT STUDENT.STNAME, STUDENT.BURSARY+isnull(STUDENT.BONUS,0) as REVENUE from STUDENT
join CITY on CITY.ID_CITY=STUDENT.ID_CITY where CNAME like 'Minsk' 
GROUP BY STUDENT.BURSARY, STUDENT.BONUS, STUDENT.STNAME
order by REVENUE ASC

select TEACHER.TNAME, SNAME, DURATION from TEACHER
join SUBJECT on TEACHER.ID_SUBJECT=SUBJECT.ID_SUBJECT

select STUDENT.STNAME, CITY.CNAME from STUDENT
join CITY on CITY.ID_CITY=STUDENT.ID_CITY
left outer join UNIVERSITY on CITY.ID_CITY=UNIVERSITY.ID_CITY where ADDRESS like '%Lenina%'
order by STUDENT.STNAME ASC

select UNIVERSITY.UNAME, sum(UNITEACHER.WAGE) as REVENUE from UNITEACHER
left join UNIVERSITY on UNITEACHER.ID_UNIVERSITY=UNIVERSITY.ID_UNIVERSITY
GROUP BY UNIVERSITY.UNAME;


select CITY.CNAME, count(isnull(UNIVERSITY.UNAME, 0)) as 'University amount' from UNIVERSITY
join CITY on CITY.ID_CITY=UNIVERSITY.ID_CITY
GROUP BY CITY.CNAME;

select STUDENT.STNAME, ltrim(convert(real, BURSARY*100/150)) + ' percent' as 'Bursary percent'
from STUDENT where ID_GROUP=103 or ID_GROUP=109 or ID_GROUP=111 or ID_GROUP=118


SELECT STNAME, BIRTHDAY
from STUDENT
Where BIRTHDAY = (select max(BIRTHDAY) from STUDENT);

select convert(real,avg(POPULATION)) as 'AVERAGE POPULATION'
from CITY

select STUDENT.STNAME,
case
when STUDENT.ID_CITY IS NULL then 'неизвестно'
when STUDENT.ID_CITY=5 then 'Витебск'
when STUDENT.ID_CITY=1 then 'Минск'
else cast (ID_CITY as char)
end ID_CITY
from STUDENT where STUDENT.BIRTHDAY like '%1985%'
order by BURSARY+BONUS DESC


select TEACHER.TNAME, SUBJECT.SNAME, SUBJECT.DURATION
from TEACHER
right join SUBJECT on SUBJECT.ID_SUBJECT=TEACHER.ID_SUBJECT
