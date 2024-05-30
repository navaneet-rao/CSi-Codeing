use database csistudentdb;

create table students(
    reg_no varchar(10) primary key,
    s_name varchar(30),
);

create table course(
    sr_no varchar(3),
    course_code varchar(10) primary key,
    course_name varchar(50),
    int_max integer(3),
    ext_max integer(3),
    total_max integer
);

create table results(
    reg_no varchar(10) primary key,
    foreign key (reg_no) references students.reg_no,
    course_code varchar(10),
    internal integer(3),
    externals integer(3),
    FOREIGN KEY (course_code) REFERENCES course(course_code);
);


INSERT INTO students (reg_no, s_name) VALUES
('1JT21CS001', 'Aarav Kumar'),
('1JT21CS002', 'Bhavika Singh'),
('1JT21CS003', 'Chetan Rao');

INSERT INTO course (sr_no, course_code, course_name, int_max, ext_max, total_max) VALUES
('001', 'CS101', 'Data Structures', 50, 50, 100),
('002', 'CS102', 'Algorithms', 50, 50, 100),
('003', 'CS103', 'Operating Systems', 50, 50, 100);


INSERT INTO results (reg_no, course_code, internal, externals) VALUES
('1JT21CS001', 'CS101', 35, 55),
('1JT21CS001', 'CS102', 38, 45),
('1JT21CS001', 'CS103', 40, 60);

