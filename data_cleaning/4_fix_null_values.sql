-- Fixing Null Values or Blank Values

-- I've noticed there are many nulls in the total_laid_off and percentage_laid_off columns, so I will check those first
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL;

SELECT *
FROM world_layoffs.layoffs_staging2
WHERE percentage_laid_off IS NULL;

-- the null values in total_laid_off and percentage_laid_off all look normal, so I don't want to change that
-- now I'll check to see rows with nulls in both total_laid_off and percentage_laid_off
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- these rows might not provide any value to our analysis since there is no layoff data, we can potentially remove these rows in a later step

--let's check the nulss in funds_raised_millions
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE funds_raised_millions IS NULL;

--these look fairly normal as well, so I'll leave them as is


-- if we look at industry, it looks like we have some null and empty rows, let's take a look at these
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE industry IS NULL
OR industry = '';

-- we should set the blanks to nulls since those are typically easier to work with
UPDATE world_layoffs.layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- Airbnb industry is showing null value, let's check to see if there are other rows for Airbnb
SELECT *
FROM world_layoffs.ayoffs_staging2
WHERE company = 'Airbnb';

-- it looks like airbnb is a travel, but the industry for this row just isn't populated
-- we can write a query that if there is another row with the same company name, it will update it to the non-null industry values
SELECT t1.industry, t2.industry
FROM world_layoffs.layoffs_staging2 t1
JOIN world_layoffs.layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

-- now we need to populate those nulls if possible
UPDATE world_layoffs.layoffs_staging2 t1
JOIN world_layoffs.layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;