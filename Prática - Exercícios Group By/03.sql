SELECT users.name, COUNT(testimonials.*) as testimonialCount FROM testimonials
    JOIN users on testimonials."writerId" = users.id
    GROUP BY users.id;