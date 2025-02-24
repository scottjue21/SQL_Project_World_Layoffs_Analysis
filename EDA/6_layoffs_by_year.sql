-- Calculate the total layoffs per year and order by year in descending order  
-- This helps track annual layoff trends and identify periods of significant workforce reductions
SELECT YEAR(`date`), SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

/*  
Result Summary:  
This data provides an overview of yearly layoffs from 2020 to 2023.  
The highest number of layoffs occurred in 2022, followed closely by 2023.  
There was a significant drop in layoffs in 2021 compared to 2020,  
but layoffs surged again in the following years, indicating ongoing job market fluctuations.  

Notably, 2023 only includes about two months of data, yet the number of layoffs is already  
alarmingly high. If the trend continues, 2023 would surpass 2022 in total layoffs.  

The sharp rise in layoffs in both 2022 and 2023 could also pose challenges for job seekers like myself,  
as the increase in displaced workers has resulted in a larger candidate pool, intensifying competition  
in the job market.  

Here is the JSON file to verify the results from the query:  

RESULTS  
=======  
[  
  { "YEAR(`date`)": 2023, "SUM(total_laid_off)": "125677" },  
  { "YEAR(`date`)": 2022, "SUM(total_laid_off)": "160661" },  
  { "YEAR(`date`)": 2021, "SUM(total_laid_off)": "15823" },  
  { "YEAR(`date`)": 2020, "SUM(total_laid_off)": "80998" }  
]  
*/