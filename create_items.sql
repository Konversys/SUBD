CREATE OR REPLACE FUNCTION create_items(group_number integer, in_erecord integer) RETURNS integer AS $BODY$
DECLARE
    i RECORD;
BEGIN
    FOR i IN SELECT * FROM student WHERE id_group = group_number LOOP
		RAISE NOTICE 'NAME is %', i.name;
		INSERT INTO ierecord (srating, erating, trating, id_erecord, id_student) VALUES (NULL, NULL, NULL, in_erecord, i.id);
		
    END LOOP;

    RETURN 1;
END;
$BODY$ LANGUAGE plpgsql;
