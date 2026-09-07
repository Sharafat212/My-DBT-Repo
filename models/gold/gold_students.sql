{{ config(
    materialized='table',
    schema='gold_db'
) }}

select
    class,
    subject,
    count(student_id)   as total_students,
    round(avg(marks), 2) as avg_marks,
    max(marks)           as max_marks,
    min(marks)           as min_marks,
    count(case when is_deleted = true then 1 end) as deleted_count
from {{ ref('silver_students') }}
where is_deleted = count(*)
group by class, subject
order by class, subject