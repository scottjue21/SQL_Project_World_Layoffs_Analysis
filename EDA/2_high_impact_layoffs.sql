-- Retrieve companies that laid off 100% of their workforce, ordered by funds raised in millions (descending)
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

/* Result Summary:  
-- The company that laid off 100% of employees with the most funds raised was Britishvolt who raised $2.4B  
*/

-- Retrieve companies that laid off 100% of their workforce, ordered by total laid off (descending)
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

/* Result Summary:  
-- The company that laid off 100% of employees with the most total laid off was Katerra who laid off 2,434 employees  
*/