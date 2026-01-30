 drop database educore;
CREATE DATABASE IF NOT EXISTS educore
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;
USE educore;
CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(150) NOT NULL,
    prix DECIMAL(8,2) NOT NULL,
    CHECK (prix > 0)
) ENGINE=InnoDB;
CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    progress INT DEFAULT 0,
    CHECK (progress BETWEEN 0 AND 100),
    CONSTRAINT fk_enroll_user
        FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_enroll_course
        FOREIGN KEY (course_id) REFERENCES courses(id)
) ENGINE=InnoDB;
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(8,2) NOT NULL,
    paid_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_payment_user
        FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

INSERT INTO users (nom, email)
VALUES ('Alice Martin', 'alice@educore.fr');
INSERT INTO users (nom, email)
VALUES ('Alice Dupont', 'alifce@educore.fr');
INSERT INTO courses (titre, prix)
VALUES ('SQL Avancé', 199.99);
INSERT INTO enrollments (user_id, course_id, progress)
VALUES (1, 1, 50);
INSERT INTO enrollments (user_id, course_id, progress)
VALUES (1, 1, 100);
