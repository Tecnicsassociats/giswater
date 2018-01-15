﻿/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

--FUNCTION CODE: 1120
   
CREATE OR REPLACE FUNCTION "SCHEMA_DATA".gw_trg_edit_plan_psector() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE 
    v_sql varchar;
	plan_psector_seq int8;
BEGIN

    EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';
    
    -- Control insertions ID
    IF TG_OP = 'INSERT' THEN
		
		-- Scale_vdefault
			IF (NEW.scale IS NULL) THEN
				NEW.scale := (SELECT "value" FROM config_param_user WHERE "parameter"='psector_scale_vdefault' AND "cur_user"="current_user"())::numeric (8,2);
			END IF;
			
		-- Rotation_vdefault
			IF (NEW.rotation IS NULL) THEN
				NEW.rotation := (SELECT "value" FROM config_param_user WHERE "parameter"='psector_rotation_vdefault' AND "cur_user"="current_user"())::numeric (8,4);
			END IF;
			
		-- Gexpenses_vdefault
			IF (NEW.gexpenses IS NULL) THEN
				NEW.gexpenses := (SELECT "value" FROM config_param_user WHERE "parameter"='psector_gexpenses_vdefault' AND "cur_user"="current_user"())::numeric(4,2);
			END IF;
			
		-- Vat_vdefault
			IF (NEW.vat IS NULL) THEN
				NEW.vat := (SELECT "value" FROM config_param_user WHERE "parameter"='psector_vat_vdefault' AND "cur_user"="current_user"())::numeric(4,2);
			END IF;
			
		-- Other_vdefault
			IF (NEW.other IS NULL) THEN
				NEW.other := (SELECT "value" FROM config_param_user WHERE "parameter"='psector_other_vdefault' AND "cur_user"="current_user"())::numeric(4,2);
			END IF;
		
		-- Type_vdefault
			IF (NEW.psector_type IS NULL) THEN
				NEW.psector_type := (SELECT "value" FROM config_param_user WHERE "parameter"='psector_type_vdefault' AND "cur_user"="current_user"())::integer;
			END IF;
			
	    -- Control insertions ID
			IF (NEW.psector_id IS NULL) THEN
				SELECT max(psector_id::integer) INTO plan_psector_seq FROM plan_psector WHERE psector_id ~ '^\d+$';
				PERFORM setval('plan_psector_seq',plan_psector_seq,true);
				NEW.psector_id:= (SELECT nextval('plan_psector_seq'));
			END IF;
			
		  -- Sector ID
				IF (NEW.sector_id IS NULL) THEN
				IF ((SELECT COUNT(*) FROM sector) = 0) THEN
					RETURN audit_function(1008,1120);  
				END IF;
				NEW.sector_id:= (SELECT sector_id FROM sector WHERE ST_DWithin(NEW.the_geom, sector.the_geom,0.001) LIMIT 1);
				IF (NEW.sector_id IS NULL) THEN
					RETURN audit_function(1010,1120);          
				END IF;            
			END IF;
			
			
			--Exploitation ID
             IF ((SELECT COUNT(*) FROM exploitation) = 0) THEN
                PERFORM audit_function(1012,1120);
				RETURN NULL;				
            END IF;
			IF NEW.expl_id is null THEN
			NEW.expl_id := (SELECT expl_id FROM exploitation WHERE ST_DWithin(NEW.the_geom, exploitation.the_geom,0.001) LIMIT 1);
			END IF;
            IF (NEW.expl_id IS NULL) THEN
               PERFORM audit_function(1014,1120);
				RETURN NULL; 
            END IF;
	
	
               
        INSERT INTO plan_psector (psector_id, name, descript, priority, text1, text2, observ, rotation, scale, sector_id, atlas_id, gexpenses, vat, other, the_geom, expl_id, psector_type)
		VALUES  (NEW.psector_id, NEW.name, NEW.descript, NEW.priority, NEW.text1, NEW.text2, NEW.observ, NEW.rotation, NEW.scale, NEW.sector_id, NEW.atlas_id, NEW.gexpenses, NEW.vat, NEW.other, NEW.the_geom, NEW.expl_id, NEW.psector_type);
		
        RETURN NEW;

    ELSIF TG_OP = 'UPDATE' THEN
		UPDATE plan_psector 
		SET psector_id=NEW.psector_id, name=NEW.name, descript=NEW.descript, priority=NEW.priority, text1=NEW.text1, text2=NEW.text2, observ=NEW.observ, rotation=NEW.rotation, scale=NEW.scale, sector_id=NEW.sector_id, atlas_id=NEW.atlas_id, 
		gexpenses=NEW.gexpenses, vat=NEW.vat, other=NEW.other, the_geom=NEW.the_geom, expl_id=NEW.expl_id
		WHERE psector_id=OLD.psector_id;		
                
        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
        DELETE FROM plan_psector WHERE psector_id = OLD.psector_id;
        RETURN NULL;
   
    END IF;

END;
$$;


DROP TRIGGER IF EXISTS gw_trg_edit_plan_psector ON "SCHEMA_DATA".v_edit_plan_psector;
CREATE TRIGGER gw_trg_edit_plan_psector INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_DATA".v_edit_plan_psector
FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_DATA".gw_trg_edit_plan_psector();

      