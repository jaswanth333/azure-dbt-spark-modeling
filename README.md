Welcome to my new dbt project!


1. Data Extraction & Storage: Initially, data is gathered from Azure SQL tables. Azure Data Factory copies and loads this data into Azure Data Lake Gen 2 Storage. The data is stored in a raw format called bronze layer using Parquet files.

2. Data Transformation - Raw to Staging: The raw data in the bronze layer is enriched by using tools like dbt (data build tool) and Databricks. These transformations create more structured and refined data known as staging data models, stored in the silver zone. The data is structured using Delta tables.

3. Creating Aggregated Data Marts: The refined data from the staging area is further processed to create aggregated and more specialized datasets. These datasets are designed for specific purposes or queries and are stored in the gold zone, again using Delta table format.

### Using the starter project

Try running the following commands:
- dbt run
- dbt test

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
