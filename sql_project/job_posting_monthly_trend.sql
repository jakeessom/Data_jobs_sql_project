/*
- When are the reqruitment drives for Data analysts in the Uk
- what is the avg yearly salary depending on the month the job posted

How do salarys compare to monthly recruitment numbers and?

*/

SELECT
    EXTRACT(MONTH FROM  job_posted_date) AS month_posted,
    COUNT(*) AS postings_per_month,
    ROUND(AVG(salary_year_avg)) AS avg_salary,
    ROUND(MAX(salary_year_avg)) AS max_salary,    
    ROUND(MIN(salary_year_avg)) AS min_salary,
    CASE 
        WHEN 
             COUNT(*) < 700 THEN 'LOW RECRUITMENT'
        WHEN
             COUNT(*) > 1000 THEN 'HIGH RECRUITMENT'
        ELSE 'NORMAL RECRUITMENT'
    END AS recruitment_rate,
    CASE 
        WHEN 
             ROUND(AVG(salary_year_avg)) < 80000 THEN 'LOW'
        WHEN
             ROUND(AVG(salary_year_avg)) > 100000 THEN 'HIGH'
        ELSE 'MEDIUM'
    END AS salaty_rating
FROM  
    job_postings_fact
WHERE
    job_title_short  = 'Data Analyst'
    AND
    job_country = 'United Kingdom'
GROUP BY
    month_posted
ORDER BY
    month_posted 



