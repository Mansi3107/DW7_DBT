with ts as (
  select
    SESSION_ID,
    min(EVENT_TS) as SESSION_START,
    max(EVENT_TS) as SESSION_END,
    datediff('minute', min(EVENT_TS), max(EVENT_TS)) as DURATION_MINUTES,
    count(*) as EVENT_COUNT
  from {{ ref('session_timestamp') }}
  group by SESSION_ID
),
map as (
  select SESSION_ID, USER_ID, CHANNEL
  from {{ ref('user_session_channel') }}
)
select
  ts.SESSION_ID,
  mp.USER_ID,
  mp.CHANNEL,
  ts.SESSION_START,
  ts.SESSION_END,
  ts.DURATION_MINUTES,
  ts.EVENT_COUNT
from ts ts
left join map mp
  on ts.SESSION_ID = mp.SESSION_ID

