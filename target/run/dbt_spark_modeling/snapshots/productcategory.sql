
          
  
    
        create or replace table `hive_metastore`.`snapshots`.`productcategory_snapshot`
      
      
    using delta
      
      
      
      
      
    location '/mnt/silver/productcategory/productcategory_snapshot'
      
      
      as
      

    select *,
        md5(coalesce(cast(ProductCategoryID as string ), '')
         || '|' || coalesce(cast(
    current_timestamp()
 as string ), '')
        ) as dbt_scd_id,
        
    current_timestamp()
 as dbt_updated_at,
        
    current_timestamp()
 as dbt_valid_from,
        nullif(
    current_timestamp()
, 
    current_timestamp()
) as dbt_valid_to
    from (
        



with product_snapshot as (
    SELECT
        ProductCategoryID,
        Name
    FROM `hive_metastore`.`saleslt`.`productcategory`
    WHERE ParentProductCategoryID is not null
)

select * from product_snapshot

    ) sbq



  
      