INSERT INTO main_actors_tbl VALUES 
(null, "Arnold Schwarzenegger", 1947, "M"),
(null,"Gal Gadot",1985,"F"),
(null,"Sigourney Weavert",1949,"F"),
(null,"Christian Bale",1974,"M"),
(null,"Leonardo DiCaprio",1974,"M"),
(null,"Angelina Jolie",1975,"F"),
(null,"Zoe Saldaña",1978,"F"),
(null,"Gemma Chan",1982,"F")
;

INSERT INTO movies_tbl VALUES 
(null,"Titanic",1997,1),
(null,"Wonder Woman",2017,3),
(null,"Avatar",2017,1),
(null,"Aliens",1986,1),
(null,"Inception",2010,2),
(null,"Terminator",1984,1),
(null,"Cleopatra",2023,3),
(null,"Eternals",2021,4),
(null,"The Dark Knight",2008,2);

INSERT INTO movie_actors_tbl VALUES 
(3,7),
(9,4),
(8,6),
(4,3),
(5,5),
(7,2),
(8,8),
(1,5),
(2,2),
(6,1),
(3,3);

#1.List all the actors born before 1980.
SELECT * from  main_actors_tbl WHERE year_of_birth < 1980;



#2.How many movies did Nolan direct ?
SELECT COUNT(movies_tbl.title) FROM movies_tbl,directors_tbl
WHERE directors_tbl.id = movies_tbl.director_id AND directors_tbl.name = "Christopher Nolan";




#3.Among all the movies of James Cameron, how many were female actors ?
#Version 1:
SELECT COUNT(act.id) FROM movies_tbl, main_actors_tbl AS act,movie_actors_tbl
WHERE movies_tbl.id = movie_actors_tbl.movie_id
AND act.id = movie_actors_tbl.main_actors_id
AND movies_tbl.director_id = 1
AND act.sex = "F";

#Version 2:
SELECT COUNT(act.id) FROM movie_actors_tbl 
INNER JOIN movies_tbl ON movies_tbl.id = movie_actors_tbl.movie_id
INNER JOIN main_actors_tbl AS act ON act.id = movie_actors_tbl.main_actors_id
WHERE movies_tbl.director_id = 1
AND act.sex = "F";



#4.How many directors did Leonardo DiCaprio worked with? (?)
SELECT COUNT(movies_tbl.director_id) 
FROM movie_actors_tbl 
INNER JOIN movies_tbl ON movies_tbl.id = movie_actors_tbl.movie_id
INNER JOIN main_actors_tbl AS act ON act.id = movie_actors_tbl.main_actors_id
WHERE act.name = "Leonardo Leonardo DiCaprio";



#5. Who is the oldest director ?
SELECT name FROM directors_tbl
ORDER BY birthday ASC
limit 1;




#6.What is the earliest movie of the oldest director ?
SELECT dir.name, movie.title, movie.release_year FROM directors_tbl AS dir, movies_tbl AS movie
WHERE director_id = (SELECT id FROM directors_tbl ORDER BY birthday ASC limit 1)
ORDER BY release_year DESC 
limit 1; 




#7.What is the latest movie of the youngest actor ?
SELECT dir.name, movie.title, movie.release_year FROM directors_tbl AS dir, movies_tbl AS movie
WHERE director_id = (SELECT id FROM directors_tbl ORDER BY birthday DESC limit 1)
ORDER BY release_year ASC 
limit 1; 
