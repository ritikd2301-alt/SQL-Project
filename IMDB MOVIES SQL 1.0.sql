USE project_movie_database;
# Want to fetch the data of the table movies
SELECT * FROM movies;

# want to fetch the data of the table directors
SELECT * FROM directors;

#To see how many movies are there in the table movies
SELECT COUNT(*) AS total_movies
FROM movies;

# to find the name of particular directors
SELECT * FROM directors
WHERE name in('James Cameron', 'Luc Besson', 'John Woo');

# TO FIND THE DIRECTOR'S NAME STARTING WITH LETTER 'S'
SELECT * FROM directors 
WHERE name like 'S%';

#counting Female Directors
SELECT * FROM directors
WHERE gender=1;

#finding the 10th first women directors
SELECT name FROM directors
WHERE gender=1
ORDER BY name
LIMIT 9,1;

# 3 Most Popular Movies
SELECT original_title,popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;

# 3 most Bankable Movies 
SELECT original_title,revenue
FROM movies 
ORDER BY revenue DESC
LIMIT 3;

# Most awarded(highest average vote since Jan 1,2000)
SELECT original_title,vote_average,release_date
FROM movies
WHERE release_date>='2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;

#MOVIE directed by Brenda Chapman
SELECT m.original_title, d.name
FROM movies m
JOIN directors d 
ON m.director_id = d.id
WHERE d.name LIKE '%Brenda Chapman%';

#Director who made the most movies
SELECT d.name, COUNT(m.id) AS total_movies
FROM movies m
JOIN directors d ON m.director_id = d.id
GROUP BY d.name
ORDER BY total_movies DESC
LIMIT 1;

#director who is most bankable
SELECT d.name, SUM(m.revenue) AS total_revenue
FROM movies m
JOIN directors d ON m.director_id = d.id
GROUP BY d.name
ORDER BY total_revenue DESC
LIMIT 1;






