CREATE TABLE Movie_Keyword(
movie_id INTEGER REFERENCES Movie(movie_id),
keyword_id INTEGER REFERENCES Keyword(keyword_id),

PRIMARY KEY(movie_id, keyword_id)
);

