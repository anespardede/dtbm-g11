CREATE TABLE Movie_Actor(
movie_id INTEGER REFERENCES Movie(movie_id),
actor_id INTEGER REFERENCES Actor(actor_id),

PRIMARY KEY(movie_id, actor_id)
);

SELECT * FROM movie_actor;
