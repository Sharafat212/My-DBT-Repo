
  
    
        create or replace table `workspace`.`1st_dbt_project`.`gold_summary_dpt`
      
      
    using delta
  
      
      
      
      
      
      
      
      
      as
      SELECT 
    COUNT(*) AS total_records
FROM `workspace`.`1st_dbt_project`.`silver_cleaned_dpt`
  