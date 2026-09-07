select
    class,
    subject,
    count(student_id) filter (where is_deleted = false)  as total_students,
    round(avg(marks) filter (where is_deleted = false), 2) as avg_marks,
    max(marks) filter (where is_deleted = false)          as max_marks,
    min(marks) filter (where is_deleted = false)          as min_marks,
    count(*) filter (where is_deleted = true)             as deleted_count,
    count(*)                                              as total_records_including_deleted
from {{ ref('silver_students') }}
group by class, subject
order by class, subject