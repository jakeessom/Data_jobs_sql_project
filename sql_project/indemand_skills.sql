SELECT
    COUNT(job_posting.job_id) AS number_of_jobs,
    skills.skills AS skill_name
FROM    
    job_postings_fact AS job_posting
LEFT JOIN
    skills_job_dim AS skills_to_job
    ON 
    job_posting.job_id = skills_to_job.job_id 
LEFT JOIN
    skills_dim AS skills
    ON
    skills_to_job.skill_id = skills.skill_id
WHERE
    job_country = 'United Kingdom'
    AND 
    job_title = 'Data Analyst'
GROUP BY
    skills.skills
ORDER BY
    number_of_jobs DESC