
# Write your MySQL query statement below
SELECT c.name
FROM Customer c
LEFT JOIN Customer r ON c.referee_id = r.id
WHERE r.id IS NULL OR r.id != 2 OR c.referee_id IS NULL;
