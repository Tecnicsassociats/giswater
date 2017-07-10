/*
This file is part of Giswater 2.0
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = "SCHEMA_NAME", public, pg_catalog;
ALTER TABLE "om_visit_x_gully" DROP CONSTRAINT IF EXISTS "om_visit_x_gully_visit_id_fkey";
ALTER TABLE "om_visit_x_gully" DROP CONSTRAINT IF EXISTS "om_visit_x_gully_gully_id_fkey";


ALTER TABLE "om_visit_x_gully" ADD CONSTRAINT "om_visit_x_gully_visit_id_fkey" FOREIGN KEY ("visit_id") REFERENCES "om_visit" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "om_visit_x_gully" ADD CONSTRAINT "om_visit_x_gully_gully_id_fkey" FOREIGN KEY ("gully_id") REFERENCES "gully" ("gully_id") ON DELETE RESTRICT ON UPDATE CASCADE;
