{{ config(
    materialized='table',
    schema='gold_db'
) }}

select
    class,
    subject,
    count(student_id)  as total_students,
    round(avg(marks), 2) as avg_marks,
    max(marks)          as max_marks,
    min(marks)           as min_marks
from {{ ref('silver_students') }}
group by class, subject
order by class, subject