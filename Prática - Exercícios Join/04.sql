SELECT experiences.id, users.name, roles.name as role, companies.name as company, experiences."startDate" FROM experiences
    JOIN users on experiences."userId" = users.id
    JOIN roles on experiences."roleId" = roles.id
    JOIN companies on experiences."companyId" = companies.id
    WHERE experiences."userId" = 50 AND experiences."endDate" IS NULL;