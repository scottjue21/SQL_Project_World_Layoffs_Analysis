-- Calculate the total layoffs per country and order by the highest layoffs  
-- This helps identify which countries experienced the most workforce reductions  
-- and provides insight into global layoff trends
SELECT country, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

/*  
Result Summary:   
The United States had the highest number of layoffs, followed by India and the Netherlands.  
Understanding layoff trends by country can highlight broader economic shifts  
and workforce challenges during this period.

Here is the JSON file to verify the results from the query:  

RESULTS  
=======  
[
  {
    "country": "United States",
    "SUM(total_laid_off)": "256559"
  },
  {
    "country": "India",
    "SUM(total_laid_off)": "35993"
  },
  {
    "country": "Netherlands",
    "SUM(total_laid_off)": "17220"
  },
  {
    "country": "Sweden",
    "SUM(total_laid_off)": "11264"
  },
  {
    "country": "Brazil",
    "SUM(total_laid_off)": "10391"
  },
  {
    "country": "Germany",
    "SUM(total_laid_off)": "8701"
  },
  {
    "country": "United Kingdom",
    "SUM(total_laid_off)": "6398"
  },
  {
    "country": "Canada",
    "SUM(total_laid_off)": "6319"
  },
  {
    "country": "Singapore",
    "SUM(total_laid_off)": "5995"
  },
  {
    "country": "China",
    "SUM(total_laid_off)": "5905"
  },
  {
    "country": "Israel",
    "SUM(total_laid_off)": "3638"
  },
  {
    "country": "Indonesia",
    "SUM(total_laid_off)": "3521"
  },
  {
    "country": "Australia",
    "SUM(total_laid_off)": "2324"
  },
  {
    "country": "Nigeria",
    "SUM(total_laid_off)": "1882"
  },
  {
    "country": "United Arab Emirates",
    "SUM(total_laid_off)": "995"
  },
  {
    "country": "France",
    "SUM(total_laid_off)": "915"
  },
  {
    "country": "Hong Kong",
    "SUM(total_laid_off)": "730"
  },
  {
    "country": "Austria",
    "SUM(total_laid_off)": "570"
  },
  {
    "country": "Russia",
    "SUM(total_laid_off)": "400"
  },
  {
    "country": "Kenya",
    "SUM(total_laid_off)": "349"
  },
  {
    "country": "Estonia",
    "SUM(total_laid_off)": "333"
  },
  {
    "country": "Argentina",
    "SUM(total_laid_off)": "323"
  },
  {
    "country": "Senegal",
    "SUM(total_laid_off)": "300"
  },
  {
    "country": "Mexico",
    "SUM(total_laid_off)": "270"
  },
  {
    "country": "Ireland",
    "SUM(total_laid_off)": "257"
  },
  {
    "country": "Finland",
    "SUM(total_laid_off)": "250"
  },
  {
    "country": "Spain",
    "SUM(total_laid_off)": "250"
  },
  {
    "country": "Denmark",
    "SUM(total_laid_off)": "240"
  },
  {
    "country": "Myanmar",
    "SUM(total_laid_off)": "200"
  },
  {
    "country": "Norway",
    "SUM(total_laid_off)": "140"
  },
  {
    "country": "Colombia",
    "SUM(total_laid_off)": "130"
  },
  {
    "country": "Bulgaria",
    "SUM(total_laid_off)": "120"
  },
  {
    "country": "Portugal",
    "SUM(total_laid_off)": "115"
  },
  {
    "country": "Malaysia",
    "SUM(total_laid_off)": "100"
  },
  {
    "country": "Japan",
    "SUM(total_laid_off)": "85"
  },
  {
    "country": "Romania",
    "SUM(total_laid_off)": "80"
  },
  {
    "country": "Seychelles",
    "SUM(total_laid_off)": "75"
  },
  {
    "country": "Switzerland",
    "SUM(total_laid_off)": "62"
  },
  {
    "country": "Lithuania",
    "SUM(total_laid_off)": "60"
  },
  {
    "country": "Thailand",
    "SUM(total_laid_off)": "55"
  },
  {
    "country": "Luxembourg",
    "SUM(total_laid_off)": "45"
  },
  {
    "country": "New Zealand",
    "SUM(total_laid_off)": "45"
  },
  {
    "country": "Chile",
    "SUM(total_laid_off)": "30"
  },
  {
    "country": "Poland",
    "SUM(total_laid_off)": "25"
  },
  {
    "country": "Pakistan",
    "SUM(total_laid_off)": null
  },
  {
    "country": "Hungary",
    "SUM(total_laid_off)": null
  },
  {
    "country": "Italy",
    "SUM(total_laid_off)": null
  },
  {
    "country": "Turkey",
    "SUM(total_laid_off)": null
  },
  {
    "country": "South Korea",
    "SUM(total_laid_off)": null
  },
  {
    "country": "Vietnam",
    "SUM(total_laid_off)": null
  },
  {
    "country": "Egypt",
    "SUM(total_laid_off)": null
  }
]  
*/