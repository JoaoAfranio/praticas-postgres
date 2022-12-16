SELECT s.name as school, c.name as course, COUNT(e.*) as studentsCount
 FROM educations e
    JOIN schools s ON e."schoolId" = s.id
    JOIN courses c ON e."courseId" = c.id
    WHERE e.status = 'ongoing' OR e.status = 'finished'
    GROUP BY s.name, c.name;