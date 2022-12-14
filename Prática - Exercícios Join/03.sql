SELECT courses.id, users.name, courses.name as course, schools.name as school, educations."endDate" FROM educations
    JOIN users on educations."userId" = users.id
    JOIN courses on educations."courseId" = courses.id
    JOIN schools on educations."schoolId" = schools.id
    WHERE educations.status = 'finished' AND users.id = 30;