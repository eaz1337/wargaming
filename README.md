# Wargaming Data Engineer Task Solution

This repository contains a complete solution for the Wargaming Data Engineer test task. It features a scalable data warehouse design for World of Tanks analytics and the corresponding SQL solution scripts.

The entire project is built for **scalability** and **performance**, leveraging industry-standard data modeling and optimization techniques.

***

## 🏛️ Data Warehouse Architecture

The solution is based on a **Star Schema** architecture, optimized for large-scale analytics.

* **Dimensional Modeling:** The schema uses multiple fact tables (e.g., `fact_battle_results`, `fact_player_transactions`) that share conformed dimensions (e.g., `dim_players`, `dim_vehicles`) for data consistency.
* **Partitioning:** Large fact tables are partitioned by date to ensure high performance on time-series queries through partition pruning.
* **Indexing:** All foreign keys and frequently filtered columns are indexed to accelerate `JOIN` and `WHERE` operations.
* **Self-Documenting:** The schema uses `COMMENT ON` commands to store table and column descriptions directly in the database metadata.

***

## 📂 Project Structure

```
.
├── 📁 database-schema/       # SQL definitions for all tables
│   └── 📁 definitions/
│       ├── 📁 dim/            # Dimension tables
│       └── 📁 fact/           # Fact tables
│
└── 📁 problem-solutions/      # Solution scripts for each problem
    ├── 📁 Problem_No1/
    ├── 📁 Problem_No2/
    └── ...
```

***

## 📝 Problem Solutions

* **Problem 1 & 2 (Schema Design):** The complete, documented schema is located in the `database-schema` folder.
* **Problem 3 (Longest Win Streak):** The script uses **window functions** (`ROW_NUMBER()`) to efficiently calculate win streaks for every player without recursion.
* **Problem 4 (Daily Metrics):** This script uses **window functions** and **conditional aggregation** to gather several complex, rank-based metrics for each player in a single query.
* **Problem 5 (Data Assistant Pipeline):** The solution proposes a scalable ETL pipeline using **Apache Spark** for batch processing and a **NoSQL database** (like DynamoDB or Redis) as a low-latency serving layer for the game client.