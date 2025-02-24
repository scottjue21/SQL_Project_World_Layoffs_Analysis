-- Identify the companies with the highest total layoffs  
-- This helps understand which companies were most affected by layoffs  
-- and provides insight into the scale of workforce reductions across industries
SELECT company, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;

/*  
Result Summary:  
Amazon had the highest total layoffs with 18,150 employees affected,  
followed by Google (12,000) and Meta (11,000).  
This indicates that even some of the largest and most profitable tech companies  
had to cut significant portions of their workforce.

Here is the JSON file to verify the results from the query:  

RESULTS  
=======  
[  
  { "company": "Amazon", "SUM(total_laid_off)": "18150" },  
  { "company": "Google", "SUM(total_laid_off)": "12000" },  
  { "company": "Meta", "SUM(total_laid_off)": "11000" },  
  { "company": "Salesforce", "SUM(total_laid_off)": "10090" },  
  { "company": "Microsoft", "SUM(total_laid_off)": "10000" },  
  { "company": "Philips", "SUM(total_laid_off)": "10000" },  
  { "company": "Ericsson", "SUM(total_laid_off)": "8500" },  
  { "company": "Uber", "SUM(total_laid_off)": "7585" },  
  { "company": "Dell", "SUM(total_laid_off)": "6650" },  
  { "company": "Booking.com", "SUM(total_laid_off)": "4601" }  
]  
*/