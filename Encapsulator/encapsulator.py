#This module encapsulates the Movies_11 POSTGRESQL database and returns analysis ready dataframes. 
# The project is Database Management 7000DMD_23, and the topic is if expert review ratings determine to a certain extent the box office performance.
#Author: Lander Elorriaga
#Note: the password comes from the DB_PASSWORD environment variable

import psycopg2
import pandas as pd
import os

def get_connection():
    conn =psycopg2.connect(
    host="localhost",
    database="Movies_11",
    port= "1234",
    user="postgres",
    password=os.environ.get("DB_PASSWORD"))
    return conn

def get_sq3_data(conn): 
    #This returns one film per row with aggregated expert review measures, worldwide box office, grouping of columns like the overall averages and the linguisitic (LIWC) averages
    #Films without a worldwide box office and reviews with no text are excluded because LIWC values are placeholders hence the FILTERs. This is a subset of the entire film database (4,823 out of 11,364) due to the exlusion of missing data for the columns mentioned. 
    #avg_score_negative is NULL when a film has no review under 50.
    df = pd.read_sql("""
    SELECT s.worldwide_box_office, 
    s.movie_id, 
    AVG(review_score) AS avg_score, 
    AVG(review_score)
    FILTER (WHERE review_score < 50) AS avg_score_negative, COUNT(*) FILTER (WHERE review_score < 50) AS count_negative,
    AVG(review_score)
    FILTER (WHERE review_score >= 50) AS avg_score_positive, COUNT(*) FILTER (WHERE review_score >= 50) AS count_positive,
    COUNT(*) AS review_count, 
    AVG(e.negemo) AS avg_negemo, 
    AVG(e.tone) AS avg_tone
    FROM movie_sales s LEFT JOIN expert_review e
    ON s.movie_id = e.movie_id
    WHERE s.worldwide_box_office is not null AND s.worldwide_box_office > 0 AND e.review_text IS NOT NULL
    GROUP BY s.movie_id, s.worldwide_box_office
    """,conn)
    return df
