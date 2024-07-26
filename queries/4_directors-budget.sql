SELECT p.id,
       CONCAT(p.first_name, ' ', p.last_name) as director_name,
       AVG(m.budget) AS average_budget 
FROM 
    Person p
JOIN 
    Movie m ON p.id = m.director_id
GROUP BY 
    p.id;