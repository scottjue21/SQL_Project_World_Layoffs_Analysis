-- Standardize the Data

-- it looks like there are some leading spaces in the company column, let's remove them
SELECT company, (TRIM(company))
FROM world_layoffs.layoffs_staging2;

UPDATE world_layoffs.layoffs_staging2
SET company = TRIM(company);


-- I noticed the Crypto has multiple different variations in the industry column. We need to standardize that
SELECT DISTINCT industry
FROM world_layoffs.layoffs_staging2;

UPDATE world_layoffs.layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';


-- it looks like we have some "United States" and some "United States." with a period at the end. We need to standardize this.
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM world_layoffs.layoffs_staging2
ORDER BY 1;

UPDATE world_layoffs.layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';


-- let's also fix the date columns to convert the data type from text to date
-- first I'll use str_to_date to update this field to date format
UPDATE world_layoffs.layoffs_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

-- now we can convert the data type to date
ALTER TABLE world_layoffs.layoffs_staging2
MODIFY COLUMN `date` DATE;