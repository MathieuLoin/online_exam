
CREATE DATABASE IF NOT EXISTS exam_online;
USE exam_online;

CREATE TABLE IF NOT EXISTS admin_table(
admin_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
admin_email_address VARCHAR(250) NOT NULL,
admin_password VARCHAR(250) NOT NULL,
admin_verification_code VARCHAR(250),
admin_created_on DATE NOT NULL,
email_verified ENUM("verified", "not_verified") DEFAULT "not_verified"
);

CREATE TABLE IF NOT EXISTS user_table(
user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
user_email_address VARCHAR(250) NOT NULL,
user_password VARCHAR(250) NOT NULL,
user_verification_code VARCHAR(250),
user_name VARCHAR(100) NOT NULL,
user_gender ENUM("male", "female", "not_specified") DEFAULT "not_specified",
user_address VARCHAR(250),
user_mobile_no VARCHAR(250),
user_created_on DATE NOT NULL,
user_email_verified ENUM("verified", "not_verified") DEFAULT "not_verified"
);

CREATE TABLE IF NOT EXISTS online_exam_table(
online_exam_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
admin_id INT REFERENCES admin_table(admin_id),
online_exam_title VARCHAR(250) NOT NULL,
online_exam_datetime DATE,
online_exam_duration VARCHAR(250) NOT NULL,
total_question INT NOT NULL,
marks_per_right_answer VARCHAR(250) NOT NULL,
marks_per_wrong_answer VARCHAR(250) NOT NULL,
online_exam_created_on DATE NOT NULL,
online_exam_status ENUM("active", "finished", "not_started") DEFAULT "not_started",
online_exam_code VARCHAR(250)
);

CREATE TABLE IF NOT EXISTS question_table(
question_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
online_exam_id INT REFERENCES online_exam_table(online_exam_id),
question_title TEXT
);

CREATE TABLE IF NOT EXISTS option_table(
option_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
question_id INT REFERENCES question_table(question_id),
option_number INT,
option_title TEXT
);

CREATE TABLE IF NOT EXISTS user_exam_question_answer(
user_exam_question_answer_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
user_id INT REFERENCES user_table(user_id),
exam_id INT REFERENCES exam_online(exam_id),
question_id INT REFERENCES question_table(question_id),
user_answer_option ENUM("correct", "incorrect"),
marks VARCHAR(250)
);

CREATE TABLE IF NOT EXISTS user_exam_enroll_table(
user_exam_enroll_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
user_id INT REFERENCES user_table(user_id),
exam_id INT REFERENCES exam_online(exam_id),
attendance_status ENUM("present", "not_present") DEFAULT "not_present"
);