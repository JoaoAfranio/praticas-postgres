SELECT users.id, users.name, cities.name as city 
    FROM users 
    JOIN cities on users."cityId" = cities.id 
    WHERE cities.name = 'Rio de Janeiro';