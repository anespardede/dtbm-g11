CREATE TABLE Movie(
movie_id INTEGER PRIMARY KEY,
url TEXT,
title VARCHAR(255),
year SMALLINT
);

SELECT count(movie_id) FROM Movie