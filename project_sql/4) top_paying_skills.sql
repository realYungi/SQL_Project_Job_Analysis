-- WHat are the top skills for top paying jobs?
-- Find the results REGARDLESS of the location



SELECT 
    skills_dim.skills AS skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS salary


FROM job_postings_fact


INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id


WHERE job_postings_fact.job_title_short = 'Data Analyst'
AND job_postings_fact.salary_year_avg IS NOT NULL

GROUP BY skills

ORDER BY salary DESC

LIMIT 25;