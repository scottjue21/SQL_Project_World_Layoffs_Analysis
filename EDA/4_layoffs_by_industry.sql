-- Identify the industries with the highest total layoffs  
-- This helps understand which industries were most affected by layoffs  
-- and provides insight into the scale of workforce reductions for specific industries
SELECT industry, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

/*  
Result Summary:  
The Consumer industry experienced the highest total layoffs, with 45,182 employees affected,  
followed closely by the Retail industry (43,613) and Other category (36,289).  
Industries like Transportation (33,748), Finance (28,344), and Healthcare (25,953) also saw  
significant workforce reductions.

This data provides a broad view of which industries were most impacted,  
highlighting sectors that faced the greatest job losses between March 2020 and March 2023.  
It makes sense that the Consumer and Retail industries had the most layoffs,  
as this time period coincided with COVID-19, which significantly disrupted businesses,  
especially those reliant on in-person interactions.  

Here is the JSON file to verify the results from the query:  

RESULTS  
=======  
[  
  { "industry": "Consumer", "SUM(total_laid_off)": "45182" },  
  { "industry": "Retail", "SUM(total_laid_off)": "43613" },  
  { "industry": "Other", "SUM(total_laid_off)": "36289" },  
  { "industry": "Transportation", "SUM(total_laid_off)": "33748" },  
  { "industry": "Finance", "SUM(total_laid_off)": "28344" },  
  { "industry": "Healthcare", "SUM(total_laid_off)": "25953" },  
  { "industry": "Food", "SUM(total_laid_off)": "22855" },  
  { "industry": "Real Estate", "SUM(total_laid_off)": "17565" },  
  { "industry": "Travel", "SUM(total_laid_off)": "17159" },  
  { "industry": "Hardware", "SUM(total_laid_off)": "13828" }  
  -- (Remaining industries omitted for brevity)  
]  
*/