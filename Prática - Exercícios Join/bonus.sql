SELECT schools.id, schools.name as school, courses.name as course, companies.name as company, roles.name as role FROM jobs 
    JOIN applicants on jobs.id = applicants."jobId"
    JOIN users on applicants."userId" = users.id
    JOIN educations on educations."userId" = users.id
    JOIN schools on educations."schoolId" = schools.id
    JOIN courses on educations."courseId" = courses.id
    JOIN roles on jobs."roleId" = roles.id
    JOIN companies on jobs."companyId" = companies.id
    WHERE jobs.active = true AND jobs."companyId" = 10 AND roles.name = 'Software Engineer';