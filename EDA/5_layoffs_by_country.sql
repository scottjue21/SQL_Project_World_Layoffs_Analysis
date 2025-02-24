-- Calculate the total layoffs per country and order by the highest layoffs  
-- This helps identify which countries experienced the most workforce reductions  
-- and provides insight into global layoff trends
SELECT country, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

/*  
Result Summary:   
The United States had the highest number of layoffs, followed by India and the Netherlands.  
Understanding layoff trends by country can highlight broader economic shifts  
and workforce challenges during this period.

Here is the JSON file to verify the results from the query:  

RESULTS  
=======  
[  
  { "country": "United States", "SUM(total_laid_off)": "256559" },  
  { "country": "India", "SUM(total_laid_off)": "35993" },  
  { "country": "Netherlands", "SUM(total_laid_off)": "17220" },  
  { "country": "Sweden", "SUM(total_laid_off)": "11264" },  
  { "country": "Brazil", "SUM(total_laid_off)": "10391" },  
  { "country": "Germany", "SUM(total_laid_off)": "8701" },  
  { "country": "United Kingdom", "SUM(total_laid_off)": "6398" },  
  { "country": "Canada", "SUM(total_laid_off)": "6319" },  
  { "country": "Singapore", "SUM(total_laid_off)": "5995" },  
  { "country": "China", "SUM(total_laid_off)": "5905" }  
  -- (Remaining countries omitted for brevity)  
]  
*/