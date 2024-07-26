SELECT u.id,
       u.username,
       array_agg(f_m.movie_id) AS favorite_movie_ids
FROM 
    Users u
LEFT JOIN 
    Favorite_Movies f_m ON u.id = f_m.user_id
GROUP BY 
    u.id, u.username;