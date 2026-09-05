{{ config(
    materialized='table',
    schema='Source_db'
) }}

with raw_data as (
    select 101 as id, 'Ali Khan' as employee_name, 'Engineering' as department, 85000 as salary, '2022-01-15' as join_date union all
    select 102, 'Sara Ahmed', 'HR', 62000, '2021-03-20' union all
    select 103, 'Usman Raza', 'Finance', 75000, '2020-07-11' union all
    select 104, 'Ayesha Malik', 'Marketing', 68000, '2023-02-01' union all
    select 105, 'Bilal Hassan', 'Engineering', 90000, '2019-11-05' union all
    select 106, 'Zainab Fatima', 'HR', 60000, '2022-06-18' union all
    select 107, 'Hamza Sheikh', 'Finance', 72000, '2021-09-30' union all
    select 108, 'Sana Tariq', 'Marketing', 65000, '2023-01-10' union all
    select 109, 'Omer Farooq', 'Engineering', 88000, '2020-04-12' union all
    select 110, 'Hira Mani', 'HR', 63000, '2022-08-25' union all
    select 111, 'Fahad Mustafa', 'Finance', 78000, '2018-12-01' union all
    select 112, 'Mehwish Hayat', 'Marketing', 70000, '2021-05-14' union all
    select 113, 'Asad Siddiqui', 'Engineering', 82000, '2022-10-09' union all
    select 114, 'Iqra Aziz', 'HR', 61000, '2023-03-17' union all
    select 115, 'Danish Taimoor', 'Finance', 80000, '2019-02-28' union all
    select 116, 'Maya Ali', 'Marketing', 67000, '2022-11-20' union all
    select 117, 'Sheheryar Munawar', 'Engineering', 86000, '2021-08-15' union all
    select 118, 'Yumna Zaidi', 'HR', 64000, '2020-10-05' union all
    select 119, 'Ahmed Ali', 'Finance', 74000, '2023-04-12' union all
    select 120, 'Mahira Khan', 'Marketing', 71000, '2019-06-30' union all
    -- Duplicates
    select 101, 'Ali Khan', 'Engineering', 85000, '2022-01-15' union all
    select 105, 'Bilal Hassan', 'Engineering', 90000, '2019-11-05' union all
    select 110, 'Hira Mani', 'HR', 63000, '2022-08-25' union all
    select 115, 'Danish Taimoor', 'Finance', 80000, '2019-02-28' union all
    select 120, 'Mahira Khan', 'Marketing', 71000, '2019-06-30' union all
    -- Null / Incomplete Rows
    select null, null, 'Engineering', 50000, '2022-01-01' union all
    select 121, null, 'HR', null, '2021-05-05' union all
    select null, null, 'Finance', null, null union all
    select 122, 'Kamran', null, 73000, '2023-01-01' union all
    select null, null, 'Marketing', 60000, '2022-02-02' union all 
    select 123, 'Fawad Khan', 'Engineering', 95000, '2015-01-01' union all
    select 124, 'Sharafat Ali', 'Data_Engineer',195000, '2026-08-17'
)

select 
    *,
    current_timestamp() as _loaded_at
from raw_data
