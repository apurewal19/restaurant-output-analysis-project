-- Staff Time and Cost Report: calculates hours worked per shift and total staff cost
SELECT
  r.date,                                             -- Shift date
  s.first_name,                                       -- Staff first name
  s.last_name,                                        -- Staff last name
  s.hourly_rate,                                      -- Staff hourly pay rate
  sh.start_time,                                      -- Shift start time
  sh.end_time,                                        -- Shift end time
  ((HOUR(TIMEDIFF(sh.end_time, sh.start_time)) * 60) + (MINUTE(TIMEDIFF(sh.end_time, sh.start_time)))) / 60 AS hours_in_shift,                 -- Hours worked
  (((HOUR(TIMEDIFF(sh.end_time, sh.start_time)) * 60) + (MINUTE(TIMEDIFF(sh.end_time, sh.start_time)))) / 60) * s.hourly_rate AS staff_cost    -- Total labour cost for the shift
FROM
  rota r
  LEFT JOIN staff s ON r.staff_id = s.staff_id        -- Match shift to staff member
  LEFT JOIN shift sh ON r.shift_id = sh.shift_id;     -- Match rota to shift times
