WITH skills_demand AS (
    SELECT 
        skills_job_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN 
        skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN 
        skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY 
        skills_job_dim.skill_id,
        skills_dim.skills
),
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS average_salary_skill
    FROM 
        job_postings_fact
    INNER JOIN 
        skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE 
        job_postings_fact.job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY 
        skills_job_dim.skill_id
)

SELECT 
    sd.skill_id,
    sd.skills,
    sd.demand_count,
    asr.average_salary_skill
FROM 
    skills_demand sd
INNER JOIN 
    average_salary asr ON asr.skill_id = sd.skill_id
WHERE
    demand_count BETWEEN 500 AND 3090

ORDER BY asr.average_salary_skill DESC
LIMIT 10; 
