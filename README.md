# Sales Data ETL and Analysis Project

This project demonstrates a complete ETL (Extract, Transform, Load) pipeline using Python and MySQL. It simulates a real-world retail data processing workflow by integrating sales, customer, and product data, loading it into a structured database, and enabling analytical queries.

---

##  Data Sources

- **Sales Data**: Contains transaction-level sales information including product IDs, customer IDs, quantities, and timestamps.
- **Customers Data**: Includes customer IDs, names, demographics, and location data.
- **Products Data**: Contains product IDs, names, categories, and pricing details.

---

##  Tools & Technologies

- **Python (pandas, mysql-connector-python)** – For data extraction, transformation, and loading
- **MySQL** – As the destination database for structured storage and querying
- **Jupyter Notebook** – For writing, testing, and documenting the ETL process
- **Git & GitHub** – For version control and project documentation

---

##  ETL Process

1. **Extract**: CSV files are read into pandas DataFrames.
2. **Transform**: Data is cleaned and restructured:
   - Handled missing values
   - Converted dates and standard formats
   - Renamed columns to match database schema
3. **Load**: Data is inserted into a MySQL database using parameterized queries.
   - Created dimensional model: `dim_customers`, `dim_products`, `fact_sales`

---

##  Analysis & Queries

Once loaded into MySQL, we performed queries to answer business questions such as:
- Total sales by product or category
- Customer segmentation by location or behavior
- Monthly revenue trends

---

##  Future Improvements

- Automate the ETL with Apache Airflow or cron jobs
- Add more data sources (e.g., inventory, marketing)
- Create a dashboard using Tableau or Power BI

---

##  Limitations

- The data is static and synthetic — real-time streaming is not included.
- Basic transformations only — no advanced feature engineering or predictive analytics.

---
🃏

