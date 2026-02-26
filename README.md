# E-Commerce Customer Analytics (Fintech Focus)

Analysis of 99,440 Brazilian e-commerce transactions to identify customer segments, predict churn, and analyze payment behavior patterns.

![Python](https://img.shields.io/badge/Python-3.8+-blue)
![SQL](https://img.shields.io/badge/SQL-SQLite-green)
![Status](https://img.shields.io/badge/Status-Complete-success)

---

## Project Overview

This project analyzes customer behavior and payment patterns in Brazilian e-commerce using SQL and Python. The analysis combines traditional business analytics (RFM segmentation) with machine learning to deliver actionable insights for customer retention and payment optimization.

**Key Focus Areas:**
- Customer lifetime value and segmentation
- Churn prediction and retention strategies  
- Payment behavior analysis (fintech angle)
- Geographic market performance
- Predictive modeling for installment payment usage

---

## Business Questions

1. **Who are our most valuable customers?** → Customer Lifetime Value analysis
2. **How can we segment customers effectively?** → RFM segmentation
3. **Why are customers churning?** → Churn analysis
4. **What payment patterns exist?** → Fintech payment behavior analysis
5. **Can we predict payment method preferences?** → Logistic regression model

---

## Key Findings

### 1. Critical Churn Problem 
- **80.6% of customers have churned** (77,798 out of 96,477 customers)
- 15,703 high-value customers lost (R$421 avg value each)
- **R$6.6M in revenue at risk from lost high-value segment**

### 2. Customer Segmentation (RFM Analysis)
- Only **2,535 "Recent High-Value" customers** (2.6% of customer base)
- These champions drive R$1.08M despite small size
- 6 distinct customer segments identified
- Lost segments represent 80.6% of total customer base

### 3. Payment Insights (Fintech Angle)
- Credit card is dominant payment method
- Orders using installments show correlation with order value
- Logistic regression predicts installment usage with reasonable accuracy
- Higher-value purchases more likely to use installment options

### 4. Geographic Performance
- Top states drive majority of revenue
- Clear geographic concentration in specific regions
- Opportunity for targeted marketing in high-performing states

## Business Recommendations

### Immediate Actions (Next 30 days):
1. **Win-back campaign** for 15,703 lost high-value customers
   - Potential recovery: R$660K (10% reactivation scenario)
2. **Retention program** for 2,535 recent high-value customers
   - Protect R$1.08M in active revenue
3. **Optimize payment options** for orders >R$200
   - Promote installment plans to increase conversion

### Strategic Priorities (60-90 days):
1. Root cause analysis of 80.6% churn rate
2. Implement loyalty program for active customers
3. Leverage payment predictions for dynamic checkout optimization
4. Expand marketing in top-performing geographic markets

## Tech Stack

**Languages & Libraries:**
- Python 3.x (pandas, NumPy, matplotlib, seaborn)
- SQL (SQLite)
- scikit-learn (logistic regression)

**Analysis Techniques:**
- SQL queries (JOINs, CTEs, window functions, aggregations)
- RFM customer segmentation
- Customer lifetime value calculation
- Churn analysis
- Logistic regression for payment prediction
- Statistical analysis and data visualization

## Project Structure
```
ecommerce-customer-analytics/
├── README.md                          # Project documentation
├── Fintech_Project.ipynb             # Main analysis notebook
├── sql/                               # SQL query files
│   ├── 01_overall_metrics.sql
│   ├── 02_payment_analysis.sql
│   ├── 03_geographic_analysis.sql
│   ├── 04_customer_lifetime_value.sql
│   ├── 05_rfm_segmentation.sql
│   └── 06_churn_analysis.sql
└── requirements.txt                   # Python dependencies
```
## Dataset

**Source:** Brazilian E-Commerce Public Dataset (Olist)  
**Size:** 99,440 delivered orders from 96,477 customers  
**Time Period:** 2016-2018  
**Geography:** Brazil (multiple states)

**Data includes:**
- Customer information (location)
- Order details (date, status, value)
- Payment information (method, installments, amount)

## Analysis Highlights

### Data Cleaning
- Started with 100,000+ orders
- Filtered for delivered orders only
- Removed 1 order with missing payment data
- Combined multiple payments per order
- **Final clean dataset: 99,440 orders**

### SQL Analysis (6 Major Queries)
1. **Overall Business Metrics** - Total orders, customers, revenue
2. **Payment Method Analysis** - Revenue breakdown by payment type
3. **Geographic Analysis** - Top 10 customer states
4. **Customer Lifetime Value** - Top 20 customers by spending
5. **RFM Segmentation** - 6-segment customer classification
6. **Churn Analysis** - Customer status by activity level

### Machine Learning
- **Logistic Regression Model** for installment payment prediction
- Features: Order value
- Train/test split: 80/20
- Model demonstrates correlation between order value and payment method

### Visualizations Created
- Revenue by payment method (bar + pie charts)
- Monthly revenue and order trends (dual-axis line chart)
- Top 10 states by revenue (horizontal bar)
- RFM customer segmentation (dual chart analysis)
- Installment usage patterns
- Summary dashboard with KPIs

---

## Skills Demonstrated

**SQL:**
- Complex JOINs (multiple table joins)
- Common Table Expressions (CTEs)
- Window functions and CASE statements
- Aggregations and subqueries
- Date operations (JULIANDAY)

**Python:**
- Data cleaning and transformation (pandas)
- Exploratory data analysis
- Statistical analysis
- Data visualization (matplotlib, seaborn)
- Machine learning (scikit-learn)

**Business Analytics:**
- RFM customer segmentation
- Churn analysis and prediction
- Customer lifetime value calculation
- Payment behavior analysis
- Geographic market analysis
- Business insight generation

## How to Run

### Prerequisites
```bash
Python 3.8+
Jupyter Notebook
SQLite3
```

### Installation
```bash
# Clone repository
git clone https://github.com/monikkwiatkowska/fintech-customer-analytics/tree/main
 ecommerce-customer-analytics

# Install dependencies
pip install -r requirements.txt

# Launch Jupyter Notebook
jupyter notebook Fintech_Project.ipynb
```
## Learning Outcomes

Through this project, I developed expertise in:
- Writing production-ready SQL queries for business analytics
- Implementing RFM segmentation framework
- Conducting churn analysis and retention modeling
- Analyzing payment behavior in fintech context
- Building predictive models with logistic regression
- Translating data insights into actionable business recommendations
- End-to-end data analysis workflow from raw data to insights

## Contact

**Monika Kwiatkowska**  
Email: 6monikakwiatkowska@gmail.com  
LinkedIn: https://www.linkedin.com/in/monikakwiatkowska/
GitHub: https://github.com/monikkwiatkowska

**GitHub Repository:** https://github.com/monikkwiatkowska/fintech-customer-analytics
**Jupyter Notebook:** https://github.com/monikkwiatkowska/fintech-customer-analytics/blob/main/Fintech_Project.ipynb
**SQL Queries:** https://github.com/monikkwiatkowska/fintech-customer-analytics/tree/main/sql
**Tableau Dashboard:** https://public.tableau.com/views/FinTechProject_17720407498320/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

## License

This project is open source and available under the MIT License.

*Analysis completed: February 2026*
```
## **FILE 2: requirements.txt**
```
pandas>=1.3.0
numpy>=1.21.0
matplotlib>=3.4.0
seaborn>=0.11.0
scikit-learn>=1.0.0
jupyter>=1.0.0
