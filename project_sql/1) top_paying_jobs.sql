-- What are the top paying data analyst jobs?
-- Identify the top 10 highest paying Data Analyst roles that are available remotely
-- include salaries without null values
-- offer insight for employees seeking for the job

SELECT 
companies.name,
jobs.job_title_short,
jobs.salary_year_avg


FROM job_postings_fact AS jobs
LEFT JOIN company_dim AS companies ON jobs.company_id = companies.company_id

WHERE 
jobs.salary_year_avg IS NOT NULL
AND jobs.job_location = 'Anywhere'
AND jobs.job_title_short = 'Data Analyst'

ORDER BY jobs.salary_year_avg DESC
LIMIT 20;

