-- DDL scripts

CREATE TABLE colleges (college_id SERIAL PRIMARY KEY NOT NULL, college_name VARCHAR NOT NULL);
CREATE TABLE courses(course_id SERIAL PRIMARY KEY NOT NULL, course_name VARCHAR NOT NULL);
CREATE TABLE subjects(subject_id SERIAL PRIMARY KEY NOT NULL, subject_name VARCHAR NOT NULL);

CREATE TABLE college_courses (
college_course_id SERIAL PRIMARY KEY NOT NULL, 
college_id SERIAL REFERENCES colleges(college_id) on delete cascade,
course_id SERIAL REFERENCES courses(course_id) on delete cascade 
)

CREATE TABLE course_subjects (
course_subjects_id SERIAL PRIMARY KEY NOT NULL,  
subject_id SERIAL REFERENCES subjects(subject_id) on delete cascade,
course SERIAL REFERENCES courses(course_id) on delete cascade;
);

create table students (
stid SERIAL primary key not null,
stname VARCHAR,
batch date,
dob date,
address VARCHAR,
course SERIAL REFERENCES courses(course_id) on delete cascade,
college SERIAL REFERENCES colleges(college_id) on delete cascade
);

create table semesters (
sem_id SERIAL primary key not null,
sem_year INTEGER,
sem_month VARCHAR
);

create table exam_marks(
exam_id SERIAL primary key not null,
candidate SERIAL references students(stid) on delete cascade,
subjects SERIAL references course_subjects(course_subjects_id) on delete cascade,
semester SERIAL references semesters(sem_id) on delete cascade,
marks INTEGER
);

