SELECT p.id AS actor_id,
    p.first_name,
    p.last_name,
    SUM(m.budget) AS total_movies_budget
FROM 
    Character c
JOIN 
    Person p ON c.actor_id = p.id
JOIN 
    Movie m ON c.movie_id = m.id
GROUP BY 
    p.id, p.first_name, p.last_name;