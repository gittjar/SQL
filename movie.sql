-- Create table
CREATE TABLE Movie (
Id INT PRIMARY KEY IDENTITY(1,1),
Title NVARCHAR(160) NOT NULL,
ReleaseDate DATE NOT NULL,
Genre NVARCHAR(30) NOT NULL,
Price DECIMAL(18,2) NOT NULL,
ProductionComp NVARCHAR(70) NOT NULL,
Rating NVARCHAR(15) NULL, Image NVARCHAR(MAX) NULL
);

-- Chat GPT fill table with random movies
INSERT INTO Movie VALUES ('The Terminator', '1984-10-26', 'Action', 8.0, 'Orion Pictures', 'R', NULL);
INSERT INTO Movie VALUES ('Indiana Jones and Raiders of the Lost Ark', '1981-06-12', 'Adventure', 8.4, 'Paramount Pictures', 'PG', NULL);
INSERT INTO Movie VALUES ('E.T. the Extra-Terrestrial', '1982-06-11', 'Family', 7.8, 'Universal Pictures', 'PG', NULL);
INSERT INTO Movie VALUES ('Grease', '1978-06-16', 'Musical', 7.2, 'Paramount Pictures', 'PG', NULL);
INSERT INTO Movie VALUES ('Saturday Night Fever', '1977-12-14', 'Drama', 6.8, 'Paramount Pictures', 'R', NULL);
INSERT INTO Movie VALUES ('Dirty Dancing', '1987-08-21', 'Romance', 7.0, 'Vestron Pictures', 'PG-13', NULL);
INSERT INTO Movie VALUES ('Jaws', '1975-06-20', 'Thriller', 8.0, 'Universal Pictures', 'PG', NULL);
INSERT INTO Movie VALUES ('Ghostbusters', '1984-06-08', 'Comedy', 7.7, 'Columbia Pictures', 'PG', NULL);
INSERT INTO Movie VALUES ('Home Alone', '1990-11-16', 'Family', 7.6, '20th Century Fox', 'PG', NULL);
INSERT INTO Movie VALUES ('The Princess Bride', '1987-09-25', 'Adventure', 8.0, '20th Century Fox', 'PG', NULL);
INSERT INTO Movie VALUES ('The Exorcist', '1973-12-26', 'Horror', 8.0, 'Warner Bros.', 'R', NULL);
