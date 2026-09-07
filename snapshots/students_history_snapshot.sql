{% snapshot student_history_v2 %}

{{
    config(
        target_schema='silver_db',
        unique_key='student_id',
        strategy='check',
        check_cols=['student_name', 'class', 'subject', 'marks', 'city'],
        invalidate_hard_deletes=true
    )
}}

select * from {{ source('bronze', 'bronez_raw_data') }}

{% endsnapshot %}