-- Calculate the total layoffs per month and order chronologically
-- This helps track monthly layoff trends and identify patterns in workforce reductions
SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL 
GROUP BY `MONTH`
ORDER BY 1 ASC;

/*  
Result Summary:  
This query provides a month-by-month breakdown of layoffs, highlighting the clustered nature of large layoffs.

Key Observations:   
  - Layoffs generally occur in 3-4 month clusters, with some months showing significant spikes in the total number of layoffs. These clusters may be influenced by various factors such as economic conditions, company performance, and industry-wide events.  
  - After months with lower layoff counts, a spike in layoffs often signals the possibility of more layoffs in the coming months. This trend suggests that organizations may be planning or responding to ongoing restructuring, cost-cutting, or strategic shifts.
  - For instance, after a quiet period of layoffs (e.g., a few months of relatively low layoffs), the data shows larger increases, often indicating that an upward trend in layoffs is emerging.

- Implications for Job Seekers:  
  - Job seekers should be aware that following a period of low layoffs, an increase in layoffs could lead to heightened competition in the job market. If layoffs pick up after a quiet spell, job seekers may find more candidates entering the market, creating additional competition.

Here is the JSON file to verify the results from the query:  

RESULTS  
=======  
[  
  { "MONTH": "2020-03", "SUM(total_laid_off)": "9628" },  
  { "MONTH": "2020-04", "SUM(total_laid_off)": "26710" },  
  { "MONTH": "2020-05", "SUM(total_laid_off)": "25804" },  
  { "MONTH": "2020-06", "SUM(total_laid_off)": "7627" },  
  { "MONTH": "2020-07", "SUM(total_laid_off)": "7112" },  
  { "MONTH": "2020-08", "SUM(total_laid_off)": "1969" },  
  { "MONTH": "2020-09", "SUM(total_laid_off)": "609" },  
  { "MONTH": "2020-10", "SUM(total_laid_off)": "450" },  
  { "MONTH": "2020-11", "SUM(total_laid_off)": "237" },  
  { "MONTH": "2020-12", "SUM(total_laid_off)": "852" },  
  { "MONTH": "2021-01", "SUM(total_laid_off)": "6813" },  
  { "MONTH": "2021-02", "SUM(total_laid_off)": "868" },  
  { "MONTH": "2021-03", "SUM(total_laid_off)": "47" },  
  { "MONTH": "2021-04", "SUM(total_laid_off)": "261" },  
  { "MONTH": "2021-06", "SUM(total_laid_off)": "2434" },  
  { "MONTH": "2021-07", "SUM(total_laid_off)": "80" },  
  { "MONTH": "2021-08", "SUM(total_laid_off)": "1867" },  
  { "MONTH": "2021-09", "SUM(total_laid_off)": "161" },  
  { "MONTH": "2021-10", "SUM(total_laid_off)": "22" },  
  { "MONTH": "2021-11", "SUM(total_laid_off)": "2070" },  
  { "MONTH": "2021-12", "SUM(total_laid_off)": "1200" },  
  { "MONTH": "2022-01", "SUM(total_laid_off)": "510" },  
  { "MONTH": "2022-02", "SUM(total_laid_off)": "3685" },  
  { "MONTH": "2022-03", "SUM(total_laid_off)": "5714" },  
  { "MONTH": "2022-04", "SUM(total_laid_off)": "4128" },  
  { "MONTH": "2022-05", "SUM(total_laid_off)": "12885" },  
  { "MONTH": "2022-06", "SUM(total_laid_off)": "17394" },  
  { "MONTH": "2022-07", "SUM(total_laid_off)": "16223" },  
  { "MONTH": "2022-08", "SUM(total_laid_off)": "13055" },  
  { "MONTH": "2022-09", "SUM(total_laid_off)": "5881" },  
  { "MONTH": "2022-10", "SUM(total_laid_off)": "17406" },  
  { "MONTH": "2022-11", "SUM(total_laid_off)": "53451" },  
  { "MONTH": "2022-12", "SUM(total_laid_off)": "10329" },  
  { "MONTH": "2023-01", "SUM(total_laid_off)": "84714" },  
  { "MONTH": "2023-02", "SUM(total_laid_off)": "36493" },  
  { "MONTH": "2023-03", "SUM(total_laid_off)": "4470" }  
]  
*/