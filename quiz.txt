--drop table
DROP TABLE IF EXISTS albums_tracks CASCADE;
DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;

--Creating the tables
CREATE TABLE albums
 (
    album_ID serial PRIMARY KEY, --include a comma 
    title VARCHAR(100) NOT NULL,
    artist text NOT NULL,
    released DATE NOT NULL
);

--Inserting the rows into the albums table
INSERT INTO albums(title, artist,released) 
VALUES ('SOUR', 'Olivia Rodrigo', 'May 21, 2021'),
       ('Dangerous The Double Album', 'Morgan Wallen','2021-01-22'),
       ('Evermore', 'Taylor Swift','2020-12-10'),
       ('Shoot For The Stars Aim For The Moon', 'Pop Smoke','2020-05-15'),
       ('KOD', 'J. Cole','2018-05-18'),
       ('Positions', 'Ariana Grande','2020-09-12'),
       ('Fine Line', 'Harry Styles','2019-12-5'),
       ('Legends Never Die', 'Juice WRLD','020-05-14'),
       ('The Off-Season', 'J. Cole','2021-06-06'),
       ('DAMN.', 'Kendrick Lamar','2017-05-19');

CREATE TABLE tracks
 (
    track_ID serial PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist text NOT NULL,
    length_min TIME NOT NULL 
);

--Inserting the rows into the tracks table
INSERT INTO tracks(title,artist,length_min) 
VALUES ('BLOOD.', 'Kendrick Lamar','00:01:58'), 
       ('willow','Taylor Swift', '00:03:34'),
       ('tolerate it', 'Taylor Swift','00:04:06'),
       ('dorothea', 'Taylor Swift','00:03:28'),
       ('HUMBLE.', 'Kendrick Lamar','00:02:57'),
       ('95 South', 'J. Cole','00:04:08'),
       ('enough for you','Olivia Rodrigo', '00:03:25'),
       ('The Cut Off (feat. kiLL edward)', 'J. Cole','00:03:57'),
       ('ATM', 'J. Cole','00:03:37'),
       ('Once an Addict (Interlude)','J. Cole', '00:03:17');

--Link the tables
CREATE TABLE albums_tracks (
    id serial PRIMARY KEY,
    album_ID integer REFERENCES albums(album_ID),
    track_ID integer REFERENCES tracks(track_ID)
);

--Inserting the rows 
INSERT INTO albums_tracks(album_ID,track_ID)
VALUES (1,10),
       (2,3),
       (3,3),
       (4,3),
       (5,10),
       (6,9),
       (7,1),
       (8,5),
       (9,5),
       (10,5);

SELECT *
FROM albums;

SELECT *
FROM tracks;

SELECT * 
FROM albums_tracks;


--Write an SQL query to see the albums and the tracks that belong to that album.\
SELECT A.title, T.title,T.length_min
FROM albums AS A
INNER JOIN albums_tracks AS AT
ON A.album_ID = AT.album_ID
INNER JOIN tracks AS T
ON AT.track_ID = T.track_ID;

--Write an SQL query to see the album or albums that each track belongs to
SELECT T.title AS track_name, T.length_min AS track_length, A.title AS released_on_album
FROM tracks as T
INNER JOIN albums_tracks AS AT
ON T.track_ID = AT.track_ID
INNER JOIN albums AS A
ON AT.album_ID = A.album_ID;

--Write a query to see the number of songs an album has.
SELECT A.title AS album_title, COUNT(T.track_ID)
FROM albums AS A
FULL JOIN albums_tracks AS AT
ON A.album_ID = AT.album_ID
FULL JOIN tracks AS T
ON AT.track_ID = T.track_ID
GROUP BY A.album_ID;

--Write a query to see how many albums a particular track is included on.
SELECT T.track_ID As track_ID, COUNT(T.track_ID)
FROM albums AS A
FULL JOIN albums_tracks AS AT
ON A.album_ID = AT.album_ID
FULL JOIN tracks AS T
ON AT.track_ID = T.track_ID
WHERE T.title = '95 South'
GROUP BY  T.track_ID;
