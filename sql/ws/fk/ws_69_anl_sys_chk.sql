/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = "SCHEMA_NAME", public, pg_catalog;



ALTER TABLE SCHEMA_NAME.anl_mincut_cat_state ADD CONSTRAINT anl_mincut_cat_state_check CHECK (id IN (0,1,2));
ALTER TABLE SCHEMA_NAME.anl_mincut_cat_class ADD CONSTRAINT anl_mincut_cat_class_check CHECK (id IN (1,2,3));