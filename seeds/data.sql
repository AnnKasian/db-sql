INSERT INTO files (file_name, mime_type, key, url) VALUES
('avatar1.png', 'image/png', 'avatar1', '/media/avatar1.png'),
('avatar2.png', 'image/png', 'avatar2', '/media/avatar2.png'),
('poster1.png', 'image/png', 'poster1', '/media/poster-matrix.png'),
('poster2.png', 'image/png', 'poster2', '/media/poster-swan.png'),
('poster2.png', 'image/png', 'poster2', '/media/poster-starwars.png'),
('photo1.png', 'image/png', 'photo1', '/media/person1.png'),
('photo2.png', 'image/png', 'photo2', '/media/person2.png'),
('photo3.png', 'image/png', 'photo3', '/media/person3.png');



INSERT INTO users (username, first_name, last_name, email, password, avatar_id) VALUES
('john_doe', 'John', 'Doe', 'john.doe@example.com', '1111', 1),
('jane_smith', 'Jane', 'Smith', 'jane.smith@example.com', '2222', 2);


INSERT INTO genre (name) VALUES
('Action'),
('Science fiction'),
('Psychological horror');


INSERT INTO country (name) VALUES
('United States'),
('Canada'), 
('Israel');

INSERT INTO person (first_name, last_name, biography, date_of_birth, gender, home_country_id, primary_photo_id) VALUES
('Steven', 'Spielberg', 'Famous director known for many blockbuster movies.', '1946-12-18', 'male', 1, 6),
('Natalie', 'Portman', 'Award-winning actress known for roles in films such as Black Swan and V for Vendetta.', '1981-06-09', 'female', 3, 7),
('Keanu', 'Reeves', 'Actor known for his roles in The Matrix series and John Wick.', '1964-09-02', 'male', 2, 6),
('Laurence', 'Fishburne', 'Actor known for his roles in The Matrix series.', '1961-07-30', 'male', 1, 6),
('Mila', 'Kunis', 'Actress known for roles in Black Swan and That 70s Show.', '1983-08-14', 'female', 1, 7),
('Liam', 'Neeson', 'Actor known for roles in Taken and Star Wars.', '1952-06-07', 'male', 1, 6),
('Hero', 'The main protagonist leading the adventure.', 'leading', 4, 3),  
('Sidekick', 'The loyal companion who helps the hero.', 'supporting', 4, 4); 

INSERT INTO person_photos (person_id, file_id) VALUES
(1, 6),
(2, 7),
(3, 8),
(4, 6), 
(5, 7),
(6, 8);

INSERT INTO movie (title, description, budget, release_date, duration, director_id, country_id, poster_id) VALUES
('The Matrix', 'A hacker discovers the nature of reality and his role in the war against its controllers.', 63000000, '1999-03-31', 136, 1, 2, 3),
('Black Swan', 'A ballerina faces immense pressure as she prepares for a role that pushes her to the brink of madness.', 13000000, '2010-12-03', 108, 1, 3, 4),
('Star Wars: Episode I - The Phantom Menace', 'Jedi knights fight to protect the galaxy from a Sith Lord and an evil Trade Federation.', 115000000, '1999-05-19', 136, 2, 1, 5),
('Action Adventure', 'An exhilarating adventure full of action and drama.', 100000000, '2023-05-15', 140, 1, 1, 3);

INSERT INTO movie_genre (movie_id, genre_id) VALUES
(1, 1),
(1, 2), 
(2, 3),
(3, 1), 
(3, 2),
(4, 1);

INSERT INTO character (name, description, role, movie_id, actor_id) VALUES
('Neo', 'A computer hacker who becomes a leader in the fight against the controllers of reality.', 'leading', 1, 3),
('Morpheus', 'A wise leader and mentor who guides Neo.', 'supporting', 1, 4),
('Nina Sayers', 'A dedicated and ambitious ballerina facing psychological challenges.', 'leading', 2, 2),
('Lily', 'A talented dancer who is both a rival and inspiration to Nina.', 'supporting', 2, 5),
('Padmé Amidala', 'The Queen of Naboo who becomes a key figure in the fight against the Trade Federation.', 'leading', 3, 2),  
('Qui-Gon Jinn', 'A wise Jedi Master who discovers Anakin Skywalker.', 'leading', 3, 6);


INSERT INTO favorite_movies (user_id, movie_id) VALUES
(1, 1), 
(2, 2);

