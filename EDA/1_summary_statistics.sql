-- Get the maximum number of layoffs and the maximum percentage of employees laid off to understand the magnitude of the workfoce reduction at any one time
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM world_layoffs.layoffs_staging2;

/*  
Result Summary:  
The highest number of employees laid off by a single company was 12,000.  
The highest percentage of workforce reduction recorded was 100% (full layoffs).  

Here is the JSON file to verify the results from the query:  

RESULTS  
=======  
[  
  {  
    "MAX(total_laid_off)": 12000,  
    "MAX(percentage_laid_off)": "1"  
  }  
]  
*/  

-- Find the earliest and latest layoff dates in the dataset to understand the time period
SELECT MIN(`date`), MAX(`date`)
FROM world_layoffs.layoffs_staging2;

/* 
Result Summary:  
The earliest recorded layoff in the dataset occurred on March 11, 2020.  
The most recent recorded layoff in the dataset occurred on March 6, 2023.

Here is the JSON file to verify the results from the query:

RESULTS
=======
[
  {
    "MIN(`date`)": "2020-03-11",
    "MAX(`date`)": "2023-03-06"
  }
]
*/
