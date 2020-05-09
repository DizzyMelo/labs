/* Show the output */
SET SERVEROUTPUT ON
SET VERIFY OFF;

DECLARE
  TYPE r_type IS RECORD
    (
      test_id NUMBER
      ,name   VARCHAR2(10)
      ,d_date DATE
    );
  r R_TYPE;
  lv_input1 VARCHAR2(20);
  lv_input2 VARCHAR2(20);
  lv_input3 VARCHAR2(20);
  v_length  NUMBER := 10;
BEGIN
  /* Get input from the user and assign to the record */
  lv_input1 := CAST('&1' AS NUMBER);
  lv_input2 := '&2';
  lv_input3 := '&3';

  IF LENGTH(lv_input2) > v_length
  THEN
    lv_input2 := substr(lv_input2,1,10);
  END IF;

  r.test_id := lv_input1;
  r.name := lv_input2;
  r.d_date := to_date(lv_input3, 'mm/dd/yyyy');

  /* Print the result */
  dbms_output.put_line('r.test_id = ' || r.test_id);
  dbms_output.put_line('r.name = ' || r.name);
  dbms_output.put_line('r.d_date = ' || to_char(r.d_date));

  EXCEPTION
    WHEN others THEN
      dbms_output.put_line('Error! ' || SQLERRM);
END;
/