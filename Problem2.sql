/*
Kevin Sass
CSC 355 Section 502
Assignment 6 Problem 2
March 13, 2019
*/


CREATE OR REPLACE TRIGGER InsertTrigger_MajCount 
	AFTER INSERT ON STUDENT
	FOR EACH ROW

	BEGIN
		UPDATE MAJOR 
		SET MajCount = MajCount + 1 
		WHERE MajName = NEW.StuMajor;
	END;
	/

CREATE OR REPLACE TRIGGER UpdateTrigger 
	BEFORE UPDATE ON STUDENT

	BEGIN
		raise_application_error(-20001, 'No updates are permitted to the STUDENT table');
	END;
	/

CREATE OR REPLACE TRIGGER DeleteTrigger_MajCount 
	AFTER DELETE ON STUDENT
	FOR EACH ROW

	BEGIN
		UPDATE MAJOR 
		SET MajCount = MajCount - 1 
		WHERE MajName = :old.StuMajor;
	END;
	/