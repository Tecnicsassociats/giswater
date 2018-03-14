﻿/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/
SET search_path = "SCHEMA_NAME", public, pg_catalog;


	
DROP VIEW IF EXISTS v_ui_arc_x_relations;
CREATE OR REPLACE VIEW v_ui_arc_x_relations AS 
SELECT 
row_number() OVER (ORDER BY node_id)+1000000 AS rid,
arc_id,
nodetype_id as featurecat_id,
nodecat_id as catalog,
node_id AS feature_id,
code AS feature_code,
sys_type
FROM v_edit_node where arc_id is not null
UNION  
SELECT 
row_number() OVER (ORDER BY arc_id)+2000000 AS rid,
arc_id,
connectype_id, 
connecat_id,
connec_id,
code,
sys_type
FROM v_edit_connec where arc_id is not null;


DROP VIEW IF EXISTS v_ui_scada_x_node CASCADE;
CREATE OR REPLACE VIEW v_ui_scada_x_node AS 
SELECT
ext_rtc_scada_x_value.id,
rtc_scada_node.scada_id,
rtc_scada_node.node_id,
ext_rtc_scada_x_value.value,
ext_rtc_scada_x_value.status,
ext_rtc_scada_x_value.timestamp
FROM rtc_scada_node
JOIN ext_rtc_scada_x_value ON ext_rtc_scada_x_value.scada_id = rtc_scada_node.scada_id;

	 

DROP VIEW IF EXISTS v_rtc_hydrometer CASCADE;
CREATE OR REPLACE VIEW v_rtc_hydrometer AS 
 SELECT rtc_hydrometer.hydrometer_id,
    rtc_hydrometer_x_connec.connec_id,
    connec.customer_code AS connec_customer_code,
	exploitation.name AS expl_name,
    ext_rtc_hydrometer.code AS hydrometer_customer_code,
    ext_rtc_hydrometer.hydrometer_category,
    ext_rtc_hydrometer.house_number,
    ext_rtc_hydrometer.id_number,
    ext_rtc_hydrometer.cat_hydrometer_id,
    ext_rtc_hydrometer.hydrometer_number,
    ext_rtc_hydrometer.identif,
    ext_cat_hydrometer.madeby,
    ext_cat_hydrometer.class,
    ext_cat_hydrometer.ulmc,
    ext_cat_hydrometer.voltman_flow,
    ext_cat_hydrometer.multi_jet_flow,
    ext_cat_hydrometer.dnom,
    case when (SELECT config_param_system.value FROM config_param_system 
		WHERE config_param_system.parameter::text = 'hydrometer_link_absolute_path'::text) IS NULL THEN rtc_hydrometer.link
	 else concat(( SELECT config_param_system.value FROM config_param_system
		WHERE config_param_system.parameter::text = 'hydrometer_link_absolute_path'::text), rtc_hydrometer.link) END AS hydrometer_link
   FROM rtc_hydrometer
     LEFT JOIN ext_rtc_hydrometer ON ext_rtc_hydrometer.hydrometer_id::text = rtc_hydrometer.hydrometer_id::text
     LEFT JOIN ext_cat_hydrometer ON ext_cat_hydrometer.id::text = ext_rtc_hydrometer.cat_hydrometer_id
     JOIN rtc_hydrometer_x_connec ON rtc_hydrometer_x_connec.hydrometer_id::text = rtc_hydrometer.hydrometer_id::text
     JOIN connec ON rtc_hydrometer_x_connec.connec_id::text = connec.connec_id::text
	 JOIN exploitation ON exploitation.expl_id=connec.expl_id;


	 
CREATE OR REPLACE VIEW v_rtc_hydrometer_period AS 
 SELECT ext_rtc_hydrometer.hydrometer_id,
    ext_cat_period.id AS period_id,
    connec.dma_id,
        CASE
            WHEN ext_rtc_hydrometer_x_data.custom_sum IS NOT NULL THEN ext_rtc_hydrometer_x_data.custom_sum
            ELSE ext_rtc_hydrometer_x_data.sum
        END AS m3_total_period,
        CASE
            WHEN ext_rtc_hydrometer_x_data.custom_sum IS NOT NULL THEN ext_rtc_hydrometer_x_data.custom_sum * 1000::double precision / ext_cat_period.period_seconds::double precision
            ELSE ext_rtc_hydrometer_x_data.sum * 1000::double precision / ext_cat_period.period_seconds::double precision
        END AS lps_avg
   FROM ext_rtc_hydrometer
     JOIN ext_rtc_hydrometer_x_data ON ext_rtc_hydrometer_x_data.hydrometer_id = ext_rtc_hydrometer.hydrometer_id
     JOIN ext_cat_period ON ext_rtc_hydrometer_x_data.cat_period_id = ext_cat_period.id
     JOIN rtc_hydrometer_x_connec ON rtc_hydrometer_x_connec.hydrometer_id = ext_rtc_hydrometer.hydrometer_id
     JOIN connec ON connec.connec_id = rtc_hydrometer_x_connec.connec_id
     JOIN inp_options ON inp_options.rtc_period_id = ext_cat_period.id;



DROP VIEW IF EXISTS v_rtc_dma_hydrometer_period CASCADE;
CREATE OR REPLACE VIEW v_rtc_dma_hydrometer_period AS 
 SELECT v_rtc_hydrometer_period.dma_id, 
    ext_cat_period.id AS period_id, 
    sum(v_rtc_hydrometer_period.m3_total_period) AS m3_total_period, 
    ext_cat_period.period_seconds
   FROM v_rtc_hydrometer_period
   JOIN ext_rtc_hydrometer_x_data ON ext_rtc_hydrometer_x_data.hydrometer_id = v_rtc_hydrometer_period.hydrometer_id
   JOIN inp_options ON inp_options.rtc_period_id = ext_rtc_hydrometer_x_data.cat_period_id
   JOIN ext_cat_period ON inp_options.rtc_period_id = ext_cat_period.id
  GROUP BY v_rtc_hydrometer_period.dma_id, ext_cat_period.id, ext_cat_period.period_seconds;


DROP VIEW IF EXISTS v_rtc_dma_parameter_period CASCADE;
CREATE OR REPLACE VIEW v_rtc_dma_parameter_period AS 
 SELECT v_rtc_dma_hydrometer_period.dma_id, 
    v_rtc_dma_hydrometer_period.period_id, 
    v_rtc_dma_hydrometer_period.m3_total_period AS m3_total_hydrometer,
    ext_rtc_scada_dma_period.m3_total_period AS m3_total_scada, 
    (1::double precision - v_rtc_dma_hydrometer_period.m3_total_period / ext_rtc_scada_dma_period.m3_total_period)::numeric(5,4) AS losses, 
    ext_rtc_scada_dma_period.m3_min AS m3_min_scada, 
    ext_rtc_scada_dma_period.m3_max AS m3_max_scada, 
    ext_rtc_scada_dma_period.m3_avg AS m3_avg_scada, 
    ext_rtc_scada_dma_period.m3_min / ext_rtc_scada_dma_period.m3_avg AS cmin, 
    ext_rtc_scada_dma_period.m3_max / ext_rtc_scada_dma_period.m3_avg AS cmax
   FROM v_rtc_dma_hydrometer_period
  JOIN ext_rtc_scada_dma_period ON ext_rtc_scada_dma_period.cat_period_id = v_rtc_dma_hydrometer_period.period_id;



DROP VIEW IF EXISTS v_rtc_hydrometer_x_arc CASCADE;
CREATE OR REPLACE VIEW v_rtc_hydrometer_x_arc AS 
 SELECT rtc_hydrometer_x_connec.hydrometer_id,
    rtc_hydrometer_x_connec.connec_id,
    rpt_inp_arc.arc_id,
    rpt_inp_arc.node_1,
    rpt_inp_arc.node_2
   FROM rtc_hydrometer_x_connec
     JOIN v_edit_connec ON v_edit_connec.connec_id = rtc_hydrometer_x_connec.connec_id
     RIGHT JOIN rpt_inp_arc ON rpt_inp_arc.arc_id = v_edit_connec.arc_id;


CREATE OR REPLACE VIEW v_rtc_hydrometer_x_node_period AS 
 SELECT 
    v_rtc_hydrometer_x_arc.hydrometer_id,
    v_rtc_hydrometer_x_arc.node_1 AS node_id,
    v_rtc_hydrometer_x_arc.arc_id,
    v_rtc_hydrometer_period.dma_id,
    v_rtc_hydrometer_period.period_id,
    v_rtc_hydrometer_period.lps_avg * 0.5::double precision AS lps_avg_real,
    v_rtc_dma_parameter_period.losses,
    v_rtc_hydrometer_period.lps_avg * 0.5::double precision * (1::numeric / (1::numeric - v_rtc_dma_parameter_period.losses))::double precision AS lps_avg,
    v_rtc_dma_parameter_period.cmin,
    v_rtc_hydrometer_period.lps_avg * 0.5::double precision * v_rtc_dma_parameter_period.cmin AS lps_min,
    v_rtc_dma_parameter_period.cmax,
    v_rtc_hydrometer_period.lps_avg * 0.5::double precision * v_rtc_dma_parameter_period.cmax AS lps_max
   FROM v_rtc_hydrometer_x_arc
     LEFT JOIN v_rtc_hydrometer_period ON v_rtc_hydrometer_period.hydrometer_id = v_rtc_hydrometer_x_arc.hydrometer_id
     LEFT JOIN v_rtc_dma_parameter_period ON v_rtc_hydrometer_period.period_id = v_rtc_dma_parameter_period.period_id
UNION
 SELECT 
    v_rtc_hydrometer_x_arc.hydrometer_id,
    v_rtc_hydrometer_x_arc.node_2 AS node_id,
    v_rtc_hydrometer_x_arc.arc_id,
    v_rtc_hydrometer_period.dma_id,
    v_rtc_hydrometer_period.period_id,
    v_rtc_hydrometer_period.lps_avg * 0.5::double precision AS lps_avg_real,
    v_rtc_dma_parameter_period.losses,
    v_rtc_hydrometer_period.lps_avg * 0.5::double precision * (1::numeric / (1::numeric - v_rtc_dma_parameter_period.losses))::double precision AS lps_avg,
    v_rtc_dma_parameter_period.cmin,
    v_rtc_hydrometer_period.lps_avg * 0.5::double precision * v_rtc_dma_parameter_period.cmin AS lps_min,
    v_rtc_dma_parameter_period.cmax,
    v_rtc_hydrometer_period.lps_avg * 0.5::double precision * v_rtc_dma_parameter_period.cmax AS lps_max
   FROM v_rtc_hydrometer_x_arc
     LEFT JOIN v_rtc_hydrometer_period ON v_rtc_hydrometer_period.hydrometer_id = v_rtc_hydrometer_x_arc.hydrometer_id
     LEFT JOIN v_rtc_dma_parameter_period ON v_rtc_hydrometer_period.period_id = v_rtc_dma_parameter_period.period_id;


 

DROP VIEW IF EXISTS "v_rtc_scada" CASCADE;
CREATE OR REPLACE VIEW v_rtc_scada AS 
SELECT ext_rtc_scada.scada_id,
rtc_scada_node.node_id,
ext_rtc_scada.cat_scada_id,
ext_rtc_scada.text
FROM ext_rtc_scada
JOIN rtc_scada_node ON rtc_scada_node.scada_id = ext_rtc_scada.scada_id;



DROP VIEW IF EXISTS "v_rtc_scada_data" CASCADE;
CREATE OR REPLACE VIEW v_rtc_scada_data AS SELECT
ext_rtc_scada_x_data.scada_id,
rtc_scada_node.node_id,
ext_rtc_scada_x_data.min,
ext_rtc_scada_x_data.max,
ext_rtc_scada_x_data.avg,
ext_rtc_scada_x_data.sum,
ext_rtc_scada_x_data.cat_period_id
FROM ext_rtc_scada_x_data JOIN rtc_scada_node ON rtc_scada_node.scada_id=ext_rtc_scada_x_data.scada_id;



DROP VIEW IF EXISTS "v_rtc_scada_value" CASCADE;
CREATE OR REPLACE VIEW v_rtc_scada_value AS SELECT
ext_rtc_scada_x_value.scada_id,
rtc_scada_node.node_id,
ext_rtc_scada_x_value.value,
ext_rtc_scada_x_value.status,
ext_rtc_scada_x_value."timestamp",
ext_rtc_scada_x_value.interval_seconds
FROM ext_rtc_scada_x_value JOIN rtc_scada_node ON rtc_scada_node.scada_id=ext_rtc_scada_x_value.scada_id;
