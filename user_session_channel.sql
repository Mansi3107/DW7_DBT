with data as (
  select
    column1::string as SESSION_ID,
    column2::string as USER_ID,
    column3::string as CHANNEL
  from values
    ('S000001', 'U001', 'mobile'),
    ('S000002', 'U002', 'web'),
    ('S000003', 'U001', 'web'),
    ('S000004', 'U003', 'mobile'),
    ('S000005', 'U004', 'web')
)
select SESSION_ID, USER_ID, CHANNEL
from data

