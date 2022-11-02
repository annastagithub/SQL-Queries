select * from CITY;

select ID_CITY, CNAME
from CITY;

select * from STUDENT where ID_GROUP=101;

select STNAME, AVERAGEMARK, ID_GROUP 
from STUDENT where ID_GROUP=101 or ID_GROUP=105 or ID_GROUP=106;

select STNAME, AVERAGEMARK, ID_GROUP
from STUDENT where ID_GROUP in ('101', '105', '106');

select STNAME, AVERAGEMARK, ID_GROUP
from STUDENT where ID_GROUP=101
union
select STNAME, AVERAGEMARK, ID_GROUP
from STUDENT where ID_GROUP=105
union
select STNAME, AVERAGEMARK, ID_GROUP 
from STUDENT where ID_GROUP=106;

select STNAME, AVERAGEMARK, ID_GROUP, BURSARY
from STUDENT where ID_GROUP in ('102', '104', '106') and 3000<BURSARY;

select STNAME, AVERAGEMARK, ID_GROUP, BURSARY
from STUDENT where STNAME like 'd%' and AVERAGEMARK between 7.4 and 9.5;

select STNAME, CONVERT(varchar, BIRTHDAY, 106) AS Дата
from STUDENT where STNAME like '%o';

select STNAME
from STUDENT where BONUS is NULL and BIRTHDAY > '1988-01-01';

select BURSARY, ID_CITY
from STUDENT where ID_CITY='2';

select STNAME, BURSARY + COALESCE(BONUS, 0) as TOTAL 
from STUDENT where ID_CITY='5'  
order by TOTAL ASC;

select STNAME, BURSARY + COALESCE(BONUS, 0) as TOTAL,
    case COALESCE(ID_CITY, 0) 
       when 5 then 'Vitebsk' 
       when 3 then 'Grodno' 
       when 0 then 'Unknown' 
    end as CITY
from STUDENT where BIRTHDAY between '1990-01-01' and '1991-01-01' 
order by Total DESC;

select STNAME, str(cast(BURSARY/5000*100 as nvarchar), 2, 0) + '% (percents)' as 'BURSARY PERCENTS'
from STUDENT where ID_GROUP=102

select STNAME 
from STUDENT where ID_CITY is null or not ID_CITY=1 and not ID_CITY=2 and not ID_CITY=3
order by STNAME ASC; 

select STNAME, isnull(ID_CITY, '0') as ID_CITY
from STUDENT where ID_CITY is NULL or not ID_CITY=1 and not ID_CITY=2 and not ID_CITY=3
order by STNAME ASC; 

select STNAME
from STUDENT where STNAME like '%\%%' ESCAPE '\'';

select STNAME, BURSARY, ID_GROUP
from STUDENT where BIRTHDAY < '1984-04-23'
order by ID_GROUP ASC, STNAME ASC;

select TEACHER.TNAME, SUBJECT.SNAME, SUBJECT.DURATION
from TEACHER 
JOIN SUBJECT on TEACHER.ID_SUBJECT=SUBJECT.ID_SUBJECT;

select UGROUP.GNAME, UNIVERSITY.UNAME, CITY.CNAME
FROM UGROUP
JOIN UNIVERSITY on UNIVERSITY.ID_UNIVERSITY=UGROUP.ID_UNIVERSITY
JOIN CITY ON CITY.ID_CITY=UNIVERSITY.ID_CITY;

SELECT STUDENT.STNAME, STUDENT.AVERAGEMARK, UGROUP.GNAME, CITY.CNAME
from STUDENT 
JOIN UGROUP on STUDENT.ID_GROUP=UGROUP.ID_GROUP
JOIN CITY ON CITY.ID_CITY=STUDENT.ID_CITY
WHERE AVERAGEMARK<6.2;

select STUDENT.STNAME, UNIVERSITY.UNAME, CITY.CNAME
from STUDENT
JOIN UGROUP on STUDENT.ID_GROUP=UGROUP.ID_GROUP
JOIN UNIVERSITY on UGROUP.ID_UNIVERSITY=UNIVERSITY.ID_UNIVERSITY
JOIN CITY on STUDENT.ID_CITY=CITY.ID_CITY
WHERE POPULATION<=340000 and UNAME like '%Uni%';

select TEACHER.ID_TEACHER, TEACHER.TNAME, TEACHER.PHONE, TEACHER.ID_SUBJECT, UNIVERSITY.UNAME, UNITEACHER.WAGE
from UNITEACHER
JOIN TEACHER on TEACHER.ID_TEACHER=UNITEACHER.ID_TEACHER
JOIN UNIVERSITY on UNIVERSITY.ID_UNIVERSITY=UNITEACHER.ID_UNIVERSITY
WHERE WAGE>=750;

select TEACHER.TNAME, UGROUP.GNAME, UNITEACHER.WAGE, SUBJECT.SNAME
from TEACHER
join UNITEACHER on UNITEACHER.ID_TEACHER=TEACHER.ID_TEACHER
JOIN UNIVERSITY on UNITEACHER.ID_UNIVERSITY=UNIVERSITY.ID_UNIVERSITY
JOIN UGROUP on UGROUP.ID_UNIVERSITY=UNIVERSITY.ID_UNIVERSITY
JOIN SUBJECT ON TEACHER.ID_SUBJECT=SUBJECT.ID_SUBJECT
JOIN CITY on CITY.ID_CITY=UNIVERSITY.ID_CITY 
where SUBJECT.ID_SUBJECT!=4 AND city.ID_CITY=1 or CITY.ID_CITY=3 
ORDER BY TNAME ASC, WAGE ASC, GNAME ASC
