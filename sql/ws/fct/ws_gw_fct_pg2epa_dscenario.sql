﻿/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

DROP FUNCTION IF EXISTS "SCHEMA_NAME".gw_fct_pg2epa_check(character varying );
CREATE OR REPLACE FUNCTION SCHEMA_NAME.gw_fct_pg2epa_check (result_id_var character varying)  RETURNS integer AS $BODY$
DECLARE

rec_options 	record;
rec_demand		record;
dscenario_aux	integer;      

BEGIN

--  Search path
    SET search_path = "SCHEMA_NAME", public;

	SELECT * INTO rec_options FROM inp_options;
	SELECT dscenario_id INTO dscenario_aux FROM inp_options WHERE cur_user=current_user;

	RAISE NOTICE 'Starting pg2epa for filling demand scenario';
	
	FOR rec_demand IN SELECT * FROM inp_demand
	LOOP	
		UPDATE rpt_inp_node SET demand=demand+rec_demand.demand
		WHERE node_id=rec_demand.node_id AND rec_demand.dscenario_id IS NULL OR rec_demand.dscenario_id=dscenario_aux;
	END LOOP;
	
	
	
	
	
RETURN 1;
	
	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;