<div align="center">

# 🚢 Ocean Freight SQL Analytics

**End-to-end SQL analytics project on ocean freight shipment data — built to demonstrate supply chain analyst skills**

</div>

---

## 📌 Project Overview

This project analyzes **5,000 ocean freight shipments** spanning 2022–2024 across major global trade lanes. Using MySQL, I explored carrier performance, delivery reliability, route profitability, and freight cost trends — translating raw logistics data into actionable business insights.

---

## ❓ Business Questions Answered

| # | Business Question | SQL Concept Used |
|---|---|---|
| 1 | How many total shipments were processed? | `COUNT` |
| 2 | Which carriers operate on our lanes? | `DISTINCT` |
| 3 | Which shipments were delayed and by how much? | `WHERE`, `ORDER BY` |
| 4 | Which shipments carry the highest cargo value? | `Filtering` |
| 5 | Which carrier handles the most volume? | `GROUP BY`, `COUNT` |
| 6 | What is the average freight rate per carrier? | `AVG`, `MIN`, `MAX` |
| 7 | Which delay reasons cause the most disruption? | `GROUP BY`, `AVG` |
| 8 | What is each carrier's on-time delivery rate? | `CASE WHEN`, calculated % |
| 9 | Which ports load the highest value cargo? | `SUM`, `AVG` |
| 10 | How does freight revenue trend year over year? | `YEAR()`, `SUM` |
| 11 | Which carriers perform worse than average? | `Subquery`, `HAVING` |
| 12 | Which routes have the worst on-time performance? | `CTE` |
| 13 | How do carriers rank by total revenue? | `Window` `RANK()` |
| 14 | What is the running total of freight revenue? | `Window` `SUM() OVER` |
| 15 | Who are the top customers per commodity? | `CTE` + `PARTITION BY` |

---

## 🗄️ Dataset

| Field | Detail |
|---|---|
| **Rows** | 5,000 shipments |
| **Period** | January 2022 – December 2024 |
| **Source** | Custom generated — modeled on real ocean freight operations |

### Key Columns

| Column | Description |
|---|---|
| `BOL_Number` | Bill of Lading — unique shipment ID |
| `Carrier` | Maersk, MSC, CMA CGM, Hapag-Lloyd, etc. |
| `POL / POD` | Port of Loading / Port of Discharge |
| `Incoterms` | FOB, CIF, EXW, DAP, CFR, DDP |
| `Container_Type` | 20GP, 40GP, 40HC, Reefer |
| `ETD / ETA / Actual_Arrival` | Planned vs actual shipment dates |
| `Delay_Days` | Number of days late |
| `On_Time_Delivery` | Yes / No |
| `Delay_Reason` | Port Congestion, Customs, Weather, etc. |
| `Freight_Rate_USD` | Rate per container |
| `Total_Freight_USD` | Rate × number of containers |
| `Cargo_Value_USD` | Total value of shipment cargo |

---

## 🧠 SQL Skills Demonstrated

Level 1 — Foundations
--- SELECT, WHERE, DISTINCT
--- ORDER BY, LIMIT
--- Comparison & logical operators

Level 2 — Aggregations
--- GROUP BY, HAVING
--- COUNT, SUM, AVG, MIN, MAX
--- CASE WHEN (conditional logic)
--- Date functions — YEAR(), MONTH()

Level 3 — Advanced
--- Subqueries (correlated & scalar)
--- CTEs — WITH clause
--- Window Functions
--- RANK() OVER
--- PARTITION BY
--- Running totals with SUM() OVER

---

## 📁 File Structure

Ocean-freight-sql-analytics/
📂 data/

Ocean_freight_data.csv       # 5,000 row shipment dataset
📂 queries/

ocean_freight_analysis.sql   # All 16 queries L1 → L3

README.md
---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| MySQL 8.0 | Database creation, all SQL queries |
| Power BI | Dashboard & visualization *(in progress)* |
| GitHub | Version control & portfolio hosting |

---

## 🗺️ Roadmap

- [x] Generate custom ocean freight dataset
- [x] Build MySQL database and import data
- [x] Write Level 1 SQL queries (foundations)
- [x] Write Level 2 SQL queries (aggregations)
- [x] Write Level 3 SQL queries (CTEs, subqueries, window functions)
- [x] Build Tableau Public dashboard

---

## 👤 About Me

**Jaspreet Singh** | Ocean Import Coordinator | CEVA Logistics — Greater Toronto Area

8+ years across ocean import, air freight and supply chain operations with hands-on experience in carrier negotiations, D&D cost recovery, cold chain management and key account operations.

[![Tableau](https://img.shields.io/badge/Tableau-Dashboard-E97627?style=for-the-badge&logo=tableau&logoColor=white)](https://public.tableau.com/app/profile/jaspreet.singh5400/viz/OceanFreightAnalyticsDashboard)

📄 [Read the Case Study](CASE_STUDY.md)

https://www.linkedin.com/in/jaspreet-singh-5b13b510b/

