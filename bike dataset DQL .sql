SELECT
  3;
SELECT
  3 AS num;
SELECT
  'python' AS language_;
SELECT
  3 AS number,
  'python' AS lang,
  4.5 AS rating;
CREATE TABLE
  DQL.bike AS (
  SELECT
    *
  FROM
    `bigquery-public-data.london_bicycles.cycle_hire`
  LIMIT
    1000);
SELECT
  *
FROM
  DQL.bike;
SELECT
  rental_id,
  duration,
  start_date,
  end_date
FROM
  DQL.bike
LIMIT
  5;
SELECT
  rental_id,
  start_station_id,
  end_station_name
FROM
  DQL.bike;
SELECT
  DISTINCT *
FROM
  DQL.bike;
SELECT
  * EXCEPT (end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id)
FROM
  DQL.bike;
SELECT
  * REPLACE (duration /60 AS duration)
FROM
  DQL.bike;
SELECT
  * EXCEPT (end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id) REPLACE (duration / 60 AS DURATION)
FROM
  DQL.bike;
SELECT
  * EXCEPT (end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id) REPLACE (duration / 60 AS DURATION)
FROM
  DQL.bike
WHERE
  end_station_id=512;
SELECT
  * EXCEPT (end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id) REPLACE (duration / 60 AS DURATION)
FROM
  DQL.bike
WHERE
  1=1;
SELECT
  * EXCEPT (end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id) REPLACE (duration / 60 AS DURATION)
FROM
  DQL.bike
WHERE
  duration/60 >300;
SELECT
  * EXCEPT (end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id) REPLACE (duration / 60 AS DURATION)
FROM
  DQL.bike
WHERE
  end_station_id=512
  OR end_station_id=700;
SELECT
  * EXCEPT (end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id) REPLACE (duration / 60 AS DURATION)
FROM
  DQL.bike
WHERE
  end_station_id=512
  AND (duration/60)>10;
SELECT
  * EXCEPT (end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id) REPLACE (duration / 60 AS DURATION)
FROM
  DQL.bike
WHERE
  end_station_id NOT IN (512,
    700,
    257,
    259);
SELECT
  * EXCEPT (end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id) REPLACE (duration / 60 AS DURATION)
FROM
  DQL.bike
WHERE
  duration/60 BETWEEN 30
  AND 35;
SELECT
  * EXCEPT (end_station_logical_terminal,
    start_station_logical_terminal,
    end_station_priority_id) REPLACE (duration / 60 AS DURATION)
FROM
  DQL.bike
WHERE
  start_date BETWEEN '2015-04-01'
  AND '2015-04-07';
  
SELECT
  COUNT(end_station_id) as count_row
FROM
  DQL.bike;
  
SELECT
  end_station_id,
  count(end_station_id) as count_station
FROM
  DQL.bike
GROUP BY
  end_station_id;
  
SELECT
  end_station_id,
  count(end_station_id) as count_station
FROM
  DQL.bike
GROUP BY
  end_station_id
ORDER BY
  count_station;
  
SELECT
  end_station_id,
  end_station_name,
  count(*) as count_station
FROM
  DQL.bike
WHERE
  duration>50
GROUP BY
  end_station_id,
  end_station_name
ORDER BY
  count_station DESC
LIMIT
  20;

--SELECT--FROM--WHERE--GROUP BY--HAVING--ORDER BY--LIMIT--OFFSET

SELECT
  end_station_id,
  end_station_name,
  count(*) as count_station
FROM
  DQL.bike
WHERE
  duration>50
GROUP BY
  end_station_id,
  end_station_name
HAVING
  count_station>=7
ORDER BY
  count_station DESC;
  
SELECT
  end_station_id,
  end_station_name,
  count(*) as count_station
FROM
  DQL.bike
WHERE
  duration>50
GROUP BY
  end_station_id,
  end_station_name
HAVING
  count_station>=5
ORDER BY
  count_station DESC
LIMIT
  10
OFFSET
  3;
  
SELECT
  SUM(duration) AS total_seconds,
  MIN(duration) AS min_duration,
  MAX(duration) AS max_duration,
  AVG(duration) AS avg_duration
FROM
  DQL.bike;

SELECT
  SUM(duration/60) AS total_seconds,
  MIN(duration/60) AS min_duration,
  MAX(duration/60) AS max_duration,
  AVG(duration/60) AS avg_duration
FROM
  DQL.bike;
  
SELECT
  EXTRACT(YEAR FROM start_date) AS year,
  SUM(duration/60) AS total_seconds,
  MIN(duration/60) AS min_duration,
  MAX(duration/60) AS max_duration,
  AVG(duration/60) AS avg_duration,
  COUNT(duration) AS count_duration
FROM
  DQL.bike
GROUP BY
  year
ORDER BY
  year;
  
SELECT
  EXTRACT(YEAR FROM start_date) AS year,
  EXTRACT(MONTH FROM start_date) AS month,
  SUM(duration/60) AS total_seconds,
  MIN(duration/60) AS min_duration,
  MAX(duration/60) AS max_duration,
  AVG(duration/60) AS avg_duration,
  COUNT(duration) AS count_duration
FROM
  DQL.bike
GROUP BY
  year,month
ORDER BY
  year,month;
  
SELECT
  EXTRACT(YEAR FROM start_date) AS year,
  EXTRACT(MONTH FROM start_date) AS month,
  SUM(duration/60) AS total_seconds,
  MIN(duration/60) AS min_duration,
  MAX(duration/60) AS max_duration,
  AVG(duration/60) AS avg_duration,
  COUNT(duration) AS total_number_of_rentals
FROM
  DQL.bike
GROUP BY
  year,month
HAVING 
  total_number_of_rentals>=40
ORDER BY
  year,month;
  
SELECT
  *
FROM
  DQL.google
WHERE
  close BETWEEN 500 AND 700;
  
SELECT
  *
FROM
  DQL.google
WHERE
  close NOT BETWEEN 500 AND 700;
  
SELECT
  EXTRACT(YEAR FROM date) AS year,
  EXTRACT(MONTH FROM date) AS month,
  SUM(close) AS total_close,
  MIN(close) AS min_close,
  MAX(close) AS max_close,
  AVG(close) AS avg_close,
FROM
  DQL.google
GROUP BY
  year,month
ORDER BY
  year,month;
  
CREATE TABLE DQL.movies (
  movie_id INT64,
  movie_names STRING,
  rating FLOAT64
);

INSERT INTO DQL.movies VALUES (1,'Batman',4.5);
INSERT INTO DQL.movies VALUES (2,'W pustyni i w puszczy',2.1);

SELECT
  *
FROM
  DQL.movies
WHERE
  movie_names NOT LIKE '%man';
  
SELECT
  *
FROM
  DQL.movies
WHERE
  movie_names LIKE '___man';
  
SELECT 
  *
FROM
  DQL.bike
ORDER BY
  duration DESC
LIMIT 
  3;
  
SELECT 
  *
FROM
  DQL.bike
ORDER BY
  duration DESC
LIMIT 
  3
OFFSET
  3;

SELECT 
  *
FROM
  DQL.bike
ORDER BY
  5 DESC,
  2 DESC;
  
CREATE OR REPLACE TABLE DQL.01_tab (
  id STRING NOT NULL,
  age INT64,
  name STRING
);

INSERT INTO DQL.01_tab VALUES ('001',22,'Mark');
INSERT INTO DQL.01_tab VALUES ('002',22,'Paul');
INSERT INTO DQL.01_tab VALUES ('003',22,'Zenny');

CREATE OR REPLACE TABLE DQL.02_tab (
  id STRING NOT NULL,
  age INT64,
  name STRING
);

INSERT INTO DQL.02_tab VALUES ('001',22,'Mark');
INSERT INTO DQL.02_tab VALUES ('002',22,'Paul');
INSERT INTO DQL.02_tab VALUES ('003',23,'Tom');
INSERT INTO DQL.02_tab VALUES ('007',23,'Tom');

SELECT
  *
FROM
  DQL.01_tab
  
UNION DISTINCT
  
SELECT
  *
FROM
  DQL.02_tab
  
  
  
  
  
  