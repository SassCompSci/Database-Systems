/*
Kevin Sass
CSC 355 Section 401
Assignment 3
October 7, 2019
*/

-- 1.
SELECT Name, City, State
    FROM LIBRARY
    WHERE STATE = 'CA' OR STATE = 'FL';
	
-- 2.
SELECT Name
    FROM LIBRARY
    WHERE Name LIKE '%Free%'
    ORDER BY Name;
	
-- 3.
SELECT Title, Year, Price
    FROM BOOK
    WHERE Author = 'Jeff Vandermeer' AND Year >= 2015
    ORDER BY Year;
	
-- 4.
SELECT Author, AVG(Price)
    FROM BOOK
    GROUP BY Author
    ORDER BY AVG(Price) DESC;
	
-- 5.
SELECT Year, COUNT(ISBN)
    FROM BOOK
    GROUP BY Year
    ORDER BY Year DESC;
	
-- 6.
SELECT LibraryID, MAX(Copies)
    FROM BOOKORDER
    GROUP BY LibraryID;
	
-- 7.
SELECT DISTINCT Name
    FROM LIBRARY INNER JOIN BOOKORDER ON ID = LibraryID
    WHERE OrderDate = '03-FEB-17';
	
-- 8.
SELECT Title
    FROM (BOOK INNER JOIN BOOKORDER ON BOOK.ISBN = BOOKORDER.ISBN)
        INNER JOIN LIBRARY ON ID = LibraryID
    WHERE Name = 'Central Library of Miami'
    ORDER BY Title;
	
-- 9.
SELECT BOOK.ISBN, Title, COUNT(Copies)
    FROM BOOK INNER JOIN BOOKORDER ON BOOK.ISBN = BOOKORDER.ISBN
    WHERE Year = '2013'
    GROUP BY BOOK.ISBN, Title;
    
-- 10.
SELECT NVL(LibraryID, 0), COUNT(OrderID), NVL(SUM(Copies), 0)
    FROM LIBRARY LEFT OUTER JOIN BOOKORDER ON ID = LibraryID
    GROUP BY LibraryID
    ORDER BY SUM(Copies) DESC;