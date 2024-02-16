# Write your MySQL query statement below
WITH cte_processing_time AS (
  SELECT
    machine_id,
    process_id,
    MAX(CASE WHEN activity_type = 'end' THEN timestamp END)
    -
    MAX(CASE WHEN activity_type = 'start' THEN timestamp END)
    AS processing_time
  FROM
    Activity
  GROUP BY
   machine_id, process_id
 )

select
  machine_id,
  ROUND(AVG(processing_time), 3)  AS processing_time
FROM
  cte_processing_time
GROUP BY
  machine_id;
