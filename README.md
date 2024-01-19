<h3 align='center'>README file updatation in progress....</h3>

# Architecture
![image link](https://github.com/jaswanth333/azure-dbt-spark-modeling/blob/master/images/Flow%20Diagram.png)

# Process
<strong>1. Data Extraction & Storage:</strong> Initially, data is gathered from Azure SQL tables. Azure Data Factory copies and loads this data into Azure Data Lake Gen 2 Storage. The data is stored in a raw format called bronze layer using Parquet files.

<strong>2. Data Transformation - Raw to Staging:</strong> The raw data in the bronze layer is enriched by using tools like dbt (data build tool) and Databricks. These transformations create more structured and refined data known as staging data models, stored in the silver zone. The data is structured using Delta tables.

<strong>3. Creating Aggregated Data Marts:</strong> The refined data from the staging area is further processed to create aggregated and more specialized datasets. These datasets are designed for specific purposes or queries and are stored in the gold zone, again using Delta table format.

# Lineage Graph
![image link](https://github.com/jaswanth333/azure-dbt-spark-modeling/blob/master/images/dbt-dag.png)
