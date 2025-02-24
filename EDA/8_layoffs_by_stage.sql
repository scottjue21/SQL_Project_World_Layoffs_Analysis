-- Calculate the total layoffs per company stage and order by the highest layoffs  
-- This query helps identify which funding stages experience the most layoffs
SELECT stage, SUM(total_laid_off) AS 'Total Laid Off'
FROM world_layoffs.layoffs_staging2
WHERE stage IS NOT NULL
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
  {
    "stage": "Post-IPO",
    "Total Laid Off": "204132"
  },
  {
    "stage": "Unknown",
    "Total Laid Off": "40716"
  },
  {
    "stage": "Acquired",
    "Total Laid Off": "27576"
  },
  {
    "stage": "Series C",
    "Total Laid Off": "20017"
  },
  {
    "stage": "Series D",
    "Total Laid Off": "19225"
  },
  {
    "stage": "Series B",
    "Total Laid Off": "15311"
  },
  {
    "stage": "Series E",
    "Total Laid Off": "12697"
  },
  {
    "stage": "Series F",
    "Total Laid Off": "9932"
  },
  {
    "stage": "Private Equity",
    "Total Laid Off": "7957"
  },
  {
    "stage": "Series H",
    "Total Laid Off": "7244"
  },
  {
    "stage": "Series A",
    "Total Laid Off": "5678"
  },
  {
    "stage": "Series G",
    "Total Laid Off": "3697"
  },
  {
    "stage": "Series J",
    "Total Laid Off": "3570"
  },
  {
    "stage": "Series I",
    "Total Laid Off": "2855"
  },
  {
    "stage": "Seed",
    "Total Laid Off": "1636"
  },
  {
    "stage": "Subsidiary",
    "Total Laid Off": "1094"
  }
]
*/


-- Since Post-IPO are typically larger companies with more employess,
-- so this could explain the large number of layoffs.
-- I want to investigate the average percentage of employees laid off per company stage to provide a better picture of the relative impact. 
SELECT stage, AVG(percentage_laid_off) AS 'Average Percent Laid Off'
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
=======
[
  {
    "stage": "Seed",
    "Average Percent Laid Off": 0.7017021276595745
  },
  {
    "stage": "Series A",
    "Average Percent Laid Off": 0.3839639639639637
  },
  {
    "stage": "Series B",
    "Average Percent Laid Off": 0.3221596244131453
  },
  {
    "stage": "Unknown",
    "Average Percent Laid Off": 0.31364754098360664
  },
  {
    "stage": "Acquired",
    "Average Percent Laid Off": 0.30740229885057463
  },
  {
    "stage": "Series C",
    "Average Percent Laid Off": 0.23902061855670093
  },
  {
    "stage": "Series D",
    "Average Percent Laid Off": 0.18362275449101795
  },
  {
    "stage": "Series E",
    "Average Percent Laid Off": 0.18279069767441847
  },
  {
    "stage": "Series G",
    "Average Percent Laid Off": 0.1607692307692308
  },
  {
    "stage": "Private Equity",
    "Average Percent Laid Off": 0.15896551724137933
  },
  {
    "stage": "Post-IPO",
    "Average Percent Laid Off": 0.15766504854368943
  },
  {
    "stage": "Series J",
    "Average Percent Laid Off": 0.1425
  },
  {
    "stage": "Series F",
    "Average Percent Laid Off": 0.13948717948717948
  },
  {
    "stage": "Series H",
    "Average Percent Laid Off": 0.136
  },
  {
    "stage": "Series I",
    "Average Percent Laid Off": 0.09666666666666668
  },
  {
    "stage": "Subsidiary",
    "Average Percent Laid Off": 0.05666666666666666
  }
]
*/