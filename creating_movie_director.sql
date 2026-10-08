CREATE TABLE Movie_Director(
movie_id INTEGER REFERENCES Movie(movie_id),
director_id INTEGER REFERENCES Director(director_id),

PRIMARY KEY(movie_id, director_id)
);

SELECT * FROM movie_director;
