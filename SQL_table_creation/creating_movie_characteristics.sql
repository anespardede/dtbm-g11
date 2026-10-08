CREATE TABLE Movie_Characteristics (
    movie_characteristics_id INTEGER PRIMARY KEY,
    movie_id INTEGER REFERENCES Movie(movie_id),
    url TEXT,
    release_date DATE,
    studio VARCHAR(255),
    rating VARCHAR(30),
    runtime SMALLINT,
    creative_type VARCHAR(100),
    awards TEXT,
    metascore SMALLINT,
    userscore NUMERIC(3,1),
    summary TEXT
);

SELECT * FROM Movie_characteristics