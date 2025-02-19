-- 1. Remove Duplicates
-- First let's check for duplicates

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage
, country, funds_raised_millions) AS row_num
FROM world_layoffs.layoffs_staging
)
SELECT *
FROM duplicate_cte
where row_num > 1;

-- these are the ones we want to delete where the row number is > 1 or 2 or greater
-- let's look at Casper to confirm

SELECT *
FROM world_layoffs.layoffs_staging
WHERE company = 'Casper';

-- it is confirmed that Casper has duplicate rows
-- one solution is to create a new column in a new staging table and add those row numbers in. Then delete where row numbers are over 2, then delete that column.

CREATE TABLE `world_layoffs`.`layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO world_layoffs.layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage
, country, funds_raised_millions) AS row_num
FROM world_layoffs.layoffs_staging;

-- checking duplicates in new staging2 table
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE row_num > 1;

-- now that we have this we can delete rows were row_num is greater than 1
DELETE
FROM world_layoffs.layoffs_staging2
WHERE row_num > 1;