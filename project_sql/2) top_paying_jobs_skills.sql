SELECT 
companies.name,
jobs.job_title_short,
jobs.salary_year_avg


FROM job_postings_fact AS jobs
LEFT JOIN company_dim AS companies ON jobs.company_id = companies.company_id
LEFT JOIN

WHERE 
jobs.salary_year_avg IS NOT NULL
AND jobs.job_location = 'Anywhere'
AND jobs.job_title_short = 'Data Analyst'

ORDER BY jobs.salary_year_avg DESC
LIMIT 10;
