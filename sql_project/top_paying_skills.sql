/*
This Query is showing the skills with the most postings and there salaries.
    - Data is Filtered to Data Analyst jobs based in the UK
    - The query is only showing skills which had more than 5 postings 
*/

SELECT
    COUNT(job_postings.*) AS postings_per_skill,
    skills.skills AS skill_name,
    ROUND(AVG(salary_year_avg)) AS avg_salary
FROM
    job_postings_fact AS job_postings
INNER JOIN
    skills_job_dim AS skills_to_job
    ON
    job_postings.job_id = skills_to_job.job_id
INNER JOIN
    skills_dim AS skills
    ON
    skills_to_job.skill_id = skills.skill_id
INNER JOIN
    company_dim AS company
    ON
    job_postings.company_id = company.company_id
WHERE
            salary_year_avg IS NOT NULL
            AND 
            job_country LIKE 'United Kingdom'
            AND
            job_title_short LIKE 'Data Analyst'
GROUP BY
    skills.skills
HAVING
    COUNT(job_postings.*) > 5
ORDER BY
    postings_per_skill DESC,
    avg_salary DESC
LIMIT 100