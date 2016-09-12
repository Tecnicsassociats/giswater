/*
This file is part of Giswater 2.0
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = "SCHEMA_NAME", public, pg_catalog;

-- -----------------------------
-- SEQUENCES
-- -----------------------------

CREATE SEQUENCE "version_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "cat_node_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "cat_arc_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE SEQUENCE "node_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE SEQUENCE "arc_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
CREATE SEQUENCE "pol_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
	
CREATE SEQUENCE "connec_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "vnode_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 
CREATE SEQUENCE "link_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE SEQUENCE "gully_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
CREATE SEQUENCE "element_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE SEQUENCE "element_x_arc_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE SEQUENCE "element_x_node_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE "element_x_connec_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE SEQUENCE "element_x_gully_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




-- ----------------------------
-- Table system structure 
-- ----------------------------

 
CREATE TABLE "arc_type" (
"id" varchar(18)   NOT NULL,
"type" varchar(18)   NOT NULL,
"epa_default" varchar(18)   NOT NULL,
"man_table" varchar(18)   NOT NULL,
"epa_table" varchar(18)   NOT NULL,
"event_table" varchar(18)   NOT NULL,
CONSTRAINT arc_type_pkey PRIMARY KEY (id)
);


CREATE TABLE "node_type" (
"id" varchar(18)   NOT NULL,
"type" varchar(18)   NOT NULL,
"epa_default" varchar(18)   NOT NULL,
"man_table" varchar(18)   NOT NULL,
"epa_table" varchar(18)   NOT NULL,
"event_table" varchar(18)   NOT NULL,
CONSTRAINT node_type_pkey PRIMARY KEY (id)
);

CREATE TABLE "element_type" (
"id" varchar(18)   NOT NULL,
"event_table" varchar(18)   NOT NULL,
CONSTRAINT element_type_pkey PRIMARY KEY (id)
);



-- ----------------------------
-- Table structure for CATALOGS
-- ----------------------------


CREATE TABLE "cat_mat_arc" (
"id" varchar(30)  ,
"descript" varchar(512)  ,
"n" numeric(12,4),
"link" varchar(512)  ,
"url" varchar(512)  ,
"picture" varchar(512)  ,
CONSTRAINT cat_mat_arc_pkey PRIMARY KEY (id)
);

CREATE TABLE "cat_mat_node" (
"id" varchar(30)  ,
"descript" varchar(512)  ,
"link" varchar(512)  ,
"url" varchar(512)  ,
"picture" varchar(512)  ,
CONSTRAINT cat_mat_node_pkey PRIMARY KEY (id)
);


CREATE TABLE "cat_arc" (
"id" varchar (30) DEFAULT nextval ('"SCHEMA_NAME".cat_arc_seq'::regclass) NOT NULL,
"matcat_id" varchar (16)  ,
"shape" varchar(16)  ,
"tsect_id" varchar(16)  ,
"curve_id" varchar(16)  ,
"geom1" numeric(12,4),
"geom2" numeric(12,4) DEFAULT 0.00,
"geom3" numeric(12,4) DEFAULT 0.00,
"geom4" numeric(12,4) DEFAULT 0.00,
"geom_r" varchar(20)  ,
"short_des" varchar(16)  ,
"descript" varchar(255)  ,
"link" varchar(512)  ,
"url" varchar(512)  ,
"picture" varchar(512)  ,
"svg" varchar(50)  ,
"z1" numeric (12,2),
"z2" numeric (12,2),
"width" numeric (12,2),
"area" numeric (12,4),
"estimated_depth" numeric (12,2),
"bulk" numeric (12,2),
"cost_unit" varchar (3),
"cost" varchar (16),
"m2bottom_cost" varchar (16),
"m3protec_cost" varchar (16),
CONSTRAINT cat_arc_pkey PRIMARY KEY (id)
);


CREATE TABLE "cat_node" (
"id" varchar (30) DEFAULT nextval ('"SCHEMA_NAME".cat_node_seq'::regclass) NOT NULL,
"matcat_id" varchar (16)  ,
"geom1" numeric (12,2),
"geom2" numeric (12,2),
"geom3" numeric (12,2),
"value" numeric (12,2),
"short_des" varchar(30)  ,
"descript" varchar(255)  ,
"link" varchar(512)  ,
"url" varchar(512)  ,
"picture" varchar(512)  ,
"svg" varchar(50)  ,
"estimated_y" numeric (12,2),
"cost_unit" varchar (3),
"cost" varchar (16),
CONSTRAINT cat_node_pkey PRIMARY KEY (id)
);


CREATE TABLE "cat_mat_element" (
"id" varchar(30)  ,
"descript" varchar(512)  ,
"link" varchar(512)  ,
"url" varchar(512)  ,
"picture" varchar(512)  ,
CONSTRAINT cat_mat_element_pkey PRIMARY KEY (id)
);


CREATE TABLE "cat_element" (
"id" varchar(30)   NOT NULL,
"elementtype_id" varchar(18)  ,
"matcat_id" varchar(30)  ,
"geometry" varchar(30)  ,
"descript" varchar(512)  ,
"link" varchar(512)  ,
"url" varchar(512)  ,
"picture" varchar(512)  ,
"svg" varchar(50)  ,
CONSTRAINT cat_element_pkey PRIMARY KEY (id)
);



CREATE TABLE "cat_connec" (
"id" varchar(30)   NOT NULL,
"type" varchar(18)  ,
"matcat_id" varchar (16)  ,
"shape" varchar(16)  ,
"tsect_id" varchar(16)  ,
"curve_id" varchar(16)  ,
"geom1" numeric(12,4),
"geom2" numeric(12,4) DEFAULT 0.00,
"geom3" numeric(12,4) DEFAULT 0.00,
"geom4" numeric(12,4) DEFAULT 0.00,
"geom_r" varchar(20)  ,
"short_des" varchar(16)  ,
"descript" varchar(255)  ,
"link" varchar(512)  ,
"url" varchar(512)  ,
"picture" varchar(512)  ,
"svg" varchar(50)  ,
CONSTRAINT cat_connec_pkey PRIMARY KEY (id)
);


CREATE TABLE "cat_grate" (
"id" varchar(30)   NOT NULL,
"type" varchar(30) ,
"matcat_id" varchar (16)  ,
"length" numeric(12,4),
"width" numeric(12,4) DEFAULT 0.00,
"total_area" numeric(12,4) DEFAULT 0.00,
"efective_area" numeric(12,4) DEFAULT 0.00,
"n_barr_l" numeric(12,4) DEFAULT 0.00,
"n_barr_w" numeric(12,4) DEFAULT 0.00,
"n_barr_diag" numeric(12,4) DEFAULT 0.00,
"a_param" numeric(12,4) DEFAULT 0.00,
"b_param" numeric(12,4) DEFAULT 0.00,
"descript" varchar(255)  ,
"link" varchar(512)  ,
"url" varchar(512)  ,
"picture" varchar(512)  ,
"svg" varchar(50)  ,
CONSTRAINT cat_grate_pkey PRIMARY KEY (id)
);


CREATE TABLE "cat_soil" (
"id" varchar(30)   NOT NULL,
"descript" varchar(512)  ,
"link" varchar(512)  ,
"url" varchar(512)  ,
"picture" varchar(512)  ,
"y_param" numeric(5,2),
"b" numeric(5,2),
"trenchlining" numeric(3,2),
"m3exc_cost" varchar (16),
"m3fill_cost" varchar (16),
"m3excess_cost" varchar (16),
"m2trenchl_cost" varchar (16),
CONSTRAINT cat_soil_pkey PRIMARY KEY (id)
);


CREATE TABLE "cat_builder" (
"id" varchar(30)   NOT NULL,
"descript" varchar(512)  ,
"link" varchar(512)  ,
"url" varchar(512)  ,
"picture" varchar(512)  ,
CONSTRAINT cat_builder_pkey PRIMARY KEY (id)
);


CREATE TABLE "cat_work" (
"id" varchar(30) NOT NULL,
"descript" varchar(512),
"link" varchar(512),
"picture" varchar(512),
CONSTRAINT cat_work_pkey PRIMARY KEY (id)
);


CREATE TABLE "cat_owner" (
"id" varchar(30) NOT NULL,
"descript" varchar(512),
"link" varchar(512),
"picture" varchar(512),
CONSTRAINT cat_owner_pkey PRIMARY KEY (id)
);


CREATE TABLE "cat_pavement" (
id varchar (18),
"descript" text,
"link" varchar(512),
"picture" varchar(512),
"thickness" numeric(12,2) DEFAULT 0.00,
"m2_cost" varchar (16),
 CONSTRAINT cat_pavement_pkey PRIMARY KEY (id)
 );



-----------
-- Table: Value domain (type)
-----------

CREATE TABLE "man_type_category" (
"id" varchar(50) NOT NULL,
"observ" varchar(50),
CONSTRAINT man_type_category_pkey PRIMARY KEY (id)
);


CREATE TABLE "man_type_fluid" (
"id" varchar(50) NOT NULL,
"observ" varchar(50),
CONSTRAINT man_type_fluid_pkey PRIMARY KEY (id)
);


CREATE TABLE "man_type_location" (
"id" varchar(50) NOT NULL,
"observ" varchar(50),
CONSTRAINT man_type_location_pkey PRIMARY KEY (id)
);


CREATE TABLE "connec_type" (
"id" varchar(18) NOT NULL,
"observ" varchar(50),
CONSTRAINT connec_type_pkey PRIMARY KEY (id)
);


-- ----------------------------
-- Table: GIS features
-- ----------------------------

CREATE TABLE "sector" (
"sector_id" varchar(30) NOT NULL,
"descript" varchar(100),
"the_geom" public.geometry (MULTIPOLYGON, SRID_VALUE),
CONSTRAINT sector_pkey PRIMARY KEY (sector_id)
)
WITH (OIDS=FALSE)
;


CREATE TABLE "node" (
"node_id" varchar(16) NOT NULL,
"top_elev" numeric(12,3),
"ymax" numeric(12,3),
"sander" numeric(12,3),
"node_type" varchar(18)  ,
"nodecat_id" varchar(30)  ,
"epa_type" varchar(16)  ,
"sector_id" varchar(30)  ,
"state" character varying(16),
"annotation" character varying(254),
"observ" character varying(254),
"comment" character varying(254),
"dma_id" varchar(30)  ,
														-- to INP model
"soilcat_id" varchar(16)  ,
"category_type" varchar(50)  ,
"fluid_type" varchar(50)  ,
"location_type" varchar(50)  ,
"workcat_id" varchar(255)  ,
"buildercat_id" varchar(30)  ,
"builtdate" date,
"ownercat_id" varchar(30)  ,
"adress_01" varchar(50)  ,
"adress_02" varchar(50)  ,
"adress_03" varchar(50)  ,
"descript" varchar(254)  ,
"est_top_elev" numeric(12,3),
"est_ymax" numeric(12,3),
"rotation" numeric (6,3),
"link" character varying(512),
"verified" varchar(20) ,
"the_geom" public.geometry (POINT, SRID_VALUE),
CONSTRAINT node_pkey PRIMARY KEY (node_id)
);



CREATE TABLE "arc" (
"arc_id" varchar(16) NOT NULL,
"node_1" varchar(16)  ,
"node_2" varchar(16)  ,
"y1" numeric (12,3) ,
"y2" numeric (12,3) ,
"arc_type" varchar(18)  ,
"arccat_id" varchar(30)  ,
"epa_type" varchar(16)  ,
"sector_id" varchar(30)  ,
"state" character varying(16),
"annotation" character varying(254),
"observ" character varying(254),
"comment" character varying(254),
"inverted_slope" boolean,
"custom_length" numeric (12,2),
"dma_id" varchar(30)  ,
													-- to INP model
"soilcat_id" varchar(16)  ,
"category_type" varchar(50)  ,
"fluid_type" varchar(50)  ,
"location_type" varchar(50)  ,
"workcat_id" varchar(255)  ,
"buildercat_id" varchar(30)  ,
"builtdate" date,
"ownercat_id" varchar(30)  ,
"adress_01" varchar(50)  ,
"adress_02" varchar(50)  ,
"adress_03" varchar(50)  ,
"descript" varchar(254)  ,
"est_y1" numeric(12,3),
"est_y2" numeric(12,3),
"rotation" numeric (6,3),
"link" character varying(512),
"verified" varchar(20),
"the_geom" public.geometry (LINESTRING, SRID_VALUE),
CONSTRAINT arc_pkey PRIMARY KEY (arc_id)
);



CREATE TABLE "polygon" (
"pol_id" varchar(16)   NOT NULL,
"node_id" varchar(16)  ,
"text" varchar(254)  ,
"the_geom" public.geometry (POLYGON, SRID_VALUE),
CONSTRAINT polygon_pkey PRIMARY KEY (pol_id)
);



CREATE TABLE "dma" (
"dma_id" varchar(30)   NOT NULL,
"sector_id" varchar(30)  ,
"descript" varchar(255)  ,
"observ" character varying(512),
"the_geom" public.geometry (MULTIPOLYGON, SRID_VALUE),
CONSTRAINT dma_pkey PRIMARY KEY (dma_id)
);


CREATE TABLE "connec" (
"connec_id" varchar (30) DEFAULT nextval ('"SCHEMA_NAME".connec_seq'::regclass) NOT NULL,
"top_elev" numeric(12,4),
"ymax" numeric(12,4),
"connecat_id" varchar(30)  ,
"sector_id" varchar(30)  ,
"code" varchar(30),
"n_hydrometer" int4,
"demand" numeric(12,8),
"state" character varying(16),
"annotation" character varying(254),
"observ" character varying(254),
"comment" character varying(254),
"rotation" numeric (6,3),
"dma_id" varchar(30)  ,
"soilcat_id" varchar(16)  ,
"category_type" varchar(50)  ,
"fluid_type" varchar(50)  ,
"location_type" varchar(50)  ,
"workcat_id" varchar(255)  ,
"buildercat_id" varchar(30)  ,
"builtdate" date,
"ownercat_id" varchar(30)  ,
"adress_01" varchar(50)  ,
"adress_02" varchar(50)  ,
"adress_03" varchar(50)  ,
"streetaxis_id" varchar (16)  ,
"postnumber" varchar (16)  ,
"descript" varchar(254)  ,
"link" character varying(512),
"verified" varchar(20)  , 
"the_geom" public.geometry (POINT, SRID_VALUE),
CONSTRAINT connec_pkey PRIMARY KEY (connec_id)
);



CREATE TABLE "vnode" (
"vnode_id" varchar(16) DEFAULT nextval ('"SCHEMA_NAME".vnode_seq'::regclass) NOT NULL,
"arc_id" varchar(16),
"userdefined_pos" bool,
"vnode_type" varchar(18),
"sector_id" varchar(30),
"state" varchar(16),
"annotation" varchar(254),
"the_geom" public.geometry (POINT, SRID_VALUE),
CONSTRAINT "vnode_pkey" PRIMARY KEY ("vnode_id")
);



CREATE TABLE "link" (
link_id varchar (16) DEFAULT nextval ('"SCHEMA_NAME".link_seq'::regclass) NOT NULL,
the_geom public.geometry (LINESTRING, SRID_VALUE),
connec_id varchar(16)  ,
vnode_id varchar(16)  ,
custom_length numeric (12,3),
CONSTRAINT link_pkey PRIMARY KEY (link_id)
);


CREATE TABLE "gully" (
"gully_id" varchar(16)   NOT NULL,
"top_elev" numeric(12,4),
"ymax" numeric(12,4),
"sandbox" numeric(12,4),
"matcat_id" varchar(18)  ,
"gratecat_id" varchar(18)  ,
"units" int2,
"groove" varchar(3)  ,
"arccat_id" varchar(18)  ,
"siphon" varchar(3)  ,
"arc_id" varchar(16)  ,
"sector_id" varchar(30)  ,
"state" character varying(16),
"annotation" character varying(254),
"observ" character varying(254),
"comment" character varying(254),
"rotation" numeric (6,3),
"dma_id" varchar(30)  ,
"soilcat_id" varchar(16)  ,
"category_type" varchar(50)  ,
"fluid_type" varchar(50)  ,
"location_type" varchar(50)  ,
"workcat_id" varchar(255)  ,
"buildercat_id" varchar(30)  ,
"builtdate" date,
"ownercat_id" varchar(30)  ,
"adress_01" varchar(50)  ,
"adress_02" varchar(50)  ,
"adress_03" varchar(50)  ,
"descript" varchar(254)  ,
"link" character varying(512),
"verified" varchar(20),
"the_geom" public.geometry (POINT, SRID_VALUE),
"the_geom_pol" public.geometry (POLYGON, SRID_VALUE),
CONSTRAINT gully_pkey PRIMARY KEY (gully_id)
);



-- ----------------------------
-- Table: Add info feature 
-- ----------------------------


CREATE TABLE "man_junction" (
"node_id" varchar(16) NOT NULL,
"add_info" varchar(255),
CONSTRAINT man_junction_pkey PRIMARY KEY (node_id)
);


CREATE TABLE "man_storage" (
"node_id" varchar(16) NOT NULL,
"add_info" varchar(255),
CONSTRAINT man_storage_pkey PRIMARY KEY (node_id)
);


CREATE TABLE "man_outfall" (
"node_id" varchar(16) NOT NULL,
"add_info" varchar(255),
CONSTRAINT man_outfall_pkey PRIMARY KEY (node_id)
);


CREATE TABLE "man_virtual" (
"arc_id" varchar(16) NOT NULL,
CONSTRAINT man_virtualarc_pkey PRIMARY KEY (arc_id)
);


CREATE TABLE "man_conduit" (
"arc_id" varchar(16) NOT NULL,
"add_info" varchar(255),
CONSTRAINT man_conduit_pkey PRIMARY KEY (arc_id)
);



-- ----------------------------------
-- Table: Element
-- ----------------------------------

CREATE TABLE "element" (
"element_id" varchar(16) DEFAULT nextval ('"SCHEMA_NAME".element_seq'::regclass) NOT NULL,
"elementcat_id" varchar(30)  ,
"state" character varying(16) NOT NULL,
"annotation" character varying(254),
"observ" character varying(254),
"comment" character varying(254),
"location_type" varchar(50)  ,
"workcat_id" varchar(255)  ,
"buildercat_id" varchar(30)  ,
"builtdate" timestamp (6) without time zone,
"ownercat_id" varchar(30)  ,
"enddate" timestamp (6) without time zone,
"rotation" numeric (6,3),
"link" character varying(512),
"verified" varchar(20)   NOT NULL,
CONSTRAINT element_pkey PRIMARY KEY (element_id)
);


CREATE TABLE "element_x_node" (
"id" varchar(16) DEFAULT nextval ('"SCHEMA_NAME".element_x_node_seq'::regclass) NOT NULL,
"element_id" varchar(16)  ,
"node_id" varchar(16)  ,
CONSTRAINT element_x_node_pkey PRIMARY KEY (id)
);


CREATE TABLE "element_x_arc" (
"id" varchar(16) DEFAULT nextval ('"SCHEMA_NAME".element_x_arc_seq'::regclass) NOT NULL,
"element_id" varchar(16),
"arc_id" varchar(16),
CONSTRAINT element_x_arc_pkey PRIMARY KEY (id)
);


CREATE TABLE "element_x_connec" (
"id" varchar(16) DEFAULT nextval ('"SCHEMA_NAME".element_x_connec_seq'::regclass) NOT NULL,
"element_id" varchar(16)  ,
"connec_id" varchar(16)  ,
CONSTRAINT element_x_connec_pkey PRIMARY KEY (id)
);

CREATE TABLE "element_x_gully" (
"id" varchar(16) DEFAULT nextval ('"SCHEMA_NAME".element_x_gully_seq'::regclass) NOT NULL,
"element_id" varchar(16),
"gully_id" varchar(16),
CONSTRAINT element_x_gully_pkey PRIMARY KEY (id)
);



-- ----------------------------------
-- Table: value domain
-- ----------------------------------


CREATE TABLE "value_state" (
"id" varchar(16) NOT NULL,
"observ" varchar(254),
 CONSTRAINT value_state_pkey PRIMARY KEY (id)
);


CREATE TABLE "value_verified" (
"id" varchar(16) NOT NULL,
"observ" varchar(254),
 CONSTRAINT value_verified_pkey PRIMARY KEY (id)
);


CREATE TABLE "value_yesno" (
"id" varchar(16) NOT NULL,
"observ" varchar(254),
 CONSTRAINT value_yesno_pkey PRIMARY KEY (id)
);



----------------
-- SPATIAL INDEX
----------------

CREATE INDEX arc_index ON arc USING GIST (the_geom);
CREATE INDEX node_index ON node USING GIST (the_geom);
CREATE INDEX dma_index ON dma USING GIST (the_geom);
CREATE INDEX sector_index ON sector USING GIST (the_geom);
CREATE INDEX connec_index ON connec USING GIST (the_geom);
CREATE INDEX gully_index ON gully USING GIST (the_geom);
CREATE INDEX vnode_index ON vnode USING GIST (the_geom);
CREATE INDEX link_index ON link USING GIST (the_geom);
