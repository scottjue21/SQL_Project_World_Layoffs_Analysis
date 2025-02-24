-- Analyze the financial size of companies that laid off 100% of their workforce  
-- This helps determine whether companies with significant funding also faced total layoffs
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

/*
Result Summary:  
The company that laid off 100% of employees with the most funds raised was Britishvolt,  
which had raised $2.4B before going out of business. 
*/

-- Assess whether 100% layoffs were limited to small companies or if large companies also shut down  
-- This query examines total employees laid off to see if large firms were also affected
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

/*
Result Summary:  
The company that laid off 100% of employees with the highest total layoffs was Katerra,  
which laid off 2,434 employees.  
*/