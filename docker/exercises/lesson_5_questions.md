## Practice Questions

### Lesson 5

1. Create a table named `events` with columns:

- `event_id` (primary key, auto increment)  
- `event_name` (VARCHAR)  
- `event_datetime` (DATETIME)  
- `created_at` (TIMESTAMP, default current timestamp)  

```sql
CREATE TABLE events(
event_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
event_name VARCHAR(50),
event_datetime DATETIME,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
```

---

2. Insert a new event named `'Conference'` happening at `'2025-08-15 10:00:00'` into the `events` table.

```sql
INSERT INTO events(event_name, event_datetime)
VALUES ('Conference', '2025-08-15 10:00:00');
```

---

3. Write a query to select all events and show the `event_datetime` in UTC and also converted to `'Asia/Jerusalem'` time zone.

```sql
SELECT 
  event_id,
  event_name,
  event_datetime AS event_utc,
  CONVERT_TZ(event_datetime, 'UTC', 'Asia/Jerusalem') AS event_jerusalem
FROM events;
```

---

4. Write a query to find how many hours are between the current UTC time and the event time (in UTC) for each event.

```sql

SELECT 
  event_id,
  event_name,
  event_datetime AS event_utc,
  UTC_TIMESTAMP() AS current_utc,
  TIMESTAMPDIFF(HOUR, UTC_TIMESTAMP(), event_datetime) AS hours_until_event
FROM events;
```
---

5. Write a query to select events where the `event_datetime` is in the future (greater than current time).

```sql
SELECT 
  event_id,
  event_name,
  event_datetime AS event_utc
FROM events
WHERE event_datetime > UTC_TIMESTAMP();
```

### 6. Write a query to add 3 days to the `event_datetime` of all events and show the result without changing the stored data.

```sql
```

---

### 7. Write a query to format the time difference between `created_at` and `event_datetime` as `HH:MM:SS` for each event.

---

### 8. Write a query to update the `event_datetime` for event with `event_id = 1` by subtracting 2 hours.

---

### 9. Write a query that shows the current date and time in three different time zones: UTC, `'Asia/Jerusalem'`, and `'America/New_York'`.

---

### 10. Write a query to delete events where the `event_datetime` was more than 1 year ago.

---