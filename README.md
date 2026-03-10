# Sales Forecasting & Demand Analysis

## Project Overview
This project analyzes Walmart historical sales data to understand demand patterns, compare store and department performance, evaluate holiday impact, and forecast future weekly sales.

The project simulates a real business workflow using four tools:

- **Excel** for initial inspection
- **SQL** for structured business analysis
- **Python** for data merging, time series analysis, and forecasting
- **Power BI** for dashboarding and business storytelling

---

## Business Problem
A retail company wants to improve inventory planning and demand management by understanding:

- how sales change over time
- which stores and departments perform best
- whether holidays significantly affect sales
- how store type impacts performance
- what future weekly sales may look like

---

## Tools Used
- **Excel**
- **MySQL**
- **Python** (`pandas`, `matplotlib`, `seaborn`, `prophet`)
- **Power BI**

---

## Dataset Files
This project uses the Walmart forecasting dataset with multiple source files:

- `train.csv` → historical weekly sales
- `features.csv` → external features such as temperature, fuel price, CPI, unemployment, markdowns
- `stores.csv` → store type and size information

These files were merged into one analytical dataset in Python.

---

## Project Workflow

### 1. Excel Initial Inspection
Initial checks were performed on the sales data to understand the structure, date field, sales field, and basic quality.

Tasks performed:
- reviewed dataset structure
- checked row and column counts
- confirmed date and sales columns
- checked missing values in the main training data

### 2. Python Data Preparation
Python was used to merge the three source files into one consolidated analytical dataset.

Tasks performed:
- merged `train.csv`, `features.csv`, and `stores.csv`
- converted the `Date` column into datetime format
- created additional time features such as `Year`, `Month`, and `Week`
- exported the merged dataset for SQL and Power BI use

### 3. SQL Analysis
The merged dataset was imported into MySQL for structured business analysis.

Analysis included:
- total sales
- top-performing stores
- top-performing departments
- holiday vs non-holiday sales
- sales by store type
- monthly and yearly sales trends
- top departments within each store type using window functions

### 4. Python Time Series Analysis and Forecasting
Python was used for deeper analytical exploration and forecasting.

Analysis included:
- total weekly sales trend
- holiday spike analysis
- store type sales comparison
- monthly sales trend
- moving average analysis
- Prophet forecasting model for future weekly sales
- trend and seasonality component analysis

### 5. Power BI Dashboard
A business dashboard was built in Power BI to present historical trends, store performance, holiday impact, and future sales forecast.

Dashboard includes:
- KPI cards for Total Sales, Average Weekly Sales, Total Stores, and Total Departments
- historical sales trend
- sales by store type
- holiday vs non-holiday sales
- top departments by sales
- store contribution analysis
- forecasted weekly sales
- filter panel for interactive exploration

---

## Key Insights

### Excel / Initial Inspection Insights
- The Walmart sales data is split across multiple files, similar to real business datasets.
- The training file contains historical weekly sales by store and department.
- No missing values were found in the main train dataset.

### SQL Insights
- Sales vary significantly across stores and departments.
- Some stores contribute much more revenue than others.
- Holiday periods influence sales patterns.
- Store types perform differently in terms of total and average sales.
- Monthly and yearly aggregations reveal broader business sales trends.

### Python EDA & Forecasting Insights
- Weekly sales show strong fluctuations over time.
- Holiday periods create noticeable sales spikes.
- Moving averages smooth weekly volatility and reveal the broader trend.
- Sales follow recurring seasonal patterns.
- The forecasting model captures future demand cycles and expected fluctuations.

### Power BI Dashboard Insights
- **Store Type A** has the highest total sales.
- Holiday weeks show visible sales spikes, although total non-holiday sales are larger overall due to more regular weeks.
- Some departments consistently drive higher revenue.
- Store contribution is uneven, with a few stores contributing a large share of total sales.
- Forecast output suggests recurring seasonal demand patterns in future weeks.

---

## KPI Summary
- **Total Sales:** 6.74 bn
- **Average Weekly Sales:** 15.98K
- **Total Stores:** 45
- **Total Departments:** 81

---

## Business Recommendations
- Increase inventory and staffing before major holiday periods.
- Use forecasted sales patterns for better stock planning and promotional timing.
- Focus on high-performing store types and departments for revenue optimization.
- Monitor lower-performing stores separately to identify operational improvement opportunities.
- Use forecasting as part of demand planning instead of relying only on historical averages.

---

## Dashboard Preview
<img width="1278" height="722" alt="sales_dashboard" src="https://github.com/user-attachments/assets/c0fc7369-9c9e-4615-a551-99baa7c62abb" />


---

## Forecast Visuals
<img width="989" height="597" alt="Sales Forecast" src="https://github.com/user-attachments/assets/11230bda-9942-4d1a-a42f-3a088b5284ff" />


<img width="886" height="590" alt="Sales  Forecast According Month" src="https://github.com/user-attachments/assets/455d6d46-4ea4-484e-83cd-08c39cccd874" />


---

## Project Folder Structure

```text
03-Sales-Forecasting-Demand-Analysis/
│
├── data/
│   ├── train.csv
│   ├── features.csv
│   ├── stores.csv
│   ├── merged_sales_data.csv
│   └── forecast_output.csv
│
├── notebooks/
│   └── sales_forecasting.ipynb
│
├── sql/
│   └── sales_analysis_queries.sql
│
├── dashboard/
│   └── sales_forecast_dashboard.pbix
│
├── images/
│   ├── sales_dashboard.png
│   ├── forecast_plot.png
│   └── prophet_components.png
│
└── README.md
