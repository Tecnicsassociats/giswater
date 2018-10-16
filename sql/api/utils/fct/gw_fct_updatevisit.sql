﻿/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


CREATE OR REPLACE FUNCTION "SCHEMA_NAME"."gw_fct_updatevisit"(visit_id int8, column_name varchar, value_new varchar) RETURNS pg_catalog.json AS $BODY$
DECLARE

--    Variables
    column_type character varying;
    schemas_array name[];
    sql_query varchar;
    return_event_manager_aux text;
    api_version json;


BEGIN


--    Set search path to local schema
    SET search_path = "SCHEMA_NAME", public;
    
--  get api version
    EXECUTE 'SELECT row_to_json(row) FROM (SELECT value FROM config_param_system WHERE parameter=''ApiVersion'') row'
        INTO api_version;

--    Get schema name
    schemas_array := current_schemas(FALSE);

--    Get column type
    EXECUTE 'SELECT data_type FROM information_schema.columns  WHERE table_schema = $1 AND table_name = ''om_visit'' AND column_name = $2'
        USING schemas_array[1], column_name
        INTO column_type;

--    Error control
    IF column_type ISNULL THEN
        RETURN ('{"status":"Failed","SQLERR":"Column ' || column_name || ' does not exist in table om_visit"}')::json;
    END IF;        

--    Value update
    sql_query := 'UPDATE om_visit SET ' || quote_ident(column_name) || ' = CAST(' || quote_literal(value_new) || ' AS ' || column_type || ') WHERE id = ' || visit_id::INT;
    EXECUTE sql_query;

/* only applied for arbrat viari (nodes).
    IF column_name='is_done' THEN
        IF value_new::boolean IS TRUE THEN
            SELECT gw_fct_om_visit_event_manager(visit_id::integer) INTO return_event_manager_aux;
        END IF;
    END IF;

*/

--    Control NULL's
    return_event_manager_aux := COALESCE(return_event_manager_aux, '');

    raise notice '%',return_event_manager_aux;

--    Return
    RETURN ('{"status":"Accepted", "apiVersion":'|| api_version ||', "geometry":"'||return_event_manager_aux||'"}')::json;    

--    Exception handling
 --   EXCEPTION WHEN OTHERS THEN 
   --     RETURN ('{"status":"Failed","SQLERR":' || to_json(SQLERRM) || ', "apiVersion":'|| api_version ||',"SQLSTATE":' || to_json(SQLSTATE) || '}')::json;


        
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE COST 100;
