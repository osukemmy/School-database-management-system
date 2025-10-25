# School Database Management System

## Overview
This project is a relational database system designed to manage student records, courses, instructors, enrollments, and course assignments for a school. It is built using **MariaDB/MySQL** and demonstrates database creation, table relationships, and basic SQL queries.

## Features
- Manage student information (name, gender, date of birth, email, phone number, enrollment date)
- Track instructors and their assigned courses
- Record courses and course details (course name, code, credits)
- Maintain student enrollments and grades
- Assign instructors to courses by semester and year
- Support many-to-many relationships between students and courses

## Database Schema
The database includes the following tables:

1. **Students**
   - `student_id` (Primary Key, auto-increment)
   - `first_name`
   - `last_name`
   - `gender`
   - `date_of_birth`
   - `email` (Unique)
   - `phone_number`
   - `enrollment_date`

2. **Instructors**
   - `instructor_id` (Primary Key, auto-increment)
   - `first_name`
   - `last_name`
   - `email` (Unique)
   - `phone_number`

3. **Courses**
   - `course_id` (Primary Key, auto-increment)
   - `course_name`
   - `course_code` (Unique)
   - `credits`

4. **Enrollments**
   - `enrollment_id` (Primary Key, auto-increment)
   - `student_id` (Foreign Key -> Students)
   - `course_id` (Foreign Key -> Courses)
   - `enrollment_date`
   - `grade`

5. **CourseAssignments**
   - `assignment_id` (Primary Key, auto-increment)
   - `instructor_id` (Foreign Key -> Instructors)
   - `course_id` (Foreign Key -> Courses)
   - `semester`
   - `year`

## Requirements
- MariaDB or MySQL installed
- Terminal or MySQL client access

## Installation & Setup

1. **Clone the repository**

```bash
git clone https://github.com/osukemmy/School-database-management-system.git
cd School-database-management-system
