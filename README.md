# Week 7 — DW7_DBT

This repo contains a minimal dbt project set up for Snowflake, with input models, an output model, a snapshot, and column tests.

## Project Structure

```
/mnt/data/dbt_hw_week10/
├── dbt_project.yml
├── models
│   ├── input
│   │   ├── user_session_channel.sql
│   │   └── session_timestamp.sql
│   ├── output
│   │   └── session_summary.sql
│   └── schema.yml
└── snapshots
    └── snapshot_session_summary.sql
```

## 1) Create a dbt project with Snowflake connector

- Ensure you have dbt-snowflake installed:
  ```bash
  pip install dbt-snowflake
  ```

- Example `profiles.yml` entry (adjust credentials):
  ```yaml
  hw7_wau:
    target: dev
    outputs:
      dev:
        type: snowflake
        account: "<account>"
        user: "<user>"
        password: "<password>"
        role: "<role>"
        database: "<database>"
        warehouse: "<warehouse>"
        schema: "<schema>"
        threads: 4
        client_session_keep_alive: false
  ```

- Initialize and run:
  ```bash
  dbt debug
  dbt run
  dbt test
  dbt snapshot
  ```

## 2) Input models (built as CTEs)
- `models/input/user_session_channel.sql` and `models/input/session_timestamp.sql` both use CTEs with inline `values`.

## 3) Output model
- `models/output/session_summary.sql` aggregates timestamps to session level and joins user/channel.

## 4) Snapshot
- `snapshots/snapshot_session_summary.sql` captures changes over time using `strategy: check`.

## 5) Tests
- `models/schema.yml` adds **not_null** and **unique** tests on `SESSION_ID` in `session_summary`.

## Screenshots Checklist (attach in your submission)
- [ ] dbt debug showing Snowflake connection success
- [ ] `dbt run` building input models (views) and output model (table)
- [ ] `dbt test` showing tests on `SESSION_ID` passing
- [ ] `dbt snapshot` creating the snapshot table
- [ ] Snowflake UI showing objects (views, table, snapshot)
- [ ] Code views of the four SQL files and `schema.yml`

## GitHub
1. Create a new GitHub repo (private or public).
2. Copy these files into the repo root preserving structure.
3. Commit and push.
4. Paste the repo link here: **<ADD YOUR LINK HERE>**

---

*Tip:* If your Snowflake account enforces uppercase object names, consider wrapping identifiers with quotes or use lowercase schema/database configs consistently.
