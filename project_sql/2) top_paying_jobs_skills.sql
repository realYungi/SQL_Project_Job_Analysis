WITH top_paying_jobs AS (
SELECT 
    companies.name AS company_name,
    jobs.job_title_short AS job_name,
    jobs.salary_year_avg AS salary_average,
    jobs.job_id

FROM job_postings_fact AS jobs
LEFT JOIN company_dim AS companies ON jobs.company_id = companies.company_id

WHERE 
    jobs.salary_year_avg IS NOT NULL
    AND jobs.job_location = 'Anywhere'
    AND jobs.job_title_short = 'Data Analyst'

ORDER BY jobs.salary_year_avg DESC
LIMIT 10

)


SELECT
    top_paying_jobs.company_name,
    top_paying_jobs.job_name,
    top_paying_jobs.salary_average,
    skills_dim.skills
    
FROM top_paying_jobs 

LEFT JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE skills_dim.skills IS NOT NULL;
