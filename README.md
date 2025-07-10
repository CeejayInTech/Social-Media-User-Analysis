# Social-Media-User-Analysis
## Description:
The purpose of the Social Media analysis is to analyse user interactions on social media platforms. This will enable the tracking of posts, comments, likes, shares, and engagement levels, facilitating in-depth analysis of user engagement, content popularity, and social network influences.
## Objectives:

### objectives for this Social Media Analysis:

Primary Objectives
1. Track user interactions: Analyse user interactions on social media platforms, including posts, comments, likes, shares, and engagement levels.
2. Analyse user engagement: Conduct in-depth analysis of user engagement patterns, including sentiment analysis and net promoter score.
3. Measure content popularity: Evaluate the popularity of content on social media platforms, including reach, impressions, and engagement metrics.
4. Identify social network influences: Analyse the influence of social networks on user behaviour and engagement.
6. Monitor brand performance: Track and analyse mentions of the brand, competitors, and industry-related keywords.
7. Inform content strategy: Use insights from social media analysis to inform content creation, curation, and dissemination strategies.
8. Improve customer engagement: Use social media analysis to identify opportunities to improve customer engagement, respond to customer inquiries, and resolve customer complaints.
9. Benchmark performance: Establish benchmarks for social media performance and track progress over time.

### About the Dataset

#### This machine-generated dataset simulates social media engagement data across various metrics, including likes, shares, comments, impressions, sentiment scores, toxicity, and engagement growth. It is designed for analysis and visualisation of trends, buzz frequency, public sentiment, and user behaviour on digital platforms.
This dataset went through some transformation and standardization before use, which would be perfect for an ETL processing if its for stream analysis.

### Dataset Columns:

post_id	                      nvarchar	50
day_of_week(Days)	            nvarchar	50
platform	                    nvarchar	50
user_id	                      nvarchar	50
language	                    nvarchar	50
text_content	                nvarchar	200
keywords	                    nvarchar	100
topic_category	              nvarchar	50
sentiment_score	              float	
sentiment_label	              nvarchar	50
emotion_type	                nvarchar	50
toxicity_score	              float	
likes_count	                  smallint	
shares_count	                smallint	
comments_count	              smallint	
impressions	                  int	        
engagement_rate	              float	
brand_name	                  nvarchar	50
product_name	                nvarchar	50
campaign_name	                nvarchar	50
campaign_phase	              nvarchar	50
user_past_sentiment_avg	      float	
user_engagement_growth	      float	
buzz_change_rate	            float	
Date_Year	                    date	        
City	                        nvarchar	255
Country	                      nvarchar	255


### The dataset can be used to:

#### Identify spikes or drops in engagement

#### Analyse changes in sentiment over time

#### Build dashboards for digital trend tracking

#### Test algorithms for sentiment analysis or trend prediction

##  Analysis Findings:
The most used App in 2024 is YouTube, followed by Reddit and Twitter.
Platform Usage: YouTube has the highest number of overall users, followed by Facebook and Twitter. It is important to note that they share a close gap in range between 2436 - 2355. 
Platform by Country Usage: In Australia, Facebook is their most used platform while Instagram is the least. In Brazil, Instagram was used more when complaints were lodged about a product. Canada is very profound on YouTube, while Instagram is the least. The use of each platform varies per country, but the USA is significant with the Highest social media activity, as they use YouTube more and Instagram least. Countries like Nigeria, South Africa, Egypt, UAE, Mexico and South Korea have less traffic in the campaign as they registered less than 100 posts on each platform. 
The Analysis also shows the distribution of the emotional status when each post was made. 
Platform Daily Usage: Users tend to use their platform more on weekends, as I noticed a high surge in activity on Friday, Saturday and Sunday. 
Identify social network influence: The analysis also captured the engagement rate of each of the top ten users, showing the number of likes, comments and shares. This was correlated with their impression rate to understand their level of influence in lodging complaints about a product/brand. 
Monitor brand performance: The analysis on products and brands against their sentimental level to depict the rating about a particular product reveals, products like Surface Duo, Sprite  Galaxy Watch have the highest number of Negative remarks, showing how dissatisfied users are with these products. However, users are neutral about some products such as Coca-Cola Vanilla, Crystal Pepsi, Surface Pro and Pepsi Zero Sugar. While products like Coke Zero, Coca-Cola Vanilla, Xbox Series X, Surface Duo, Surface Pro, and Galaxy Watch scored high sentiment, positive remarks indicationg users are happy with these products/Brands. 
On Users' participation in the different marketing campaigns, the USA participated more in the CyberMonday, the UK participated more in WinterWonders and the Holiday Special deals. In Spain, more activity was recorded in the BackToSchool campaign and the Summer Dream Campaign in Canada. Australia has more activity on The CyberMonday.

