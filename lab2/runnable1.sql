-- This is a sample file, and you should display a multiple-line comment
-- identifying the file, author, and date. Here's the format:
/*
   Name:   rerunnable1.sql
   Author: Daniel Melo
   Date:   30-APR-2020
*/

-- Put code that you call from other scripts here because they may create
-- their own log files. For example, you call other program scripts by
-- putting an "@" symbol before the name of a relative file name or a
-- fully qualified file name.


-- Open your log file and make sure the extension is ".txt".
SPOOL rerunnable.txt

-- Add an environment command to allow PL/SQL to print to console.
SET SERVEROUTPUT ON SIZE UNLIMITED


-- Put your code here, like this "Hello World!" program.
DECLARE
	lv_input VARCHAR2(100);
	lv_local VARCHAR2(10);
	lv_print VARCHAR(17);
	i_lenght NUMBER;
BEGIN
	
	lv_input := ‘&1’;
	i_length := LENGTH(lv_input);

	IF i_length <= 10
		THEN 
			lv_local := lv_input;
	ELSEIF i_length > 10
		THEN 
			lv_local := SUBSTR(lv_input, 1, i_switch);
	ENDIF;

	lv_print := ‘Hello ’ || lv_local || ’!’;
	dbms_output.put_line(lv_print);
EXCEPTION	WHEN OTHERS THEN	
    dbms_output.put_line(‘Hello World!’); 

END;
/

-- Close your log file.
SPOOL OFF

-- Instruct the program to exit SQL*Plus, which you need when you call a
-- a program from the command line. Please make sure you comment the
-- following command when you want to remain inside the interactive
-- SQL*Plus connection.
QUIT;