# Write your MySQL query statement below
SELECT
    manager_id AS employee_id,
    name,
    COUNT(employee_id) AS reports_count,
    ROUND(AVG(age)) AS average_age
FROM (
    SELECT
        e1.employee_id AS manager_id,
        e1.name,
        e2.employee_id,
        e2.age
    FROM Employees e1
    LEFT JOIN Employees e2 ON e1.employee_id = e2.reports_to
) subquery
GROUP BY manager_id, name
HAVING COUNT(employee_id) > 0
ORDER BY employee_id;
