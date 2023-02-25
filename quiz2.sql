--Drop tables
-- DROP TABLE IF EXISTS albums_track CASCADE;
-- DROP TABLE IF EXISTS albums;
-- DROP TABLE IF EXISTS tracks;

--Instead use a CASCADE code to drop the tables 
--uncomment these 3 codes and delete the onces you have above
DROP TABLE IF EXISTS tracks_albums CASCADE;
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
       ('Dangerous: The Double Album', 'Morgan Wallen','January, 2021'),
       ('Evermore', 'Taylor Swift','December, 2020'),
       ('Shoot For The Stars Aim For The Moon', 'Pop Smoke','July, 2020'),
       ('KOD', 'J. Cole','April, 2018'),
       ('Positions', 'Ariana Grande','October, 2020'),
       ('Fine Line', 'Harry Styles','December, 2019'),
       ('Legends Never Die', 'Juice WRLD','July, 2020'),
       ('The Off-Season', 'J. Cole','May, 2021'),
       ('DAMN.', 'Kendrick Lamar','April, 2017');

CREATE TABLE tracks
 (
    track_ID serial PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist text NOT NULL,
    length_min TIME NOT NULL --not int use time NOT NULL
);

--Inserting the rows into the tracks table
INSERT INTO tracks(title,artist,length_min) --include data for all (except ID)the other data you created in the tracks table not olny the title and  length_min
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
FROM albums_track;