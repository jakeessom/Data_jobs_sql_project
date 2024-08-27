SELECT
    skills.skills AS skill_name,
    ROUND(AVG(job_posted.salary_year_avg)) AS avg_salary_per_skill
FROM
    job_postings_fact AS job_posted
LEFT JOIN
    skills_job_dim AS skills_to_job
    ON
    job_posted.job_id = skills_to_job.job_id
INNER JOIN
    skills_dim AS skills
    ON 
    skills_to_job.skill_id = skills.skill_id
WHERE
    job_country = 'United Kingdom'
    AND
    job_title = 'Data Analyst'
    AND 
    salary_year_avg IS NOT NULL
GROUP BY
    skill_name
ORDER BY    
    avg_salary_per_skill DESC
