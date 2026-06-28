-- ==========================================
-- Database: student_profiles
-- Assignment 2 - Profile Management System
-- ==========================================

-- Create database
CREATE DATABASE IF NOT EXISTS student_profiles;

-- Use the database
USE student_profiles;

-- Remove existing table (optional)
DROP TABLE IF EXISTS profiles;

-- Create profiles table
CREATE TABLE profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,

    studentId VARCHAR(20) NOT NULL UNIQUE,

    name VARCHAR(100) NOT NULL,

    program VARCHAR(20) NOT NULL,

    email VARCHAR(100) NOT NULL,

    hobbies VARCHAR(255),

    introduction TEXT
);

-- Optional sample data
INSERT INTO profiles
(studentId, name, program, email, hobbies, introduction)
VALUES
(
    'A12345',
    'John Doe',
    'CS240',
    'john@example.com',
    'Reading, Coding',
    'Hello! I enjoy learning Java and web development.'
),
(
    'A12346',
    'Jane Smith',
    'CS240',
    'jane@example.com',
    'Gaming, Music',
    'I love creating websites using JSP and Servlets.'
);

-- Verify the records
SELECT * FROM profiles;
