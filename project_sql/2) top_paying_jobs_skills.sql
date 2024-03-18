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
    top_paying_jobs.job_id,
    top_paying_jobs.company_name,
    top_paying_jobs.job_name,
    top_paying_jobs.salary_average,
    skills_dim.skills
    
FROM top_paying_jobs 

LEFT JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE skills_dim.skills IS NOT NULL;


/*
MOST DEMANDED SKILLS

1) SQL : count of 8
2) Python : count of 7
3) Tableau : count of 6


[
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_name": "Data Analyst",
    "salary_average": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_name": "Data Analyst",
    "salary_average": "232423.0",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_name": "Data Analyst",
    "salary_average": "232423.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_name": "Data Analyst",
    "salary_average": "232423.0",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_name": "Data Analyst",
    "salary_average": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_name": "Data Analyst",
    "salary_average": "232423.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_name": "Data Analyst",
    "salary_average": "217000.0",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_name": "Data Analyst",
    "salary_average": "217000.0",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_name": "Data Analyst",
    "salary_average": "217000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_name": "Data Analyst",
    "salary_average": "217000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_name": "Data Analyst",
    "salary_average": "217000.0",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "205000.0",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "205000.0",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "205000.0",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "205000.0",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "205000.0",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "205000.0",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "205000.0",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "205000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_name": "Data Analyst",
    "salary_average": "189309.0",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_name": "Data Analyst",
    "salary_average": "189000.0",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_name": "Data Analyst",
    "salary_average": "189000.0",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_name": "Data Analyst",
    "salary_average": "189000.0",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_name": "Data Analyst",
    "salary_average": "189000.0",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_name": "Data Analyst",
    "salary_average": "189000.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_name": "Data Analyst",
    "salary_average": "189000.0",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_name": "Data Analyst",
    "salary_average": "189000.0",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_name": "Data Analyst",
    "salary_average": "189000.0",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "186000.0",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "186000.0",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "186000.0",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "186000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "186000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "186000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "186000.0",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "186000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_name": "Data Analyst",
    "salary_average": "186000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_name": "Data Analyst",
    "salary_average": "184000.0",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_name": "Data Analyst",
    "salary_average": "184000.0",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_name": "Data Analyst",
    "salary_average": "184000.0",
    "skills": "r"
  }
]





*/
