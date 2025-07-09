--YEARLY TRENDS/PERFOMANCE OF PLATFORMS

SELECT 
    YEAR(Date_Year) AS year_extracted, platform, COUNT(platform) YearlyTrends
FROM 
    Social_Media_Dataset
GROUP BY PLATFORM, YEAR(Date_Year)
ORDER BY YearlyTrends DESC


--PLATFORM EMOTIONAL TRENDS

SELECT 
    platform, emotion_type, COUNT(emotion_type) AS EmotionalStatus
FROM 
    Social_Media_Dataset
GROUP BY platform, emotion_type
ORDER BY 3 DESC

--COUNTRY EMOTIONAL TRENDS

SELECT 
    country, emotion_type, COUNT(emotion_type) AS EmotionStatus
FROM 
    Social_Media_Dataset
	WHERE country IS NOT NULL
GROUP BY country, emotion_type
ORDER BY 3 DESC


--Top 10 Users with the highest Impression.

SELECT TOP 10
    user_id,
	post_id,
	SUM(impressions) as ImpressionRate
FROM 
    Social_Media_Dataset
GROUP BY user_id,
    post_id,
	impressions
ORDER BY ImpressionRate DESC;


--Brands with the Highest Impressions

SELECT TOP 10
    brand_name, 
	product_name,
	likes_count,
	comments_count,
	shares_count,
	SUM(impressions) as ImpressionRate
FROM 
    Social_Media_Dataset
GROUP BY brand_name,
    product_name,
    likes_count, 
	comments_count,
	shares_count
ORDER BY ImpressionRate DESC;


--Days with the most use of platfrom

SELECT 
     Days,
	 platform,
	 COUNT(platform) as WeeklyUse
FROM 
    Social_Media_Dataset
GROUP BY Days, 
    platform
ORDER BY WeeklyUse DESC;

--Proucts by sentiment level

SELECT TOP 10
    product_name,
	sentiment_label,
	COUNT(sentiment_label)  as SentimentType
FROM 
    Social_Media_Dataset
WHERE sentiment_label = 'Positive'
GROUP BY sentiment_label, 
    product_name
ORDER BY SentimentType  DESC;

 
SELECT TOP 10
    product_name,
	sentiment_label,
	COUNT(sentiment_label)  as SentimentType
FROM 
    Social_Media_Dataset
WHERE sentiment_label = 'Negative'
GROUP BY sentiment_label, 
    product_name
ORDER BY SentimentType  DESC;


SELECT TOP 10
    product_name,
	sentiment_label,
	COUNT(sentiment_label)  as SentimentType
FROM 
    Social_Media_Dataset
WHERE sentiment_label = 'Neutral'
GROUP BY sentiment_label, 
    product_name
ORDER BY SentimentType  DESC;

--OR WITH A "WITH" STATEMENT

WITH SentimentCounts AS (
    SELECT 
        product_name,
        sentiment_label,
        COUNT(*) AS SentimentType,
        ROW_NUMBER() OVER (PARTITION BY sentiment_label 
	ORDER BY COUNT(*) DESC) AS rn
    FROM 
        Social_Media_Dataset
    GROUP BY 
        product_name, sentiment_label
)
SELECT 
    product_name,
    sentiment_label,
    SentimentType
FROM 
    SentimentCounts
WHERE 
    rn <= 10
ORDER BY 
    sentiment_label, SentimentType DESC;

--Country engagement in Campaign name
SELECT 
    Country,
	campaign_name,
	COUNT(*) CountryParticipation
FROM 
    Social_Media_Dataset
WHERE Country IS NOT NULL
GROUP BY Country,
	campaign_name
ORDER BY CountryParticipation DESC;

--Can we get the most trendy Keywords?

--Split keywords by comma
WITH SplitKeywords AS (
    SELECT 
        TRIM(value) AS keyword
    FROM 
        Social_Media_Dataset
    CROSS APPLY STRING_SPLIT(keywords, ',')
)
SELECT TOP 20
    keyword,
    COUNT(*) AS counts
FROM 
    SplitKeywords
GROUP BY 
    keyword
ORDER BY 
    counts DESC;

SELECT 
    YEAR(Date_Year),
	AVG(Sentiment_score) as AverageSentiment,
	MIN(Sentiment_score) as MinimumSentiment,
	MAX(Sentiment_score) as MaximumSentiment
FROM 
    Social_Media_Dataset
GROUP BY YEAR(Date_Year)

--Determine the Mood of the user with each product

WITH MoodType AS (
    SELECT 
        product_name,
        topic_category,
        emotion_type,
        COUNT(*) AS UserMood,
        ROW_NUMBER() OVER (
            PARTITION BY topic_category, emotion_type
            ORDER BY COUNT(*) DESC
        ) AS Em
    FROM 
        Social_Media_Dataset
    GROUP BY 
        product_name, topic_category, emotion_type
)
SELECT 
    product_name,
    topic_category,
    emotion_type,
    UserMood
FROM 
    moodType
WHERE 
    Em <= 10
ORDER BY 
    topic_category, emotion_type, UserMood DESC;

