﻿/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = "SCHEMA_NAME", public, pg_catalog;


DROP VIEW IF EXISTS v_ui_om_visit_x_node CASCADE;
CREATE OR REPLACE VIEW v_ui_om_visit_x_node AS 
SELECT
om_visit_event.id as event_id,
om_visit.id as visit_id,
om_visit.ext_code as code,
om_visit.visitcat_id as visitcat_id,
om_visit.startdate visit_start,
om_visit.enddate visit_end,
om_visit.user_name,
om_visit.is_done,
om_visit_event.tstamp,
om_visit_x_node.node_id,
om_visit_event.parameter_id,
om_visit_parameter.parameter_type,
om_visit_event.value,
om_visit_event.xcoord,
om_visit_event.ycoord,
om_visit_event.compass,
om_visit_event.ext_code as event_ext_code,
CASE WHEN a.event_id is null then false ELSE true END AS gallery,
CASE WHEN b.visit_id is null then false ELSE true END AS document
FROM om_visit_event
JOIN om_visit ON om_visit.id = om_visit_event.visit_id
JOIN om_visit_x_node ON om_visit_x_node.visit_id=om_visit.id
JOIN om_visit_parameter ON om_visit_parameter.id=om_visit_event.parameter_id
JOIN node ON node.node_id = om_visit_x_node.node_id
LEFT JOIN (SELECT DISTINCT event_id from SCHEMA_NAME.om_visit_event_photo ) a on event_id=om_visit_event.id
LEFT JOIN (SELECT DISTINCT visit_id from SCHEMA_NAME.doc_x_visit ) b on b.visit_id=om_visit.id
ORDER BY node_id;


DROP VIEW IF EXISTS v_ui_om_visit_x_arc CASCADE;
CREATE OR REPLACE VIEW v_ui_om_visit_x_arc AS 
SELECT
om_visit_event.id as event_id,
om_visit.id as visit_id,
om_visit.ext_code as code,
om_visit.visitcat_id as visitcat_id,
om_visit.startdate visit_start,
om_visit.enddate visit_end,
om_visit.user_name,
om_visit.is_done,
om_visit_event.tstamp,
om_visit_x_arc.arc_id,
om_visit_event.parameter_id,
om_visit_parameter.parameter_type,
om_visit_event.value,
om_visit_event.xcoord,
om_visit_event.ycoord,
om_visit_event.compass,
om_visit_event.ext_code as event_ext_code,
CASE WHEN a.event_id is null then false ELSE true END AS gallery,
CASE WHEN b.visit_id is null then false ELSE true END AS document
FROM om_visit_event
JOIN om_visit ON om_visit.id = om_visit_event.visit_id
JOIN om_visit_x_arc ON om_visit_x_arc.visit_id=om_visit.id
JOIN om_visit_parameter ON om_visit_parameter.id=om_visit_event.parameter_id
JOIN arc ON arc.arc_id = om_visit_x_arc.arc_id
LEFT JOIN (SELECT DISTINCT event_id from SCHEMA_NAME.om_visit_event_photo ) a on event_id=om_visit_event.id
LEFT JOIN (SELECT DISTINCT visit_id from SCHEMA_NAME.doc_x_visit ) b on b.visit_id=om_visit.id
ORDER BY arc_id;


DROP VIEW IF EXISTS v_ui_om_visit_x_connec CASCADE;
CREATE OR REPLACE VIEW v_ui_om_visit_x_connec AS 
SELECT
om_visit_event.id as event_id,
om_visit.id as visit_id,
om_visit.ext_code as code,
om_visit.visitcat_id as visitcat_id,
om_visit.startdate visit_start,
om_visit.enddate visit_end,
om_visit.user_name,
om_visit.is_done,
om_visit_event.tstamp,
om_visit_x_connec.connec_id,
om_visit_event.parameter_id,
om_visit_parameter.parameter_type,
om_visit_event.value,
om_visit_event.xcoord,
om_visit_event.ycoord,
om_visit_event.compass,
om_visit_event.ext_code as event_ext_code,
CASE WHEN a.event_id is null then false ELSE true END AS gallery,
CASE WHEN b.visit_id is null then false ELSE true END AS document
FROM om_visit_event
JOIN om_visit ON om_visit.id = om_visit_event.visit_id
JOIN om_visit_x_connec ON om_visit_x_connec.visit_id=om_visit.id
JOIN om_visit_parameter ON om_visit_parameter.id=om_visit_event.parameter_id
JOIN connec ON connec.connec_id = om_visit_x_connec.connec_id
LEFT JOIN (SELECT DISTINCT event_id from SCHEMA_NAME.om_visit_event_photo ) a on event_id=om_visit_event.id
LEFT JOIN (SELECT DISTINCT visit_id from SCHEMA_NAME.doc_x_visit ) b on b.visit_id=om_visit.id
ORDER BY connec_id;



   