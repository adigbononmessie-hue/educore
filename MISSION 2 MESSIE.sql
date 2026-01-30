INSERT INTO users (nom, email) VALUES
('Alice Martin', 'alice@educore.fr'),
('Bob Dupont', 'bob@educore.fr'),
('Claire Durand', 'claire@educore.fr'),
('David Leroy', 'david@educore.fr'),
('Emma Bernard', 'emma@educore.fr'),
('Franck Morel', 'franck@educore.fr'),
('Julie Petit', 'julie@educore.fr'),
('Karim Benali', 'karim@educore.fr'),
('Laura Fontaine', 'laura@educore.fr'),
('Nicolas Roche', 'nicolas@educore.fr');
INSERT INTO courses (titre, prix) VALUES
('SQL Avancé', 199.99),
('Python Data Analysis', 249.99),
('Cybersécurité Fondamentaux', 299.99),
('Développement Web Full Stack', 349.99),
('Machine Learning', 399.99),
('IA Générative', 449.99);
INSERT INTO enrollments (user_id, course_id, progress) VALUES
(1, 1, 100),
(1, 2, 80),
(2, 1, 60),
(2, 3, 40),
(3, 2, 100),
(3, 4, 70),
(4, 3, 20),
(4, 5, 50),
(5, 4, 100),
(6, 1, 30),
(6, 6, 10),
(7, 2, 90),
(8, 5, 60),
(9, 6, 0),
(10, 3, 100);
INSERT INTO payments (user_id, amount, paid_at) VALUES
(1, 199.99, '2025-01-05'),
(1, 249.99, '2025-01-10'),
(2, 299.99, '2025-01-12'),
(3, 249.99, '2025-01-15'),
(3, 349.99, '2025-01-20'),
(4, 299.99, '2025-02-02'),
(5, 349.99, '2025-02-05'),
(6, 199.99, '2025-02-10'),
(7, 249.99, '2025-02-15'),
(8, 399.99, '2025-02-18'),
(10, 299.99, '2025-02-20');
SELECT 'users' AS table_name, COUNT(u.id) AS total FROM users u
UNION ALL
SELECT 'courses', COUNT(c.id) FROM courses c
UNION ALL
SELECT 'enrollments', COUNT(e.id) FROM enrollments e
UNION ALL
SELECT 'payments', COUNT(p.id) FROM payments p;
SELECT e.id, e.user_id, e.course_id, e.progress
FROM enrollments e
WHERE e.progress < 0 OR e.progress > 100;
SELECT e.id, e.user_id, e.course_id
FROM enrollments e
LEFT JOIN users u ON e.user_id = u.id
LEFT JOIN courses c ON e.course_id = c.id
WHERE u.id IS NULL OR c.id IS NULL;
SELECT p.id, p.user_id, p.amount
FROM payments p
WHERE p.amount <= 0;