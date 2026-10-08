CREATE TABLE Movie_Genre(
movie_id INTEGER REFERENCES Movie(movie_id),
genre_id INTEGER REFERENCES Genre(genre_id),

PRIMARY KEY(movie_id, genre_id)
);

