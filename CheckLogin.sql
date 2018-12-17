DROP FUNCTION checklogin(character varying,character varying);
create or replace function CheckLogin(login_ varchar(1), pass_ varchar(1)) returns boolean as $$
BEGIN 
	IF EXISTS (select * from teacher where teacher.login = login_ AND teacher.pass = pass_) THEN
		RETURN TRUE;
	ELSE
		Return FALSE;
	END IF;
END; 
$$ LANGUAGE plpgsql;