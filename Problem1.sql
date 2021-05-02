/*
Kevin Sass
CSC 355 Section 502
Assignment 6 Problem 1
March 13, 2019
*/


declare
	payRec payinfo%rowtype;
	empPay number(10,2) := 0;
	totalPay number(10,2) := 0;
	CURSOR employeeCur is SELECT * FROM employee;
	employeeRec employeeCur%rowtype;

begin
	SELECT * 
	into payRec 
	FROM payinfo;
	
	dbms_output.put_line('Payroll data is: ' || payRec.regular || ' ' || payRec.overtime || ' ' || payRec.hourlimit);
	
	OPEN employeeCur;
	LOOP
		FETCH employeeCur into employeeRec;
		EXIT WHEN employeeCur%notfound;
		IF employeeRec.hours <= payRec.hourlimit THEN
			empPay := payRec.regular * employeeRec.hours;
		ELSE
			empPay := ((payRec.regular * payRec.hourlimit) + (payRec.overtime * (employeeRec.hours - payRec.hourlimit)));
		END IF;
		
		totalPay := totalPay + empPay;
		dbms_output.put_line(employeeRec.id || ' ' || employeeRec.name || ' ' || empPay);
	END LOOP;
	
	dbms_output.put_line('Payroll total is ' || totalPay);
end;
