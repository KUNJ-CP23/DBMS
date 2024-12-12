--Database Name: Branch_DIV_Rollno (Example: CSE_3A_101 or Bsc_Hons_101) 
CREATE DATABASE CSE_4A_115

--Note: Create all the tables under above database with design mode only.
--DONE

--Table1: Artists (Artist_id (PK), Artist_name) 
SELECT * FROM ARTISTS;

--Table2: Albums (Album_id(PK), Album_title, Artist_id(FK), Release_year) 
SELECT * FROM ALBUMS;

--Table3: Songs (Song_id, Song_title, Duration (in minutes), Genre, Album_id(FK)) 
SELECT * FROM SONGS;

--Part – A 

--1. Retrieve a unique genre of songs.
SELECT DISTINCT GENRE
FROM SONGS;

--2. Find top 2 albums released before 2010. 
SELECT TOP 2 *
FROM ALBUMS 
WHERE RELEASE_YEAR<2010;

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
INSERT INTO SONGS VALUES (1245, 'Zaroor', 2.55, 'Feel good', 1005);

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
UPDATE SONGS
SET GENRE='HAPPY'
WHERE SONG_TITLE='ZAROOR';

--5. Delete an Artist ‘Ed Sheeran’
DELETE FROM ARTISTS
WHERE ARTIST_NAME='Ed Sheeran';

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)] 
ALTER TABLE SONGS
ADD RATINGS DECIMAL(3,2);

--7. Retrieve songs whose title starts with 'S'.
SELECT SONG_TITLE
FROM SONGS 
WHERE SONG_TITLE LIKE 'S%';

--8. Retrieve all songs whose title contains 'Everybody'.
SELECT SONG_TITLE
FROM SONGS 
WHERE SONG_TITLE LIKE '%Everybody%';

--9. Display Artist Name in Uppercase.
SELECT UPPER(ARTIST_NAME) AS UPPERCASE_NAMES
FROM ARTISTS;

--10. Find the Square Root of the Duration of a Song ‘Good Luck’ 
SELECT CAST(SQRT(DURATION) AS DECIMAL(5,4)) AS SQUARE_ROOT
FROM SONGS
WHERE SONG_TITLE='GOOD LUCK';

--11. Find Current Date. 
SELECT GETDATE() AS CURR_DATE;

--12. Find the number of albums for each artist.
SELECT A.ARTIST_ID,COUNT(AL.ALBUM_ID)AS ALBUM_COUNT
FROM ARTISTS A
INNER JOIN ALBUMS AL
ON A.ARTIST_ID = AL.ARTIST_ID
GROUP BY A.ARTIST_ID;

--13. Retrieve the Album_id which has more than 5 songs in it.
SELECT ALBUM_ID 
FROM SONGS
GROUP BY ALBUM_ID 
HAVING COUNT(*)>5;

--14. Retrieve all songs from the album 'Album1'. (using Subquery)
SELECT S.SONG_TITLE, A.ALBUM_TITLE
FROM ALBUMS A
INNER JOIN SONGS S
ON A.ALBUM_ID = S.ALBUM_ID
WHERE ALBUM_TITLE LIKE (SELECT ALBUM_TITLE
						FROM ALBUMS
						WHERE ALBUM_TITLE='ALBUM1');

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery) 
SELECT AR.ARTIST_NAME, Al.ALBUM_TITLE
FROM ARTISTS AR
INNER JOIN ALBUMS AL
ON AR.ARTIST_ID = AL.ARTIST_ID
WHERE AR.ARTIST_NAME LIKE (SELECT ARTIST_NAME
						FROM ARTISTS
						WHERE ARTIST_NAME='Aparshakti Khurana');

--16. Retrieve all the song titles with its album title.
SELECT S.Song_title, A.Album_title
FROM ALBUMS A
INNER JOIN SONGS S
ON A.ALBUM_ID = S.ALBUM_ID;

--17. Find all the songs which are released in 2020. 
SELECT S.Song_title, A.Release_year
FROM ALBUMS A
INNER JOIN SONGS S
ON A.ALBUM_ID = S.ALBUM_ID
WHERE A.Release_year = 2020;

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.  
CREATE VIEW FAV_SONGS AS
SELECT SONGS_ID, SONG_TITLE
FROM SONGS
WHERE SONGS_ID BETWEEN 101 AND 105;

SELECT * FROM SONGS
SELECT * FROM FAV_SONGS

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
UPDATE FAV_SONGS
SET Song_title='JANNAT'
WHERE Songs_id=101;

--20. Find all artists who have released an album in 2020.  
SELECT A.Artist_id, A.ARTIST_NAME,AL.RELEASE_YEAR
FROM ARTISTS A
INNER JOIN ALBUMS AL
ON A.Artist_id = AL.Artist_id
WHERE AL.RELEASE_YEAR = 2020;

--21. Retrieve all songs by Shreya Ghoshal and order them by duration.
SELECT A.ARTIST_NAME, S.SONG_TITLE, S.DURATION
FROM Artists A
JOIN ALBUMS AL
ON A.Artist_id = AL.Artist_id
JOIN SONGS S
ON AL.Album_id = S.Album_id
WHERE A.Artist_name ='Shreya Ghoshal'
ORDER BY S.Duration;

--Part – B 

--22. Retrieve all song titles by artists who have more than one album.  
SELECT DISTINCT S.Song_title, A.Artist_name
FROM Songs S
JOIN Albums AL
  ON S.Album_id = AL.Album_id
JOIN Artists A
  ON AL.Artist_id = A.Artist_id
WHERE A.Artist_id IN (SELECT Artist_id
					  FROM Albums
					  GROUP BY Artist_id
                      HAVING COUNT(Album_id) > 1);

--23. Retrieve all albums along with the total number of songs.
SELECT AL.Album_title, COUNT(S.Songs_id) AS Total_Songs
FROM Albums AL
LEFT JOIN Songs S
ON AL.Album_id = S.Album_id
GROUP BY AL.Album_title;

--24. Retrieve all songs and release year and sort them by release year.
SELECT S.Song_title, A.Release_year
FROM Songs S
JOIN Albums A
ON S.Album_id = A.Album_id
ORDER BY A.Release_year;

--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
SELECT S.Genre, COUNT(S.Songs_id) AS Total_Songs
FROM Songs S
GROUP BY S.Genre
HAVING COUNT(S.Songs_id) > 2;

--26. List all artists who have albums that contain more than 3 songs.
SELECT S.Song_title, A.Artist_name
FROM Artists A
JOIN Albums AL
ON AL.Artist_id = A.Artist_id
JOIN Songs S
ON S.Album_id = AL.Album_id
WHERE AL.Album_id IN (SELECT Album_id 
					  FROM songs 
					  GROUP BY Album_id 
					  HAVING COUNT(song_title)>3) 

select Artist_name from Artists where Artist_id in (
select Artist_id from Albums where Album_id in(
select Album_id from songs group by Album_id having count(song_title)>3
))

--Part – C 

--27. Retrieve albums that have been released in the same year as 'Album4'
SELECT A1.ALBUM_TITLE 
FROM Albums A1
JOIN Albums A2
ON A1.Album_id = A2.Album_id
WHERE A1.Release_year IN (SELECT Release_year
						  FROM Albums
						  WHERE Album_title = 'ALBUM4')

SELECT AL2.Album_title
FROM Albums AL1
JOIN Albums AL2
  ON AL1.Release_year = AL2.Release_year
WHERE AL1.Album_title = 'Album4' AND AL1.Album_id != AL2.Album_id;

--28. Find the longest song in each genre 
SELECT S.Genre, S.Song_title, S.Duration
FROM Songs S
WHERE S.Duration = (SELECT MAX(S2.Duration)
					FROM Songs S2
					WHERE S2.Genre = S.Genre);

--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title. 
SELECT S.SONG_TITLE
FROM SONGS S
JOIN Albums A
ON S.Album_id = A.Album_id
WHERE A.Album_title LIKE '%Album%';

--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes. 
SELECT A.Artist_name, SUM(S.DURATION) AS TOTAL_DURATION
FROM SONGS S
JOIN ALBUMS AL
ON S.Album_id = AL.Album_id
JOIN Artists A
ON AL.Artist_id = A.Artist_id
GROUP BY A.Artist_name
HAVING SUM(S.Duration) > 15;

