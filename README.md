# 🛍️ Retail Sales Intelligence & Customer Behavior Analysis Dashboard

<div align="center">

  **An end-to-end retail analytics solution — from raw transaction data to interactive business intelligence.**

*Python · MySQL · Power BI · Feature Engineering · SQL Business Queries*

</div>

## 📌 Project Summary

Retail businesses generate massive volumes of transactional data but often lack the tools to extract meaningful insights. This project builds a **complete analytics pipeline** that transforms raw customer purchase data into an interactive Power BI dashboard — enabling stakeholders to understand customer behavior, identify revenue drivers, and make smarter business decisions.

| Metric | Value |
|---|---|
| 📦 Total Revenue Analyzed | $233.08K |
| 👥 Total Customers | 3,900 |
| 🛒 Average Purchase Value | $59.76 |
| 💎 Loyal Customer Rate | 88.98% |
| 🗃️ Dataset Size | ~3,900 rows · 18 columns |
| 🔍 SQL Queries Written | 18+ across 5 categories |
| 📊 Dashboard Pages | 3 interactive pages |

---

## 🎯 Problem Statement

Retail businesses face three critical data challenges:

- **Fragmented customer insights** — no single view of who their customers are
- **Unclear revenue drivers** — unknown which products, segments, or seasons generate the most value
- **Reactive decision-making** — no real-time tool to answer business questions on demand

This project solves all three with an end-to-end analytics solution covering data engineering, SQL analysis, and visual storytelling.

---

## 🗂️ Project Architecture

```
retail-sales-intelligence/
│
├── 📓 notebooks/
│   └── Retail_EDA_Analysis.ipynb       # Full EDA + feature engineering
│
├── 🗄️ sql/
│   └── Business_queries.sql            # 18+ structured business queries
│
├── 📊 dashboard/
│   └── Retail_Sales_Dashboard.pbix     # Power BI interactive dashboard
│
├── 📁 data/
│   ├── raw/customer_purchase_data.csv
│   └── cleaned/final_dashboard_data.csv
│
└── 📄 docs/
    └── Project_Documentation.docx
```

---

## 🔧 Tech Stack

| Layer | Tool | Purpose |
|---|---|---|
| **Data Processing** | Python (Pandas, NumPy) | Cleaning, transformation, feature engineering |
| **Visualization (EDA)** | Matplotlib, Seaborn | Exploratory analysis plots |
| **Database** | MySQL | Structured business querying |
| **Dashboard** | Power BI | Interactive visualization & reporting |
| **Notebook** | Jupyter Notebook | End-to-end analytical workflow |

---

## 📊 Dataset

- **Source:** [Kaggle — Customer Purchase Behaviour Dataset](https://www.kaggle.com/)
- **Records:** ~3,900 transactions
- **Columns:** 18 features

**Key Feature Categories:**

| Category | Features |
|---|---|
| 👤 Demographics | Age, Gender, Location |
| 🛍️ Purchase Details | Item, Category, Amount, Season |
| 🔁 Behavior | Discount Applied, Review Rating, Shipping Type |
| 📈 History | Previous Purchases, Frequency of Purchase |

---

## 🔬 Data Preparation Pipeline (Python)

### Data Quality Issues Found & Fixed

| Issue | Resolution |
|---|---|
| 37 missing `review_rating` values | Imputed using **category-wise median** |
| Redundant `promo_code_used` column | Dropped from dataset |
| Inconsistent column naming | Standardized to `snake_case` |

### Feature Engineering

Two key features were engineered to power the segmentation analysis:

**Age Group Segmentation**
```
Teen (< 18) → Young Adult (18–25) → Adult (26–35) → Mid Age (36–50) → Senior (50+)
```

**Customer Segmentation (based on purchase history)**
```
New       → ≤ 2 previous purchases
Returning → 3–5 previous purchases
Loyal     → > 5 previous purchases
```

---

## 🗄️ SQL Analysis — Business Query Categories

All 18+ queries are organized across five business tracks:

```sql
-- Sample: Loyal Customer Revenue Contribution
SELECT customer_segment,
       SUM(purchase_amount) AS total_revenue,
       ROUND(SUM(purchase_amount) / (SELECT SUM(purchase_amount) FROM customers) * 100, 2) AS revenue_pct
FROM customers
GROUP BY customer_segment
ORDER BY total_revenue DESC;
```

| Category | Key Questions Answered |
|---|---|
| 📊 Basic Queries | Total revenue, gender splits, age-group contribution |
| 🛍️ Product Analysis | Top 5 by sales, highest-rated products, category rankings |
| 👥 Customer Analysis | Segment distribution, repeat buyers, loyal customer revenue |
| 🧠 Behavior Analysis | Discount impact, subscription vs non-subscription spending |
| 📅 Trend Analysis | Seasonal revenue patterns, peak purchase periods |

---

## 📺 Dashboard Walkthrough

### Page 1 — Retail Sales & Customer Intelligence Overview

> High-level business performance at a glance

- **KPI Cards:** Revenue · Customers · Avg Purchase · Loyal Rate
- **Revenue by Category:** Clothing dominates at $104K
- **Revenue by Gender:** Male $158K | Female $75K
- **Seasonal Trend:** Fall peak ($60K) → Summer lowest ($55.8K)
- **Avg Orders/Customer:** Loyal = 28 orders | Returning = 4 | New = 1.5

### Page 2 — Product & Customer Behavior Analysis

> Deep dive into product performance and purchasing behavior

- **Top 5 Products** clustered tightly (~$10K each) — diversified portfolio
- **Discount Impact:** 57% of revenue from discounted orders
- **Subscription Insight:** Avg spend nearly identical with/without subscription ($59.87 vs $59.49)
- **Purchase Frequency:** Even distribution across weekly to annual shoppers
- **Shopping Type:** Balanced across Free Shipping, Standard, Express, Store Pickup, 2-Day

### Page 3 — Revenue Driver & Regional Analysis

> Decomposition tree to drill from total revenue to individual transaction drivers

- **Decomposition Tree:** Total Revenue → Segment → Category → Product → Gender → Discount → Season → Subscription → Location
- **Key Chain:** Loyal → Clothing → Shirt → Male → Discounted → Winter → Kentucky
- **Geographic Map:** Revenue concentration in select US states (Kentucky, Idaho, Oklahoma, Nebraska)

---

## 💡 Key Business Insights

| # | Insight | Business Impact |
|---|---|---|
| 1 | Loyal customers contribute **88.98% of total revenue** | Retention > Acquisition |
| 2 | **Clothing category** dominates across all segments | Double down on top category |
| 3 | Top 5 products generate disproportionate revenue | Focus inventory & promotions |
| 4 | **Discounts increase volume but not spend per order** | Targeted, not blanket discounts |
| 5 | **Fall and Winter** are peak revenue seasons | Seasonal campaign planning |
| 6 | Revenue is **geographically concentrated** | Regional targeting opportunity |

---

## 📋 Business Recommendations

**Customer Strategy**
- Launch loyalty programs with personalized offers for top-tier customers
- Build re-engagement campaigns to convert Returning → Loyal

**Marketing Strategy**
- Invest heavily in Fall/Winter seasonal campaigns
- Run localized promotions in high-revenue geographic clusters

**Pricing Strategy**
- Shift from blanket discounts to behavior-based targeted discounts
- Implement dynamic pricing during peak demand seasons

**Product Strategy**
- Prioritize inventory for Shirts, Blouses, and Dresses
- Review and phase out consistently low-performing SKUs

---

## 🚀 How to Run This Project

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/retail-sales-intelligence.git
cd retail-sales-intelligence
```

### 2. Install Python Dependencies
```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### 3. Run the Jupyter Notebook
```bash
jupyter notebook notebooks/retail_eda_analysis.ipynb
```

### 4. Set Up MySQL Database
```bash
mysql -u root -p < sql/business_queries.sql
```

### 5. Open Power BI Dashboard
Open `dashboard/Retail_Sales_Dashboard.pbix` in Power BI Desktop.

---

## 📦 Deliverables

- [x] Cleaned & feature-engineered dataset (CSV + MySQL)
- [x] Jupyter Notebook with full EDA and visualizations
- [x] 18+ SQL business queries across 5 categories
- [x] 3-page interactive Power BI dashboard
- [x] Full project documentation
- [x] GitHub repository with structured codebase

---

## 🙋 About the Author

**Manju B** — Data Analyst passionate about turning raw data into business value.

Skills: Python · SQL · Power BI · Data Visualization · EDA · Feature Engineering

📧 [blog.bmanju@gmail.com] &nbsp; | &nbsp; 💼 [LinkedIn](https://linkedin.com/in/manju-busetty) &nbsp; | &nbsp; 🐙 [GitHub](https://github.com/b-manju)

---

## 📄 License

This project is licensed under the MIT License. See `LICENSE` for details.

---

<div align="center">

⭐ **If you found this project useful, please star the repository!** ⭐

*Built with Python, MySQL, and Power BI*

</div>
