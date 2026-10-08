CREATE TABLE Movie_Sales (
    sales_id INTEGER PRIMARY KEY,
    movie_id INTEGER REFERENCES Movie(movie_id),
    worldwide_box_office NUMERIC(15,2),
    domestic_box_office NUMERIC(15,2),
    international_box_office NUMERIC(15,2),
    production_budget NUMERIC(15,2),
    opening_weekend NUMERIC(15,2),
    theatre_count INTEGER,
    avg_run_per_theatre NUMERIC(8,2)
);

SELECT * FROM Movie_Sales;