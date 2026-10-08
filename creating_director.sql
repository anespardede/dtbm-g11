SELECT COUNT(*) FROM Movie;
-- came 11,364 as expected

SELECT COUNT(DISTINCT movie_id) FROM Movie;
-- came 11,364 as expected

SELECT ms.movie_id
from Movie_Sales ms
left join movie m on ms.movie_id = m.movie_id
WHERE m.movie_id IS NULL
-- checked if there are any sales rows whose movie_id doesn't exist in Movie
-- gave no rows as expected

SELECT mc.movie_id
FROM Movie_Characteristics mc
LEFT JOIN Movie m
    ON mc.movie_id = m.movie_id
WHERE m.movie_id IS NULL;
-- checked if there are any movie_characteristics rows whose movie_id doesn't exist in Movie
-- gave no rows as expected

SELECT mg.movie_id, mg.genre_id
FROM Movie_Genre mg
LEFT JOIN Movie m ON mg.movie_id = m.movie_id
LEFT JOIN Genre g ON mg.genre_id = g.genre_id
WHERE m.movie_id IS NULL
   OR g.genre_id IS NULL;
-- checked and gave no rows as expected

SELECT mk.movie_id, mk.keyword_id
FROM Movie_Keyword mk
LEFT JOIN Movie m ON mk.movie_id = m.movie_id
LEFT JOIN Keyword k ON mk.keyword_id = k.keyword_id
WHERE m.movie_id IS NULL
   OR k.keyword_id IS NULL;
-- checked and gave no rows as expected


SELECT ma.movie_id, ma.actor_id
FROM Movie_Actor ma
LEFT JOIN Movie m ON ma.movie_id = m.movie_id
LEFT JOIN Actor a ON ma.actor_id = a.actor_id
WHERE m.movie_id IS NULL
   OR a.actor_id IS NULL;
-- checked and gave no rows as expected

SELECT md.movie_id, md.director_id
FROM Movie_Director md
LEFT JOIN Movie m ON md.movie_id = m.movie_id
LEFT JOIN Director d ON md.director_id = d.director_id
WHERE m.movie_id IS NULL
   OR d.director_id IS NULL;
-- checked and gave no rows as expected

SELECT cr.movie_id
FROM Consumer_Review cr
LEFT JOIN Movie m
    ON cr.movie_id = m.movie_id
WHERE m.movie_id IS NULL;
-- checked and gave no rows as expected


SELECT er.movie_id
FROM Expert_Review er
LEFT JOIN Movie m
    ON er.movie_id = m.movie_id
WHERE m.movie_id IS NULL;
-- checked and gave no rows as expected


-- checking how many records successfully connected though each relationship
SELECT
    (SELECT COUNT(*) FROM Movie_Sales ms
     JOIN Movie m ON ms.movie_id = m.movie_id) AS sales_joined,

    (SELECT COUNT(*) FROM Movie_Characteristics mc
     JOIN Movie m ON mc.movie_id = m.movie_id) AS characteristics_joined,

    (SELECT COUNT(*) FROM Movie_Genre mg
     JOIN Movie m ON mg.movie_id = m.movie_id
     JOIN Genre g ON mg.genre_id = g.genre_id) AS genres_joined,

    (SELECT COUNT(*) FROM Movie_Keyword mk
     JOIN Movie m ON mk.movie_id = m.movie_id
     JOIN Keyword k ON mk.keyword_id = k.keyword_id) AS keywords_joined,

    (SELECT COUNT(*) FROM Movie_Actor ma
     JOIN Movie m ON ma.movie_id = m.movie_id
     JOIN Actor a ON ma.actor_id = a.actor_id) AS actors_joined,

    (SELECT COUNT(*) FROM Movie_Director md
     JOIN Movie m ON md.movie_id = m.movie_id
     JOIN Director d ON md.director_id = d.director_id) AS directors_joined,

    (SELECT COUNT(*) FROM Consumer_Review cr
     JOIN Movie m ON cr.movie_id = m.movie_id) AS consumer_reviews_joined,

    (SELECT COUNT(*) FROM Expert_Review er
     JOIN Movie m ON er.movie_id = m.movie_id) AS expert_reviews_joined;

-- they all joined
	 