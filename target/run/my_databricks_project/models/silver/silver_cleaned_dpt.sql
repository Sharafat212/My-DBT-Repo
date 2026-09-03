
  
    
        create or replace table `workspace`.`1st_dbt_project`.`silver_cleaned_dpt`
      
      
    using delta
  
      
      
      
      
      
      
      
      
      as
      SELECT 
    *
FROM `workspace`.`1st_dbt_project`.`bronze_raw_dpt`
  