# 🛒 Customer Shopping Behavior Analysis – Fashion E-Commerce Retail

**End-to-End Data Analytics Project**  
*Python • Pandas • Scikit-learn • PostgreSQL • Power BI • Predictive Modeling • Customer Segmentation*

---

## 1. 🚀 Executive Summary

This project provides a complete data analytics solution for a U.S.-based fashion e-commerce retailer using a dataset of 3,900 customer transactions. The analysis identifies revenue drivers, customer loyalty patterns, promotional effectiveness, and operational insights, delivering actionable recommendations for marketing, merchandising, and customer experience teams.

**Projected Financial Impact:** Implementing the strategic recommendations is projected to deliver a **15–22% revenue uplift** within 12 months, equivalent to an additional **$35,000–$51,300** on the current annual run rate.

### Key Highlights
* **Total Revenue Analyzed:** $233,081
* **Average Order Value (AOV):** $59.76
* **Customer Loyalty:** 75% of customers are repeat buyers, generating 74.7% of total revenue.
* **Top Category:** Clothing dominates with ~44% of revenue ($104,264).
* **Subscription Penetration:** 27% of customers are subscribers.
* **Discount Usage:** Applied in 43% of transactions; discounted orders linked to higher loyalty.
* **Predictive Modeling:** Random Forest Classifier achieved an AUC of **0.8283** for predicting discount usage.

---

## 2. 🎯 Project Objectives & Workflow

**Objectives:**
* Understand customer demographics and purchasing behavior.
* Quantify the impact of subscriptions, discounts, and loyalty.
* Identify high-performing products, seasons, and geographies.
* Build predictive models and customer segments.
* Deliver an interactive dashboard and actionable recommendations.

**Professional Workflow:**
1. **Python (Pandas, Scikit-learn):** Data loading, cleaning, feature engineering, EDA, modeling, segmentation.
2. **PostgreSQL:** Structured SQL analysis of 10 strategic business questions.
3. **Power BI Desktop:** Single-page interactive executive dashboard.

---

## 3. 📊 Dataset Overview

* **Source:** `customer_shopping_behavior.csv`
* **Rows:** 3,900 unique transactions
* **Columns:** 18 original + engineered features

*Note: Each Customer ID appears only once, but the “Previous Purchases” column (average ~19–25) clearly indicates these are returning customers. Loyalty analysis uses “Previous Purchases > 0” as the repeat-customer proxy.*

---

## 4. 🧠 Exploratory Data Analysis & Feature Engineering

EDA was conducted using Python in a Jupyter Notebook environment.

### Data Cleaning
* **Missing values:** Only "Review Rating" had a few blanks, which were filled with the median (3.75) to preserve distribution.
* **Data types:** Converted "Purchase Amount (USD)" to numeric, categorical columns to 'category' dtype for efficiency.
* **Duplicates:** None found.

### Feature Engineering (Critical Value-Adding Step)
New features were created to enable deeper insights and modeling:
* **Revenue:** Alias for Purchase Amount (USD).
* **Age Group:** Bins for Demographic segmentation (18-24, 25-34, 35-49, 50-64, 65+).
* **Discount Used Flag:** Binary target for classification.
* **Loyalty Score:** Composite metric combining Previous Purchases and Subscription Status.
* **Customer Segment:** K-Means clustering on Age, Previous Purchases, Revenue, and Rating (4 clusters).

---

## 5. 💻 SQL Analysis – 10 Key Business Questions

A comprehensive SQL analysis was performed on the PostgreSQL database to answer 10 strategic business questions. Here are the detailed findings:

1. **Revenue Contribution by Category:** Clothing is the dominant category, generating **$104,264** in revenue from 1,737 transactions (~44% of total revenue, AOV $60.03). Accessories follow with $74,200, Footwear $36,093, and Outerwear $18,524.
2. **Subscriber vs Non-Subscriber:** Non-subscribers account for 73.12% of total revenue. The near-identical AOV (~$59) indicates that subscription status doesn't impact individual order value, but offers a clear opportunity to convert non-subscribers for long-term loyalty.
3. **Top 10 States:** Montana tops the list with $5,784 in revenue, followed by Illinois, California, Idaho, and Nevada. Subscriber rates range from 20–34% across the top 10. These states are prime targets for localized campaigns.
4. **Impact of Discounts:** Discounts were applied in **43%** of transactions. Discounted orders have a slightly lower AOV ($59.28 vs $60.13) but significantly higher customer loyalty (19.29 vs 18.88 previous purchases).
5. **Best-Selling Combination:** Clothing in Size M dominates. The highest-revenue item is **Spring + Clothing + Violet + Size M**.
6. **Age Group Spending:** Customers aged **50–64** generate the highest total revenue ($67,916). However, the 25–34 and 18–24 segments exhibit the highest *average* order values (~$60.20), indicating strong per-transaction spend among younger buyers.
7. **Repeat vs First-Time Buyers:** **75%** of customers are repeat buyers. These loyal customers generate 74.7% of total revenue, confirming the classic retail rule: repeat customers drive the majority of revenue.
8. **Shipping Type Preferences:** **2-Day Shipping** leads with the highest average order value ($60.73), followed by Express ($60.48). Customers opting for faster delivery spend noticeably more per order while maintaining high satisfaction levels.
9. **Payment Method:** **Debit Card** leads with the highest AOV of $60.92, followed by Credit Card ($60.07). Customers using traditional card payments consistently spend more per order.
10. **Customer Segment Revenue Share:** 
    * **Loyal High-Spenders (850 customers):** Highest AOV of $62.33 (22.7% revenue share).
    * **Discount Seekers (1,097 customers) & At-Risk (1,126 customers):** Largest groups, generating over 57% of revenue combined.
    * **Occasional Buyers:** Contribute the least per order ($56.14).

---

## 6. 🤖 Predictive Modeling (Scikit-Learn)

| Model | Target | Algorithm | Performance |
|-------|--------|-----------|-------------|
| **Classification** | Discount Applied | Random Forest Classifier | **AUC = 0.8283** |
| **Clustering** | Customer Segmentation | K-Means | **4 distinct clusters** |

*Top predictors for the Random Forest model included: Category, Previous Purchases, Season, Location, and Shipping Type.*

---

## 7. 📈 Interactive Power BI Dashboard

A single-page executive dashboard was built for marketing, merchandising, and operations teams to enable self-service analysis.

![Power BI Dashboard](./Images/Powerbi_dashboard.png)

**Features:**
* KPI cards (Revenue, AOV, Subscribers, etc.)
* Synchronized slicers: Gender, Season, Category, Age Group, Segment, Shipping Type, Payment Method.
* Filled U.S. map, donut charts, stacked bars, matrix tables, and top-N visuals.
* Modern dark theme with conditional formatting.

---

## 8. 💡 Strategic Business Recommendations

1. **Inventory & Merchandising:** Prioritize Clothing and Outerwear stock for the Winter season, especially Maroon, Gray, and size L.
2. **Marketing & Promotions:** Test selective discount strategies on high-value segments (Loyal High-Spenders) to protect margins while maintaining volume. Avoid blanket 100% discounting.
3. **Customer Loyalty:** Focus acquisition efforts on converting first-time buyers into subscribers early, targeting a 50% penetration rate.
4. **Geographic Expansion:** Double marketing spend in top-performing states: California, New York, Texas, and Florida.
5. **Operations:** Promote premium shipping (Express/2-Day) to high-AOV customers, as it is linked to higher satisfaction and spend.
6. **Predictive Analytics Roadmap:** Deploy the trained Random Forest models for personalized discount offers and dynamic pricing.

---

## 9. ✅ Conclusion

This project successfully transformed raw transactional data into strategic business intelligence using Python, PostgreSQL, and Power BI. The insights confirm strong customer loyalty, clear product dominance, and universal promotional engagement — providing a robust foundation for data-driven growth.

---