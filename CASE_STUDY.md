# 📦 Case Study: Ocean Freight Analytics Dashboard

**Author:** Jaspreet Singh | Ocean Import Agent | Supply Chain Analyst — Greater Toronto Area
**Tools:** MySQL · Tableau Public · GitHub  
**Dataset:** 5,000 ocean freight shipments | 2022–2024  
**Live Dashboard:** [View on Tableau Public](https://public.tableau.com/app/profile/jaspreet.singh5400/viz/OceanFreightAnalyticsDashboard)  
**GitHub Repo:** [ocean-freight-sql-analytics](https://github.com/Jaspreet-analyst/ocean-freight-sql-analytics)

---

## 🧩 The Problem

Ocean freight is one of the most complex and costly parts of any supply chain. Companies shipping goods internationally face three major challenges every day:

- **Delays** that disrupt inventory planning and customer commitments
- **High freight costs** that eat into profit margins
- **Carrier performance gaps** that are hard to see without data

Most freight teams manage these issues reactively — they find out about a problem after it has already caused damage. The goal of this project was to build an analytics solution that gives supply chain teams **proactive visibility** into their ocean freight operations.

---

## 🎯 Objective

Analyze 5,000 ocean freight shipments across major global trade lanes to answer five core business questions:

1. Which carriers handle the most volume?
2. Which carriers have the best on-time delivery performance?
3. What are the biggest causes of shipment delays?
4. Which ports of loading generate the most freight revenue?
5. Which carriers are the fastest in terms of transit time?

---

## 🗄️ The Dataset

The dataset was custom built to reflect real ocean freight operations, containing:

| Field | Detail |
|---|---|
| Shipments | 5,000 records |
| Period | January 2022 – December 2024 |
| Carriers | Maersk, MSC, CMA CGM, Evergreen, Hapag-Lloyd, ONE, ZIM, COSCO, HMM, Yang Ming |
| Ports | Shanghai, Shenzhen, Ningbo, Busan, Singapore, Rotterdam, Hamburg and more |
| Destinations | Toronto, Vancouver, Los Angeles, New York, Chicago and more |
| Key Metrics | Freight rates, cargo value, delay days, transit days, on-time delivery |

The dataset includes real freight forwarding terminology — BOL numbers, incoterms (FOB, CIF, EXW), container types (20GP, 40GP, 40HC, Reefer) — making it directly relevant to supply chain analyst roles.

---

## 🔍 Methodology

### Step 1 — Data Preparation
- Built a MySQL database (`ocean_freight`) with a structured shipments table
- Imported 5,000 rows via LOAD DATA INFILE
- Validated data integrity with COUNT and LIMIT checks

### Step 2 — SQL Analysis
Wrote 16 SQL queries across three skill levels:

**Level 1 — Foundations**
Basic filtering and selection to explore the dataset and identify key segments.

**Level 2 — Aggregations**
Used GROUP BY, CASE WHEN, and date functions to summarize carrier performance, delay patterns, and revenue trends.

**Level 3 — Advanced**
Applied CTEs, subqueries, and window functions (RANK, PARTITION BY, running totals) to surface deeper insights.

### Step 3 — Visualization
Built an interactive Tableau Public dashboard with 5 views:
- Shipments by Carrier
- On-Time Delivery Rate by Carrier
- Top Delay Reasons
- Total Freight Revenue by Port of Loading
- Average Transit Days by Carrier

---

## 📊 Key Findings

### Finding 1 — Carrier Volume is Fairly Distributed
MSC and Maersk lead in shipment volume, but no single carrier dominates. This suggests a healthy diversification of carrier relationships — reducing dependency risk.

### Finding 2 — On-Time Performance Varies Significantly
ZIM and MSC show the strongest on-time delivery rates. Several carriers show a higher proportion of delayed shipments, indicating an opportunity to renegotiate SLAs or shift volume to better performing carriers.

### Finding 3 — Port Congestion is the #1 Delay Cause
Port Congestion accounts for the highest total delay days, followed by Equipment Shortage and Customs Inspection. These are largely external factors, but knowing the patterns allows teams to build buffer time into planning.

### Finding 4 — Busan and Rotterdam Generate the Most Revenue
These two ports consistently outperform others in total freight revenue, making them the highest priority lanes for rate negotiations and capacity planning.

### Finding 5 — Transit Times are Consistent Across Carriers
Average transit days are relatively similar across all carriers (25–30 days), suggesting transit time is not a major differentiator — making on-time reliability and freight rate the primary decision factors when selecting a carrier.

---

## 💡 Business Recommendations

| Recommendation | Based On |
|---|---|
| Prioritize ZIM and MSC for time-sensitive shipments | Highest on-time delivery rates |
| Build 5–7 day buffer into delivery commitments | Port Congestion is #1 delay cause |
| Focus rate negotiations on Busan and Rotterdam lanes | Highest revenue generating ports |
| Review SLAs with underperforming carriers | Below average on-time rates |
| Monitor Equipment Shortage trends quarterly | Second highest delay cause |

---

## 🛠️ Skills Demonstrated

| Skill | Evidence |
|---|---|
| SQL — Foundations | SELECT, WHERE, DISTINCT, ORDER BY |
| SQL — Aggregations | GROUP BY, CASE WHEN, date functions |
| SQL — Advanced | CTEs, Subqueries, Window Functions |
| Data Visualization | Tableau Public interactive dashboard |
| Supply Chain Domain | Freight terminology, KPI selection, business context |
| Version Control | GitHub repository with structured documentation |

---

## 🔗 Project Links

- 📊 **Live Dashboard:** [Tableau Public](https://public.tableau.com/app/profile/jaspreet.singh5400/viz/OceanFreightAnalyticsDashboard)
- 💻 **SQL Queries + Dataset:** [GitHub Repository](https://github.com/Jaspreet-analyst/ocean-freight-sql-analytics)

---

*Built by Jaspreet Singh | Ocean Import Agent | Supply Chain Analyst — Greater Toronto Area.*
