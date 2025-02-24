-- Calculate the total layoffs per company stage and order by the highest layoffs  
-- This query helps identify which funding stages experience the most layoffs
SELECT stage, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

/*  
Result Summary:  
This query provides insight into how layoffs are distributed across different company stages, highlighting where the largest workforce reductions have occurred.  

Key Observations:  
- Post-IPO companies account for the most layoffs (204,132), likely due to public market pressures.

- Late-stage startups (Series B–D) also see significant layoffs, suggesting challenges in scaling profitably.

- Acquired companies have the thrid most amount of layoffs, possibly due to restructuring.  

Here is the JSON file to verify the results from the query:  

RESULTS  
=======  
[  
  { "stage": "Post-IPO", "SUM(total_laid_off)": "204132" },  
  { "stage": "Unknown", "SUM(total_laid_off)": "40716" },  
  { "stage": "Acquired", "SUM(total_laid_off)": "27576" },  
  { "stage": "Series C", "SUM(total_laid_off)": "20017" },  
  { "stage": "Series D", "SUM(total_laid_off)": "19225" },  
  { "stage": "Series B", "SUM(total_laid_off)": "15311" },  
  { "stage": "Series E", "SUM(total_laid_off)": "12697" },  
  { "stage": "Series F", "SUM(total_laid_off)": "9932" },  
  { "stage": "Private Equity", "SUM(total_laid_off)": "7957" },  
  { "stage": "Series H", "SUM(total_laid_off)": "7244" },  
  { "stage": "Series A", "SUM(total_laid_off)": "5678" },  
  { "stage": "Series G", "SUM(total_laid_off)": "3697" },  
  { "stage": "Series J", "SUM(total_laid_off)": "3570" },  
  { "stage": "Series I", "SUM(total_laid_off)": "2855" },  
  { "stage": "Seed", "SUM(total_laid_off)": "1636" },  
  { "stage": "Subsidiary", "SUM(total_laid_off)": "1094" },  
  { "stage": null, "SUM(total_laid_off)": "322" }  
]  
*/


-- Since Post-IPO are typically larger companies with more employess,
-- so this could explain the large number of layoffs.
-- I want to investigate the average percentage of employees laid off per company stage to provide a better picture of the relative impact. 
SELECT stage, AVG(percentage_laid_off)
FROM world_layoffs.layoffs_staging2
WHERE percentage_laid_off IS NOT NULL
AND stage IS NOT NULL
GROUP BY stage
ORDER BY 2 DESC;

/*
RESULTS SUMMARY:
The analysis of the average percentage of layoffs across different company stages reveals that early-stage startups experience the highest layoff percentages, while larger, more established companies tend to have lower percentages.
This suggests that while Post-IPO companies have the highest total layoffs, the impact on their overall workforce is relatively smaller.
This confirms that looking at the percentage laid off provides a clearer picture of impact, as total layoffs alone can be misleading.

KEY OBSERVATIONS:
- Seed-stage companies have the highest average percentage of layoffs (~70%), indicating extreme volatility in early-stage startups.
- Series A and Series B companies also have relatively high layoff percentages (~38% and ~32%), suggesting that layoffs remain a significant risk in early-stage growth.
- Post-IPO companies, despite having the highest total layoffs, have a much lower average percentage (~16%), supporting the idea that their larger workforce absorbs layoffs more proportionally.
- Private Equity-backed and Acquired companies have moderate layoff percentages (~16-30%), likely due to restructuring efforts.
- Later-stage startups (Series C and beyond) tend to have lower average layoff percentages, indicating more stability compared to earlier funding stages.
- Subsidiaries experience the lowest layoff percentages (~5.7%), likely benefiting from their parent company’s resources.

RESULTS:
[
  {
    "stage": "Seed",
    "AVG(percentage_laid_off)": 0.7017
  },
  {
    "stage": "Series A",
    "AVG(percentage_laid_off)": 0.3840
  },
  {
    "stage": "Series B",
    "AVG(percentage_laid_off)": 0.3222
  },
  {
    "stage": "Unknown",
    "AVG(percentage_laid_off)": 0.3136
  },
  {
    "stage": "Acquired",
    "AVG(percentage_laid_off)": 0.3074
  },
  {
    "stage": "Series C",
    "AVG(percentage_laid_off)": 0.2390
  },
  {
    "stage": "Series D",
    "AVG(percentage_laid_off)": 0.1836
  },
  {
    "stage": "Series E",
    "AVG(percentage_laid_off)": 0.1828
  },
  {
    "stage": "Series G",
    "AVG(percentage_laid_off)": 0.1608
  },
  {
    "stage": "Private Equity",
    "AVG(percentage_laid_off)": 0.1590
  },
  {
    "stage": "Post-IPO",
    "AVG(percentage_laid_off)": 0.1577
  },
  {
    "stage": "Series J",
    "AVG(percentage_laid_off)": 0.1425
  },
  {
    "stage": "Series F",
    "AVG(percentage_laid_off)": 0.1395
  },
  {
    "stage": "Series H",
    "AVG(percentage_laid_off)": 0.1360
  },
  {
    "stage": "Series I",
    "AVG(percentage_laid_off)": 0.0967
  },
  {
    "stage": "Subsidiary",
    "AVG(percentage_laid_off)": 0.0567
  }
]
*/