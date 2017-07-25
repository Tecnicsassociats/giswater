/*
This file is part of Giswater 2.0
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = "SCHEMA_NAME", public, pg_catalog;


CREATE SEQUENCE sample_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE SEQUENCE point_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- ----------------------------
--URN
-- ----------------------------
CREATE SEQUENCE urn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
-------------------------------
-- Topo analysis

RENAME TABLE anl_arc_no_startend_node to _anl_arc_no_startend_node;
RENAME CONSTRAINT anl_arc_no_startend_node_pkey to _anl_arc_no_startend_node_pkey;
RENAME INDEX anl_arc_no_startend_node_index to ON _anl_arc_no_startend_node_index;

 
CREATE TABLE "anl_arc_no_startend_node"(
id serial not null,
arc_id character varying(16),
the_geom geometry(LINESTRING,SRID_VALUE),
the_geom_p geometry(POINT,SRID_VALUE),
CONSTRAINT anl_arc_no_startend_node_pkey PRIMARY KEY (arc_id)
);

CREATE INDEX anl_arc_no_startend_node_index ON anl_arc_no_startend_node USING GIST (the_geom);


-- ----------------------------
--IMPROVE STATE STRATEGY
-- ----------------------------

ALTER TABLE arc RENAME state TO _state;
ALTER TABLE node RENAME state TO _state;
ALTER TABLE connec RENAME state TO _state;
ALTER TABLE vnode RENAME state TO _state;
--ALTER TABLE link RENAME state TO _state;
--ALTER TABLE point RENAME state TO _state;
ALTER TABLE samplepoint RENAME state TO _state;
ALTER TABLE element RENAME state TO _state;


ALTER TABLE arc ADD COLUMN state int2;
ALTER TABLE node ADD COLUMN state int2;
ALTER TABLE connec ADD COLUMN state int2;
ALTER TABLE polygon ADD COLUMN state int2;
ALTER TABLE vnode ADD COLUMN state int2;
--ALTER TABLE link ADD COLUMN state int2;
ALTER TABLE point ADD COLUMN state int2;
ALTER TABLE samplepoint ADD COLUMN state int2;
ALTER TABLE element ADD COLUMN state int2;

ALTER TABLE value_state RENAME id TO _id;
ALTER TABLE value_state ADD COLUMN id int2;


-- fill values on new filled id
--UPDATE value_state c SET id=c2.seqnum FROM (SELECT c2.*, row_number()OVER () as seqnum FROM ws_sample_dev.value_state c2) c2 where c2._id=c._id;

-- Changing pk
ALTER TABLE value_state DROP CONSTRAINT value_state_pkey CASCADE;
ALTER TABLE value_state ADD CONSTRAINT value_state_pkey  PRIMARY KEY(id);



-- ----------------------------
--GLOBAL STATE/PSECTOR SELECTION
-- ----------------------------

CREATE TABLE selector_state
(
  state_id smallint NOT NULL,
  cur_user text,
  CONSTRAINT state_selector_pkey PRIMARY KEY (state_id)
);



CREATE TABLE selector_psector
(
  psector_id varchar(16) NOT NULL,
  cur_user text,
  CONSTRAINT psector_selector_pkey PRIMARY KEY (psector_id)
);


ALTER TABLE plan_arc_x_psector ADD COLUMN state smallint;
ALTER TABLE plan_arc_x_psector ADD COLUMN node_1 varchar(16);
ALTER TABLE plan_arc_x_psector ADD COLUMN node_2 varchar(16);

ALTER TABLE plan_node_x_psector ADD COLUMN state smallint;




-- ----------------------------
--DIMENSIONS
-- ----------------------------
	CREATE SEQUENCE dimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dimensions
(
  id bigserial NOT NULL,
  distance numeric(12,4),
  depth numeric(12,4),
  the_geom geometry(LineString,SRID_VALUE),
  x_label double precision,
  y_label double precision,
  rotation_label double precision,
  offset_label double precision,
  direction_arrow boolean,
  x_symbol double precision,
  y_symbol double precision,
  feature_id character varying,
  feature_type character varying,
  CONSTRAINT id PRIMARY KEY (id));
  
  
  -- ----------------------------
--Link 
-- ----------------------------
ALTER TABLE link RENAME column connec_id TO feature_id;
ALTER TABLE link ADD COLUMN featurecat_id character varying(50);
ALTER TABLE link ADD COLUMN "state" int2;

ALTER TABLE link DROP CONSTRAINT IF EXISTS "link_featurecat_id_fkey";
ALTER TABLE link ADD CONSTRAINT link_featurecat_id_fkey FOREIGN KEY (featurecat_id) REFERENCES cat_feature (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE RESTRICT;


-- ----------------------------
-- STATE TOPOLOGYC COHERENCE
-- ----------------------------
ALTER TABLE value_state ADD COLUMN node_topocoh boolean;
ALTER TABLE value_state ADD COLUMN arc_topocoh boolean;

-- CATALOG OF FUNCTION
INSERT INTO audit_cat_function (id, name, function_type, context, input_params, return_type) 
VALUES (190, 'gw_fct_node_state_update', 'trigger function', 'utils', null,null);

INSERT INTO audit_cat_function (id, name, function_type, context, input_params, return_type) 
VALUES (200, 'gw_fct_arc_state_update', 'trigger function', 'utils', null,null);




-- ----------------------------
-- CUSTOM FIELDS
-- ----------------------------
DROP TABLE IF EXISTS man_custom_field_parameter;
CREATE TABLE man_custom_field_parameter(
field_id character varying (50) NOT NULL PRIMARY KEY,
descript character varying (254),
feature_type character varying (18) NOT NULL,
data_type character varying (18) NOT NULL,
not_null boolean,
fk_table character varying (50),
fk_key_field character varying (50),
fk_value_field character varying (50)
);


DROP TABLE IF EXISTS man_custom_field;
CREATE TABLE man_custom_field(
id serial NOT NULL PRIMARY KEY,
feature_id character varying (16),
field_id character varying (50) NOT NULL,
value character varying (50),
tstamp timestamp default now()
);


ALTER TABLE man_custom_field DROP CONSTRAINT IF EXISTS "man_custom_field_man_custom_field_parameter_fkey";
ALTER TABLE man_custom_field_parameter DROP CONSTRAINT IF EXISTS "man_custom_field_parameter_cat_feature_fkey";

 ALTER TABLE man_custom_field ADD CONSTRAINT man_custom_field_man_custom_field_parameter_fkey FOREIGN KEY (field_id) REFERENCES man_custom_field_parameter (field_id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE RESTRICT;
 ALTER TABLE man_custom_field_parameter ADD CONSTRAINT man_custom_field_parameter_cat_feature_fkey FOREIGN KEY (feature_type) REFERENCES cat_feature (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE RESTRICT;
 
-- ----------------------------
-- IMPROVE STATE TOPOLOGY COHERENCE TOOLS
-- ----------------------------


-- FIX ANL/MAN TOOLS SELECTOR ONLY WITH ONE ROW
CREATE UNIQUE INDEX anl_selector_state_one_row ON anl_selector_state((id IS NOT NULL));
CREATE UNIQUE INDEX man_selector_state_one_row ON man_selector_state((id IS NOT NULL));


--
ALTER TABLE value_state ADD COLUMN node_topology_coherence boolean;
ALTER TABLE value_state ADD COLUMN arc_topology_coherence boolean;




-- ----------------------------
-- VDEFAULT STRATEGY
-- ----------------------------
CREATE TABLE config_vdefault (
id serial PRIMARY KEY,
"parameter" character varying (30),
"value" character varying (30),
"user" character varying (30)
);
/*
ALTER TABLE config ADD COLUMN state_vdefault character varying(16);
ALTER TABLE config ADD COLUMN workcat_vdefault character varying(30);
ALTER TABLE config ADD COLUMN verified_vdefault character varying(20);
ALTER TABLE config ADD COLUMN builtdate_vdefault date;

ALTER TABLE "config" ADD CONSTRAINT "confige_state_vdefault_fkey" FOREIGN KEY ("state_vdefault") REFERENCES "value_state" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "config" ADD CONSTRAINT "config_workcat_vdefault_fkey" FOREIGN KEY ("workcat_vdefault") REFERENCES "cat_work" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "config" ADD CONSTRAINT "config_verified_vdefault_fkey" FOREIGN KEY ("verified_vdefault") REFERENCES "value_verified" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "config" ADD CONSTRAINT "config_nodeinsert_catalog_vdefault_fkey" FOREIGN KEY ("nodeinsert_catalog_vdefault") REFERENCES "cat_node" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;

*/


-- ----------------------------
-- ADDING GEOMETRY TO CATALOG OF WORKS
-- ----------------------------

ALTER TABLE cat_work ADD COLUMN the_geom public.geometry(MULTIPOLYGON, SRID_VALUE);

-- ----------------------------
-- TRACEABILITY
-- ----------------------------


CREATE TABLE om_traceability (
id serial,
type character varying(50),
arc_id character varying(16),
arc_id1 character varying(16),
arc_id2 character varying(16),
node_id character varying(16),
tstamp timestamp(6) without time zone,
"user" character varying(50)
);


 
  -- ----------------------------
-- VALUE DOMAIN ON WEB/MOBILE CLIENT
-- ----------------------------
  
  CREATE TABLE config_client_dvalue
(
  id serial NOT NULL,
  table_id text,
  column_id text,
  dv_table text,
  dv_key_column text,
  dv_value_column text,
  orderby_value boolean,
  allow_null boolean,
  CONSTRAINT config_client_dvalue_pkey PRIMARY KEY (id)/*,
  CONSTRAINT config_client_value_colum_id_fkey FOREIGN KEY (dv_table, dv_key_column)
      REFERENCES db_cat_table_x_column (db_cat_table_id, column_name) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT config_client_value_origin_id_fkey FOREIGN KEY (table_id, column_id)
      REFERENCES db_cat_table_x_column (db_cat_table_id, column_name) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT*/
);




-- ----------------------------
-- IMPROVE VISIT STRATEGY
-- ----------------------------

CREATE TABLE om_visit_cat
(
  id serial NOT NULL,
  type character varying (18),
  short_des character varying (30),
  descript text,
  startdate date DEFAULT now(),
  enddate date,
  CONSTRAINT om_visit_cat_pkey PRIMARY KEY (id)
);



ALTER TABLE om_visit ADD COLUMN visitcat_id integer;

ALTER TABLE om_visit DROP CONSTRAINT IF EXISTS "om_visit_om_visit_cat_id_fkey";
ALTER TABLE om_visit   ADD CONSTRAINT om_visit_om_visit_cat_id_fkey FOREIGN KEY (visitcat_id) REFERENCES om_visit_cat (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE RESTRICT;


 
CREATE TABLE om_visit_event_photo
(
  id serial NOT NULL,
  visit_id bigint NOT NULL,
  event_id bigint NOT NULL,
  tstamp timestamp(6) without time zone DEFAULT now(),
  value text,
  text text,
  compass double precision,
  CONSTRAINT om_visit_event_foto_pkey PRIMARY KEY (id),
  CONSTRAINT om_visit_event_foto_event_id_fkey FOREIGN KEY (event_id)
      REFERENCES om_visit_event (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT om_visit_event_foto_visit_id_fkey FOREIGN KEY (visit_id)
      REFERENCES om_visit (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ----------------------------
-- anl_arc_no_startend_node
-- ----------------------------

ALTER TABLE anl_arc_no_startend_node ADD COLUMN id serial;
ALTER TABLE anl_arc_no_startend_node ALTER COLUMN id SET NOT NULL;
ALTER TABLE anl_arc_no_startend_node DROP CONSTRAINT anl_arc_no_startend_node_pkey;
ALTER TABLE anl_arc_no_startend_node ADD CONSTRAINT anl_arc_no_startend_node_pkey PRIMARY KEY(id);
ALTER TABLE anl_arc_no_startend_node ADD COLUMN the_geom_p geometry(Point,SRID_VALUE);

-- ----------------------------
-- new node_cat fields
-- ----------------------------
ALTER TABLE cat_node ADD COLUMN "type" character varying(30);
ALTER TABLE cat_node ADD COLUMN brand character varying(30);
ALTER TABLE cat_node ADD COLUMN model character varying(30);



-- ----------------------------
-- new node_type/arc_type/connec_type fields
-- ----------------------------
ALTER TABLE node_type ADD COLUMN order_by integer;
ALTER TABLE node_type ADD COLUMN active_type boolean;
ALTER TABLE node_type ADD COLUMN code_autofill boolean;
ALTER TABLE node_type ADD COLUMN i18n character varying(30);
ALTER TABLE node_type ADD COLUMN shortcut_key text;

ALTER TABLE arc_type ADD COLUMN i18n character varying(30);

ALTER TABLE connec_type ADD COLUMN i18n character varying(30);




ALTER TABLE connec_type ADD COLUMN code_autofill boolean;

-- ----------------------------
-- review rules
-- ----------------------------

DROP RULE IF EXISTS review_status ON review_audit_node;
CREATE OR REPLACE RULE review_status AS ON INSERT TO review_audit_arc 
DO UPDATE review_arc SET verified='REVISED' WHERE arc_id=NEW.arc_id AND field_checked='TRUE';

DROP RULE IF EXISTS review_status ON review_audit_node;
CREATE OR REPLACE RULE review_status AS ON INSERT TO review_audit_node
DO UPDATE review_node SET verified='REVISED' WHERE node_id=NEW.node_id AND field_checked='TRUE';