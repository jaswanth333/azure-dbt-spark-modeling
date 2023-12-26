{{
    config(
        materialized = "table",
        file_format = "delta",
        location_root = "/mnt/gold/products"
    )
}}

with product_snapshot as (
    select
        productId,
        name,
        standardCost,
        listPrice,
        size,
        weight,
        productcategoryid,
        productmodelid,
        sellstartdate,
        sellenddate,
        discontinueddate
    from {{ ref("product_snapshot") }}
    where dbt_valid_to is null
),

product_model_snapshot as (
    select
        productmodelid,
        name,
        CatalogDescription,
        row_number() over (order by name) as model_id
    from {{ ref("productmodel_snapshot") }}
    where dbt_valid_to is null
),

productcategory_snapshot as (
    select
        ProductCategoryID,
        Name,
        row_number() over (order by ProductCategoryID) as category_id
    from {{ ref("productcategory_snapshot") }}
),

transformed as (
    select
        row_number() over (order by p.productId) as product_sk,
        p.productId as productID,
        p.name as product_name,
        pc.name as product_category,
        p.standardCost,
        p.listPrice,
        p.size,
        p.weight,
        pm.name as model,
        pm.CatalogDescription as description,
        p.sellstartdate,
        p.sellenddate,
        p.discontinueddate
    from product_snapshot p
    left join product_model_snapshot pm on p.productmodelid = pm.productmodelid
    left join productcategory_snapshot pc on p.productcategoryid=pc.ProductCategoryID
)

select * from transformed
