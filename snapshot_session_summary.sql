{% snapshot snapshot_session_summary %}
{{
  config(
    target_database=target.database,
    target_schema=target.schema,
    unique_key='SESSION_ID',
    strategy='check',
    check_cols='all'
  )
}}
select * from {{ ref('session_summary') }}
{% endsnapshot %}

