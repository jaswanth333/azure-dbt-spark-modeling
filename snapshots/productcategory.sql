{% snapshot productcategory_snapshot %}

{{
    config(
      file_format = "delta",
      location_root = "/mnt/silver/productcategory",
      target_schema='snapshots',
      invalidate_hard_deletes=True,
      unique_key='ProductCategoryID',
      strategy='check',
      check_cols='all'
    )
}}

with product_snapshot as (
    SELECT
        ProductCategoryID,
        Name
    FROM {{ source('saleslt', 'productcategory') }}
    WHERE ParentProductCategoryID is not null
)

select * from product_snapshot

{% endsnapshot %}
