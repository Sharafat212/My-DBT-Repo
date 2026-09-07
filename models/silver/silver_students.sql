{{ config(
    materialized='incremental',
    unique_key='student_id',
    incremental_strategy='merge',
    schema='silver_db'
) }}

with raw_source as (
    select *
    from {{ source('bronze', 'bronez_raw_data') }}

    {% if is_incremental() %}
      where _loaded_at > (select coalesce(max(_loaded_at), '1900-01-01') from {{ this }})
    {% endif %}
),

cleaned_data as (
    select
        student_id,
        {{ clean_text('student_name') }} as student_name,
        {{ clean_text('class') }}        as class,
        {{ clean_text('subject') }}      as subject,
        {{ handle_null_marks('marks') }} as marks,
        {{ clean_text('city') }}         as city,
        _loaded_at
    from raw_source
    where student_id is not null
      and student_name is not null
),

latest_data as (
    select
        *,
        row_number() over (partition by student_id order by _loaded_at desc) as row_num
    from cleaned_data
)

select
    student_id,
    student_name,
    class,
    subject,
    marks,
    city,
    _loaded_at
from latest_data
where row_num = 1
order by student_id