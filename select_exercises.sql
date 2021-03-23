--2
USE albums_db;
SHOW TABLES;
--3
DESCRIBE albums;
SELECT * FROM albums;
SELECT DISTINCT artist FROM albums;
SHOW CREATE TABLE albums;
SELECT release_date FROM albums;
/*3.
    #a. 31 rows
    #b. 23 unique artists
    #c. primary key is 'id'
   # d. oldest is Sgt. Pepper'\'s Lonely heart band. Newest is 21 by Adele.*/
--4 
SELECT * FROM albums WHERE artist = 'Pink Floyd';
    --a.Dark side of the moon and The Wall
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
    --b.1967
SELECT genre FROM albums WHERE artist = 'Nirvana';
    --c.Grunge, Alternative Rock
SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;
    /*d.The Bodyguard
Jagged Little Pill
Come On Over
Falling into You
Let's Talk About Love
Dangerous
The Immaculate Collection
Titanic: Music from the Motion Picture
Metallica
Nevermind
Supernatural*/
SELECT name FROM albums WHERE sales < 20;
/*e.Grease: The Original Soundtrack from the Motion Picture
Bad
Sgt. Pepper's Lonely Hearts Club Band
Dirty Dancing
Let's Talk About Love
Dangerous
The Immaculate Collection
Abbey Road
Born in the U.S.A.
Brothers in Arms
Titanic: Music from the Motion Picture
Nevermind
The Wall*/
SELECT name FROM albums WHERE genre LIKE '%Rock%';
/*f. Thriller
Back in Black
The Dark Side of the Moon
Bat Out of Hell
Their Greatest Hits (19711975)
Rumours
Led Zeppelin IV
Bad
Jagged Little Pill
Falling into You
Sgt. Pepper's Lonely Hearts Club Band
Hotel California
Dirty Dancing
Let's Talk About Love
1
Dangerous
Abbey Road
Born in the U.S.A.
Brothers in Arms
Nevermind
The Wall
Supernatural
Appetite for Destruction

My query actually does contain both those additional genres. My original statement wouldn't return values that had rock in addition to more genres.
I then decided to just see if it contained the string "rock" which returned the hybrid genres. */