/*
This file is part of Giswater 2.0
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = "SCHEMA_NAME", public, pg_catalog;
----------------------------
--    GIS EDITING VIEWS
----------------------------

DROP VIEW IF EXISTS v_edit_node CASCADE;
CREATE OR REPLACE VIEW v_edit_node AS
SELECT 
node.node_id, 
node.elevation, 
node.depth, 
node.node_type,
node.nodecat_id,
cat_node.matcat_id AS "cat_matcat_id",
cat_node.pnom AS "cat_pnom",
cat_node.dnom AS "cat_dnom",
node.epa_type,
node.sector_id, 
node."state", 
node.annotation, 
node.observ, 
node."comment",
node.dma_id,
dma.presszonecat_id,
node.soilcat_id,
node.category_type,
node.fluid_type,
node.location_type,
node.workcat_id,
node.buildercat_id,
node.builtdate,
node.ownercat_id,
node.adress_01,
node.adress_02,
node.adress_03,
node.descript,
cat_node.svg AS "cat_svg",
node.rotation,
node.link,
node.verified,
node.the_geom
FROM ("SCHEMA_NAME".node 
LEFT JOIN cat_node ON (((node.nodecat_id)::text = (cat_node.id)::text))
LEFT JOIN dma ON (((node.dma_id)::text = (dma.dma_id)::text)));


DROP VIEW IF EXISTS v_edit_arc CASCADE;
CREATE VIEW v_edit_arc AS
SELECT 
arc.arc_id,
arc.node_1,
arc.node_2,
arc.arccat_id, 
cat_arc.arctype_id AS "cat_arctype_id",
cat_arc.matcat_id AS "cat_matcat_id",
cat_arc.pnom AS "cat_pnom",
cat_arc.dnom AS "cat_dnom",
st_length2d(arc.the_geom)::numeric(12,2) AS gis_length,
arc.epa_type,
arc.sector_id, 
arc."state", 
arc.annotation, 
arc.observ, 
arc."comment",
arc.custom_length,
arc.dma_id,
dma.presszonecat_id,
arc.soilcat_id,
arc.category_type,
arc.fluid_type,
arc.location_type,
arc.workcat_id,
arc.buildercat_id,
arc.builtdate,
arc.ownercat_id,
arc.adress_01,
arc.adress_02,
arc.adress_03,
arc.descript,
cat_arc.svg AS "cat_svg",
arc.rotation,
arc.link,
arc.verified,
arc.the_geom
FROM ("SCHEMA_NAME".arc 
LEFT JOIN cat_arc ON (((arc.arccat_id)::text = (cat_arc.id)::text))
LEFT JOIN dma ON (((arc.dma_id)::text = (dma.dma_id)::text)));


DROP VIEW IF EXISTS v_edit_link CASCADE;
CREATE OR REPLACE VIEW v_edit_link AS
SELECT 
link.link_id,
link.connec_id,
link.vnode_id,
st_length2d(link.the_geom) as gis_length,
link.custom_length,
connec.connecat_id,
link.the_geom
FROM ("SCHEMA_NAME".link 
LEFT JOIN connec ON (((connec.connec_id)::text = (link.connec_id)::text))
);


DROP VIEW IF EXISTS v_edit_valve CASCADE;
CREATE OR REPLACE VIEW v_edit_valve AS 
SELECT 
node.node_id,
cat_node.nodetype_id,
man_valve.type,
man_valve.opened,
man_valve.acessibility,
man_valve.broken,
man_valve.mincut_anl,
man_valve.hydraulic_anl,
node.the_geom
FROM node
JOIN cat_node ON node.nodecat_id::text=cat_node.id::text
JOIN man_valve ON node.node_id::text=man_valve.node_id::text
JOIN man_selector_valve ON cat_node.nodetype_id::text=man_selector_valve.id::text;