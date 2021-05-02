/*
Kevin Sass
CSC 355 Section 401
Assignment 4
October 14, 2019
*/


-- 1.
SELECT FIRSTNAME, LASTNAME, INSURANCE
    FROM PATIENT
    WHERE DOCTORID IN (SELECT ID
                            FROM DOCTOR
                            WHERE MEDICALGROUP = '447');
							
-- 2.
SELECT COUNT(COST), AVG(COST)
    FROM PROCEDURE
    WHERE COST > 5000;
	
-- 3.
SELECT INSURANCE, COUNT(PID)
    FROM PATIENT INNER JOIN VISIT ON PID = ID
    GROUP BY INSURANCE;
	
-- 4.
SELECT SUM(COST)
    FROM PROCEDURE
    WHERE CODE IN (SELECT PCODE
                        FROM SCHEDULE
                        WHERE PID = (SELECT ID
                                        FROM PATIENT
                                        WHERE LASTNAME = 'Thompson' AND FIRSTNAME = 'Robert'));

-- 5.
SELECT DOCTOR.ID, NAME, AVG(AGE)
    FROM PATIENT INNER JOIN DOCTOR ON DOCTORID = DOCTOR.ID
    GROUP BY DOCTOR.ID, NAME;
	
-- 6.
SELECT ID, FIRSTNAME, LASTNAME
    FROM PATIENT INNER JOIN VISIT ON ID = PID
    WHERE ADMISSIONDATE <= '01-OCT-19' AND DISCHARGEDATE >= '01-OCT-19' OR DISCHARGEDATE IS NULL;
	
-- 7.
SELECT DESCRIPTION, FIRSTNAME, LASTNAME, ID
    FROM (PATIENT INNER JOIN SCHEDULE ON ID = PID)
        INNER JOIN PROCEDURE ON PCODE = CODE
    WHERE PROCEDUREDATE = '30-SEP-19';
	
-- 8.
SELECT CODE, COUNT(PCODE), COUNT(PCODE)*COST
    FROM PROCEDURE LEFT OUTER JOIN SCHEDULE ON CODE = PCODE
    GROUP BY CODE, COST
    ORDER BY COUNT(PCODE)*COST DESC;