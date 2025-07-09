--CREATE DATABASE Social_Media_EDA;

--Converting the TimeStamp Column as setting to a New Column

ALTER  TABLE Social_Media_Dataset
ADD Date_Year Date

select timestamp, CONVERT(date,timestamp)
from Social_Media_Dataset

UPDATE Social_Media_Dataset
SET Date_Year = CONVERT(date,timestamp)


--Delete Duplicates

WITH DUPLCTE AS(
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY 
   post_id,
   Date_year,
   city,
   country,
   platform,
   language
   ORDER BY user_id
) as Duplicates
FROM Social_Media_Dataset
) 
SELECT *
FROM DUPLCTE
WHERE Duplicates > 1  --NO DUPLICATE ROWS IN THE TABLE


--Delimiting the substring in Location

SELECT SUBSTRING(location, 1, CHARINDEX(',', location) - 1) as City,
       SUBSTRING(location, CHARINDEX(',', location) + 1, LEN(location)) AS Country
      
FROM Social_Media_Dataset
WHERE 
       CHARINDEX(',', location) > 0;

ALTER TABLE Social_Media_Dataset
ADD City nvarchar(255)

UPDATE Social_Media_Dataset
SET City = SUBSTRING(location, 1, CHARINDEX(',', location) - 1)
WHERE 
       CHARINDEX(',', location) > 0;

ALTER TABLE Social_Media_Dataset
ADD Country nvarchar(255)

UPDATE Social_Media_Dataset
SET Country = SUBSTRING(location, CHARINDEX(',', location) + 1, LEN(location))
WHERE 
       CHARINDEX(',', location) > 0;


--Converting the ISO Language codes to Language name

UPDATE Social_Media_Dataset
SET language = CASE
     WHEN language = 'ar' THEN 'Arabic'
     WHEN language = 'de' THEN 'German'
     WHEN language = 'en' THEN 'English'
     WHEN language = 'es' THEN 'Spanish'
     WHEN language = 'fr' THEN 'French'
     WHEN language = 'hi' THEN 'Hindi'
     WHEN language = 'ja' THEN 'Japanese'
     WHEN language = 'pt' THEN 'Portuguese'
     WHEN language = 'ru' THEN 'Russian'
     WHEN language = 'zh' THEN 'chinese'
ELSE language
    END 
from Social_Media_Dataset

--Dropping unwanted Columns from the Dataset

ALTER TABLE Social_Media_Dataset
DROP COLUMN timestamp, location, hashtags, mentions

--Renaming Columns

EXEC sp_rename 'Social_Media_Dataset.day_of_week', 'Days', 'COLUMN';


select *
from Social_Media_Dataset