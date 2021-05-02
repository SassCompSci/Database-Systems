/*
Kevin Sass
CSC 355 Section 401
Assignment 2
09/30/2019
*/

-- drop any existing table

DROP TABLE BOOKING;

DROP TABLE CUSTOMER;

DROP TABLE TOUR;

-- create tables

CREATE TABLE CUSTOMER
(
    CID     CHAR(4),
    CName   VARCHAR2(20),
    CPhone   CHAR(10),
    
    CONSTRAINT PK_CUSTOMER PRIMARY KEY (CID)
);

CREATE TABLE TOUR
(
    TID   CHAR(5),
    DestinationName   VARCHAR2(50),
    Length   VARCHAR2(2)
					CHECK (Length > 0),
    Cost   NUMBER(6,2)
					CHECK (Cost BETWEEN 0 AND 9999.99),
    
    CONSTRAINT PK_TOUR PRIMARY KEY (TID)
);

CREATE TABLE BOOKING
(
    TourID   CHAR(5),
    CustomerID   CHAR(4),
    TourDate   DATE,
    
    CONSTRAINT PK_BOOKING PRIMARY KEY (TourID, CustomerID),
    
    CONSTRAINT FK_BOOKING_TOUR FOREIGN KEY (TourID) REFERENCES TOUR(TID),
    
    CONSTRAINT FK_BOOKING_CUSTOMER FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CID)
);

-- populate tables

INSERT INTO TOUR 
    VALUES ('98765', 'Paris, France', '30', 350);

INSERT INTO TOUR
    VALUES ('87654', 'Honolulu, Hawaii', '30', 770);
    
INSERT INTO TOUR
    VALUES ('76543', 'Tokyo, Japan', '30', 319);
    
INSERT INTO CUSTOMER
    VALUES ('1234', 'Kevin Sass', '7082245970');
    
INSERT INTO CUSTOMER
    VALUES ('2345', 'Timothy Glos', '7082950351');
    
INSERT INTO CUSTOMER
    VALUES ('3456', 'Kyle Keith', '7083691234');
    
INSERT INTO BOOKING
    VALUES ('98765', '1234', DATE '2018-01-13');
    
INSERT INTO BOOKING
    VALUES ('87654', '2345', DATE '2018-01-14');
    
INSERT INTO BOOKING
    VALUES ('76543', '3456', DATE '2018-01-15');
    
INSERT INTO BOOKING
    VALUES ('98765', '2345', DATE '2018-02-16');
    
INSERT INTO BOOKING
    VALUES ('98765', '3456', DATE '2018-02-17');
    
-- display table

SELECT * FROM CUSTOMER;

SELECT * FROM TOUR;

SELECT * FROM BOOKING;

commit;