WITH Director_Data AS (
    SELECT 
        m.id AS movie_id,
        json_build_object(
            'id', d.id,
            'first_name', d.first_name,
            'last_name', d.last_name
        ) AS director
    FROM 
        Movie m
    JOIN 
        Person d ON m.director_id = d.id
    GROUP BY 
        m.id, d.id, d.first_name, d.last_name 
)
SELECT m.id,
       m.title,
       m.release_date,
       m.duration,
       m.description,
       row_to_json(f) AS poster,
       d.director
FROM 
    Movie m 
LEFT JOIN 
    Director_Data d ON m.id = d.movie_id
JOIN 
    Country c ON m.country_id = c.id
LEFT JOIN 
    Files f ON m.poster_id = f.id
WHERE  
     c.id = 1
 AND m.release_date >= '2022-01-01'
 AND m.duration > 135
 AND EXISTS (
        SELECT 1
        FROM Movie_Genre m_g
        JOIN Genre g ON m_g.genre_id = g.id
        WHERE m_g.movie_id = m.id
        AND g.name IN ('Action', 'Drama')
  );
  