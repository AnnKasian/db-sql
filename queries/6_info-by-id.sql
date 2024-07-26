WITH Director_Data AS (
    SELECT 
        m.id AS movie_id,
        json_build_object(
            'id', d.id,
            'first_name', d.first_name,
            'last_name', d.last_name,
            'photo', row_to_json(d_photo)
        ) AS director
    FROM 
        Movie m
    JOIN 
        Person d ON m.director_id = d.id
    LEFT JOIN 
        Files d_photo ON d.primary_photo_id = d_photo.id
    WHERE 
        m.id = 1
    GROUP BY 
        m.id, d.id, d.first_name, d.last_name, d_photo.id 
),
Actor_Data AS (
    SELECT 
        m.id AS movie_id,
        json_agg(
            json_build_object(
                'id', a.id,
                'first_name', a.first_name,
                'last_name', a.last_name,
                'photo', row_to_json(a_photo)
            )
        ) AS actors
    FROM 
        Movie m
    LEFT JOIN 
        Character c ON m.id = c.movie_id
    LEFT JOIN 
        Person a ON c.actor_id = a.id
    LEFT JOIN 
        Files a_photo ON a.primary_photo_id = a_photo.id
    WHERE 
        m.id = 1
    GROUP BY 
        m.id 
),
Genre_Data AS (
    SELECT 
        m.id AS movie_id,
        json_agg(
            json_build_object(
                'id', g.id,
                'name', g.name
            )
        ) AS genres
    FROM 
        Movie m
    JOIN 
        Movie_Genre m_g ON m.id = m_g.movie_id
    JOIN 
        Genre g ON m_g.genre_id = g.id
    WHERE 
        m.id = 1
    GROUP BY 
        m.id 
)
SELECT 
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    row_to_json(poster_file) AS poster,
    d.director,
    a.actors,
    g.genres
FROM 
    Movie m
LEFT JOIN 
    Files poster_file ON m.poster_id = poster_file.id
LEFT JOIN 
    Director_Data d ON m.id = d.movie_id
LEFT JOIN 
    Actor_Data a ON m.id = a.movie_id
LEFT JOIN 
    Genre_Data g ON m.id = g.movie_id
WHERE 
    m.id = 1;
