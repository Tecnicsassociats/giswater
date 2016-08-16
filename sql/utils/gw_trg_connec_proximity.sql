/*
This file is part of Giswater
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


CREATE OR REPLACE FUNCTION "SCHEMA_NAME".gw_trg_connec_proximity() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE 
    numNodes numeric;
    rec record;

BEGIN

    EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';

    -- Get connec tolerance from config table
    SELECT * INTO rec FROM config;

    IF TG_OP = 'INSERT' THEN
		-- Existing connecs  
		numNodes:= (SELECT COUNT(*) FROM connec WHERE connec.the_geom && ST_Expand(NEW.the_geom, rec.connec_proximity));


    ELSIF TG_OP = 'UPDATE' THEN
		-- Existing connecs  
		DROP TABLE IF EXISTS table_holder;
		CREATE TEMP TABLE table_holder AS SELECT * FROM connec WHERE  ST_DWithin(NEW.the_geom, connec.the_geom, rec.connec_proximity);
		numNodes:= (SELECT COUNT(*) FROM table_holder WHERE table_holder.connec_id != NEW.connec_id);

END IF;

    -- If there is an existing connec closer than 'rec.connec_tolerance' meters --> error
    IF (numNodes > 0) AND (rec.connec_proximity_control IS TRUE) THEN
        RETURN audit_function (185,130);
    END IF;

    RETURN NEW;
    
END; 
$$;



CREATE TRIGGER gw_trg_connec_proximity_insert BEFORE INSERT ON "SCHEMA_NAME"."connec" 
FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME"."gw_trg_connec_proximity"();

CREATE TRIGGER gw_trg_connec_proximity_update AFTER UPDATE ON "SCHEMA_NAME"."connec" 
FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME"."gw_trg_connec_proximity"();

