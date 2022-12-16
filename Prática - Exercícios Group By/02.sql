SELECT users.id, COUNT(educations.*) as educations FROM users
    JOIN educations on users.id = educations."userId"
    GROUP BY users.id;