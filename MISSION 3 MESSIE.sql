SELECT 
    c.titre,
    COUNT(e.id) AS nb_inscrits
FROM courses c
JOIN enrollments e ON e.course_id = c.id
GROUP BY c.id, c.titre
ORDER BY nb_inscrits DESC;
SELECT
    c.titre,
    SUM(p.amount) AS revenu_total
FROM courses c
JOIN enrollments e ON e.course_id = c.id
JOIN payments p ON p.user_id = e.user_id
GROUP BY c.id, c.titre
ORDER BY revenu_total DESC;
SELECT
    u.id,
    u.nom,
    COUNT(p.id) AS nb_paiements
FROM users u
JOIN payments p ON p.user_id = u.id
GROUP BY u.id, u.nom
HAVING COUNT(p.id) >= 2;
SELECT
    u.id,
    u.nom
FROM users u
LEFT JOIN payments p ON p.user_id = u.id
WHERE p.id IS NULL;