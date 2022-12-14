SELECT testimonials.id, writer.name as writer, recipient.name as recipient, testimonials.message 
    FROM testimonials
    JOIN users writer on testimonials."writerId" = writer.id
    JOIN users recipient on testimonials."recipientId" = recipient.id;