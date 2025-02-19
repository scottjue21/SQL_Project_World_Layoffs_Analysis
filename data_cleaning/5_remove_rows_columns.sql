-- Remove Any Rows or Columns

-- let's delete the rows what have null in both total_laid_off and percentage_laid_off, since these rows don't have layoff data we can't really use them for analysis
DELETE
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- delete the row_num column we created earlier for finding duplicate rows since we don't need it anymore
ALTER TABLE world_layoffs.layoffs_staging2
DROP COLUMN row_num;