create database practice;
use practice;

create table sql_table(
stud_name int,
stud_id int,
stud_address varchar (20),
stud_percentage float)

create table employee(
emp_name varchar(20),
emp_id int,
dob date)                                                   ## Create - we can create database and create table

desc employee;

                                        ## Now using the DDL commands: (data definition language) ##

## Create
## Alter
## Drop
## truncate


alter table sql_table add dob date;
alter table sql_table add(phno int);
desc sql_table;                                              

alter table sql_table modify phno float;                                       ## ALter - (modify) - we can modify the datatype of the variable.
alter table sql_table change phno phone_no int;                                ## ALter - (change) - we can change the datatype and size of the dataype of the variable. 
alter table sql_table rename column phone_no to phone_number;                  ## ALter - (rename column) - we can rename the column name.
alter table sql_table rename to sql1_table;                                    ## ALter - (rename) - we can also rename the table.    
alter table sql_table drop phone_number;                                       ## ALter - (drop) - we can drop the column.
desc sql1_table;
drop table sql1_table;                                                         ## drop - we can drop entire table.    



									           ## Data Manipulation language DML ##

## Insert
## Update
## Delete



#### INSERT::
use practice;
create table studs(
stud_id int,
stud_name varchar(20),
address varchar(20),
phno int)											                                        
desc studs;
insert into studs values(1,'Tiger','Bangalore',2626);
insert into studs values(2,'Math','Mysore',4646),
                         (3,'Curl','Shivmogga',5656),
                         (4,'ZS','Banglore',6565);                                    ## Inserting in order

insert into studs (phno,address,stud_name,stud_id) values(8686,'tumkur','GL',5);      ## Changing the order while inserting                    
select * from studs;


#### UPDATE::
update studs set stud_id=20 where address='mysore';
select * from studs;


#### DELETE::
delete from studs where stud_id=5;
select * from studs;

#### TRUNCATE::
truncate studs;
select * from studs;                              ## Deletes every data in every column.


                                                      ## Working with DATE TIME ##


create table date_time(
d1 date,
d2 datetime,
d3 time)
desc date_time;

insert into date_time values(current_date(),now(),current_time);
select * from date_time;
insert into date_time values('2020/08/25','2020/08/25 17:10:10','17:17:17');



## Constrain::
## not null, default, check
create table author(
id int,
name varchar(20) not null default('mr x'),
country varchar(20) not null check (country in ('uk','us','italy')),
pages int check (pages>0));

alter table author modify id int primary key;

insert into author values(1,'la','us',12);
select * from author;
insert into author values(1,'la','us',0);


####################### DAY 02 HR Schema #######################################################################################################
## select 
## as 
## where 
## order by
## limit
## Like
## Numeric Functions::
## Character Manipulation functions::



select * from employees;
select first_name,last_name,salary*12 as annual_sal from employees;
select first_name,last_name,salary*12 as annual_sal from employees where salary*12>200000;
select first_name,last_name,salary from employees limit 5,2;
select first_name,last_name from employees order by last_name,first_name asc;
select * from employees;
select first_name,salary*12 as annsal from employees order by annsal desc;
select first_name from employees where first_name like '%_T%'
select first_name,last_name,salary*12 as annual_sal from employees order by annual_sal desc limit 4;

### Numeric functions::
## round
## floor
## ceiling or ceil
## truncate

select round(12.2678,2), round(16.2728,3);
select floor(12.2678), round(16.2728);
select ceiling(12.678), ceil(16.27);
select truncate(12.678,2), truncate(16.27,1);
select '1' + 1;

## Character Manipulation functions::
## substring
## Instring.
## Concat.
## lpad & rpad.
## length.
## trim.  - (leading, both lead and last, and everywhere)
## Replace.

select substr(first_name,1,4) from employees;
select first_name,instr(first_name,'l') from employees;
select first_name,last_name,concat(substr(first_name,1,1),' ',substr(last_name,1,1)) as Intial from employees;
select salary, rpad(salary,10,'*') from employees;
select salary, lpad(salary,10,'-') from employees;
select first_name from employees;
select first_name,replace(first_name,'S','T') from employees;
select first_name,trim(leading 'S' from first_name) from employees;
select last_name,trim(both 'D' from last_name) from employees;
select first_name,last_name,concat( substr(upper(first_name),1,1),' ',substr(lower(last_name),1,1) ) from employees;
select concat(substr(upper(first_name),1,1),' ',substr(lower(last_name),1,1)) from employees;

## working with date functions ##
## adddate
## subdate
## date_format
## month()
## year()
## day()
## str_to_date

select adddate(current_date(),interval 1 day );
select subdate(current_date(),interval 1 day);
select utc_timestamp();
select date_format(current_date(),'%y/%m%/%d');
select hire_date,date_format(hire_date,'%y') from employees;
select year(hire_date) from employees;
select current_timestamp();

############################################ control flow statements ######################################

## IF
## IFNULL
## NULLIF

select salary,if(salary>20000,'good','bad') from employees;

select commission_pct, ifnull(commission_pct,"u deserve better boy")  from employees;
select salary from employees;
select * from employees;
select job_id, nullif(job_id,'AD_PRES') from employees;


############################################# Case expressions ############################################

select first_name,last_name,salary,
           case when salary between 5000 and 10000 then 'cat1'
				when salary between 10000 and 15000 then 'cat2'
                when salary between 15000 and 20000 then 'cat3'
                else 'special cat'
                end as 'category'
                from employees;
select job_id from employees;

## STRING TO DATE FUNCTION:
select str_to_date('2020,03,30','%y,%m,%d');


## Explicit datatype convert using cast and convert.
## cast
## convert

select '1' + 1;
select cast('1' as signed) + cast('10' as signed);
select convert('1',signed) + convert('1',signed);

########################################## GROUP By FUNCTIONS ################################
## Count
## Distinct
## Avg
## max
## min

select count(*) from employees;
select distinct employee_id from employees;
select count(distinct(job_id)) from employees;
select avg(salary) from employees;

select salary,job_id,avg(salary) as average_sal from employees group by job_id;
select ifnull(commission_pct,0) from employees;
select coalesce(commission_pct,0) from employees;
select department_id,max(salary) from employees group by department_id;

select department_id,count(*),
       case when count(*)<2 then 'junior dept'
            when count(*)=3 then 'inter dept'
            when count(*)>3 then 'senior dept'
            end as 'dept_cat'
            from employees group by department_id;
-- Q2 write a query to get the number of employees with the same job
select job_id,count(*) from employees group by job_id;
-- Q3 write a query to find the manager id and the salary of the lowest-paid under him in the descending order.
select manager_id,min(salary) as 'min_sal'from employees group by manager_id order by min_sal desc;
-- Q4 write a query to find the number of employees joined each year:
select employee_id,year(hire_date) as 'year_of_joining',count(*) from employees group by year_of_joining ;

################################# Having Clause ##################
## in
## between


select department_id,count(*) as 'noemps' from employees group by department_id having noemps>2;
select department_id,count(employee_id) from employees where department_id in(90,80) group by department_id;


use practice;
create table parent(
id int primary key,
address varchar(20));
desc parent;

create table child(
id int,
dob date,
phno int,
foreign key(id) reference parent(id));
desc child;
###########################################################################################################################################################################


































