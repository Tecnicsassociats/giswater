/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/



SET search_path = "SCHEMA_NAME", public, pg_catalog;


delete from config_web_fields;
delete from config_web_forms;
delete from config_web_layer_tab;

/*
INSERT INTO config_param_system VALUES (6000, 'publish_parent_arc_layer', 'v_edit_arc', NULL, 'web', NULL);
INSERT INTO config_param_system VALUES (1117, 'publish_parent_gully_layer', 'v_edit_gully', NULL, 'web', NULL);
INSERT INTO config_param_system VALUES (1113, 'publish_parent_node_layer', 'v_edit_node', NULL, 'web', NULL);
INSERT INTO config_param_system VALUES (1116, 'publish_parent_connec_layer', 'v_edit_connec', NULL, 'web', NULL);
*/


INSERT INTO config_web_fields VALUES (51, 'review_connec', 'arc_type', NULL, 'string', 18, NULL, '', 'arc_type', 'combo', 'arc_type', 'id', 'id', NULL, true, 5);
INSERT INTO config_web_fields VALUES (81, 'F24', 'value', NULL, 'double', 12, NULL, '0.00', 'Value', 'text', NULL, NULL, NULL, NULL, true, 4);
INSERT INTO config_web_fields VALUES (85, 'F24', 'value1', NULL, 'double', NULL, NULL, '0.00', 'value1', 'text', NULL, NULL, NULL, NULL, true, 5);
INSERT INTO config_web_fields VALUES (52, 'review_connec', 'shape', NULL, 'string', 30, NULL, '', 'shape', 'combo', 'cat_arc_shape', 'id', 'id', NULL, true, 6);
INSERT INTO config_web_fields VALUES (53, 'review_connec', 'geom1', NULL, 'double', 12, 3, '0.00', 'geom1', 'text', NULL, NULL, NULL, NULL, true, 7);
INSERT INTO config_web_fields VALUES (86, 'F24', 'value2', NULL, 'double', NULL, NULL, '0.00', 'value2', 'text', NULL, NULL, NULL, NULL, true, 6);
INSERT INTO config_web_fields VALUES (98, 'v_edit_man_chamber', 'chamber_ymax', NULL, 'double', 12, 3, '0.00', 'Ymax', 'text', NULL, NULL, NULL, NULL, true, 3);
INSERT INTO config_web_fields VALUES (82, 'F24', 'geom1', NULL, 'double', NULL, NULL, '0.00', 'Geom1', 'text', NULL, NULL, NULL, NULL, true, 7);
INSERT INTO config_web_fields VALUES (54, 'review_connec', 'geom2', NULL, 'double', 12, 3, '0.00', 'geom2', 'text', NULL, NULL, NULL, NULL, true, 8);
INSERT INTO config_web_fields VALUES (55, 'review_connec', 'annotation', NULL, 'string', 500, NULL, '', 'annotation', 'textarea', NULL, NULL, NULL, NULL, true, 9);
INSERT INTO config_web_fields VALUES (83, 'F24', 'geom2', NULL, 'double', NULL, NULL, '0.00', 'Geom2', 'text', NULL, NULL, NULL, NULL, true, 8);
INSERT INTO config_web_fields VALUES (56, 'review_connec', 'observ', NULL, 'string', 500, NULL, '', 'observ', 'textarea', NULL, NULL, NULL, NULL, true, 10);
INSERT INTO config_web_fields VALUES (84, 'F24', 'geom3', NULL, 'double', NULL, NULL, '0.00', 'Geom3', 'text', NULL, NULL, NULL, NULL, true, 9);
INSERT INTO config_web_fields VALUES (1, 'review_arc', 'sys_id', NULL, 'string', 16, NULL, '', 'arc_id', 'text', NULL, NULL, NULL, NULL, false, 1);
INSERT INTO config_web_fields VALUES (57, 'review_connec', 'field_checked', NULL, 'boolean', NULL, NULL, 'FALSE', 'field_checked', 'checkbox', NULL, NULL, NULL, NULL, true, 11);
INSERT INTO config_web_fields VALUES (59, 'review_gully', 'sys_id', NULL, 'string', 16, NULL, '', 'arc_id', 'text', NULL, NULL, NULL, NULL, false, 1);
INSERT INTO config_web_fields VALUES (60, 'review_gully', 'gratecat_id', NULL, 'string', 30, NULL, '', 'gratecat_id', 'combo', 'cat_grate', 'id', 'id', NULL, true, 3);
INSERT INTO config_web_fields VALUES (62, 'review_gully', 'matcat_id', NULL, 'string', 18, NULL, '', 'matcat_id', 'combo', 'cat_mat_arc', 'id', 'id', NULL, true, 5);
INSERT INTO config_web_fields VALUES (87, 'F24', 'text', NULL, 'string', NULL, NULL, '', 'Text', 'textarea', NULL, NULL, NULL, NULL, true, 10);
INSERT INTO config_web_fields VALUES (63, 'review_gully', 'shape', NULL, 'string', 30, NULL, '', 'shape', 'combo', 'cat_arc_shape', 'id', 'id', NULL, true, 6);
INSERT INTO config_web_fields VALUES (94, 'F22', 'parameter_id', NULL, 'string', 30, NULL, 'parameter', 'Parameter_id', 'text', NULL, NULL, NULL, NULL, true, 1);
INSERT INTO config_web_fields VALUES (182, 'v_edit_man_chamber', 'node_id', NULL, 'string', 16, NULL, NULL, 'Node id', 'text', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_web_fields VALUES (100, 'v_edit_man_chamber', 'node_type', NULL, 'string', 30, NULL, NULL, 'Node type', 'combo', 'node_type', 'id', 'id', NULL, true, 5);
INSERT INTO config_web_fields VALUES (2, 'review_arc', 'y1', NULL, 'double', 12, 3, '0.00', 'y1', 'text', NULL, NULL, NULL, NULL, true, 2);
INSERT INTO config_web_fields VALUES (95, 'F23', 'parameter_id', NULL, 'string', NULL, NULL, 'parameter', 'Parameter_id', 'text', NULL, NULL, NULL, NULL, true, 1);
INSERT INTO config_web_fields VALUES (90, 'F23', 'position_id', NULL, 'string', NULL, NULL, '', 'Position id', 'combo', NULL, NULL, NULL, NULL, true, 2);
INSERT INTO config_web_fields VALUES (64, 'review_gully', 'geom1', NULL, 'double', 12, 3, '0.00', 'geom1', 'text', NULL, NULL, NULL, NULL, true, 7);
INSERT INTO config_web_fields VALUES (91, 'F23', 'position_value', NULL, 'double', NULL, NULL, '', 'Position value', 'text', NULL, NULL, NULL, NULL, true, 3);
INSERT INTO config_web_fields VALUES (3, 'review_arc', 'y2', NULL, 'double', 12, 3, '0.00', 'y2', 'text', NULL, NULL, NULL, NULL, true, 3);
INSERT INTO config_web_fields VALUES (4, 'review_arc', 'arc_type', NULL, 'string', 18, NULL, '', 'arc_type', 'combo', 'arc_type', 'id', 'id', NULL, true, 4);
INSERT INTO config_web_fields VALUES (5, 'review_arc', 'matcat_id', NULL, 'string', 30, NULL, '', 'matcat_id', 'combo', 'cat_mat_arc', 'id', 'id', NULL, true, 5);
INSERT INTO config_web_fields VALUES (6, 'review_arc', 'shape', NULL, 'string', 30, NULL, '', 'shape', 'combo', 'cat_arc_shape', 'id', 'id', NULL, true, 6);
INSERT INTO config_web_fields VALUES (7, 'review_arc', 'geom1', NULL, 'double', 12, 3, '0.00', 'geom1', 'text', NULL, NULL, NULL, NULL, true, 7);
INSERT INTO config_web_fields VALUES (11, 'review_arc', 'field_checked', NULL, 'boolean', NULL, NULL, 'FALSE', 'field_checked', 'checkbox', NULL, NULL, NULL, NULL, true, 11);
INSERT INTO config_web_fields VALUES (68, 'review_gully', 'field_checked', NULL, 'boolean', NULL, NULL, 'FALSE', 'field_checked', 'checkbox', NULL, NULL, NULL, NULL, true, 11);
INSERT INTO config_web_fields VALUES (70, 'review_gully', 'groove', NULL, 'boolean', NULL, NULL, 'FALSE', 'groove', 'checkbox', NULL, NULL, NULL, NULL, true, 13);
INSERT INTO config_web_fields VALUES (71, 'review_gully', 'siphon', NULL, 'boolean', NULL, NULL, 'FALSE', 'siphon', 'checkbox', NULL, NULL, NULL, NULL, true, 14);
INSERT INTO config_web_fields VALUES (73, 'review_gully', 'featurecat_id', NULL, 'string', 30, NULL, '', 'featurecat_id', 'combo', 'cat_feature', 'id', 'id', NULL, true, 15);
INSERT INTO config_web_fields VALUES (14, 'review_node', 'ymax', NULL, 'double', 12, 3, '0.00', 'ymax', 'text', NULL, NULL, NULL, NULL, true, 3);
INSERT INTO config_web_fields VALUES (92, 'F23', 'value', NULL, 'double', NULL, NULL, '0.00', 'value', 'text', NULL, NULL, NULL, NULL, true, 4);
INSERT INTO config_web_fields VALUES (93, 'F23', 'text', NULL, 'string', NULL, NULL, '', 'Text', 'textarea', NULL, NULL, NULL, NULL, true, 5);
INSERT INTO config_web_fields VALUES (88, 'F22', 'value', NULL, 'double', NULL, NULL, '0.00', 'value', 'text', NULL, NULL, NULL, NULL, true, 2);
INSERT INTO config_web_fields VALUES (89, 'F22', 'text', NULL, 'string', NULL, NULL, '', 'Text', 'textarea', NULL, NULL, NULL, NULL, true, 3);
INSERT INTO config_web_fields VALUES (78, 'F24', 'parameter_id', NULL, 'string', 30, NULL, 'parameter', 'Parameter_id', 'text', NULL, NULL, NULL, NULL, true, 1);
INSERT INTO config_web_fields VALUES (15, 'review_node', 'node_type', NULL, 'string', 18, NULL, '', 'node_type', 'combo', 'node_type', 'id', 'id', NULL, true, 4);
INSERT INTO config_web_fields VALUES (180, 'v_edit_man_conduit', 'conduit_builtdate', NULL, 'date', NULL, NULL, NULL, 'builtdate', 'date', NULL, NULL, NULL, NULL, true, 31);
INSERT INTO config_web_fields VALUES (16, 'review_node', 'matcat_id', NULL, 'string', 30, NULL, '', 'matcat_id', 'combo', 'cat_mat_node', 'id', 'id', NULL, true, 5);
INSERT INTO config_web_fields VALUES (17, 'review_node', 'shape', NULL, 'string', 30, NULL, '', 'shape', 'combo', 'cat_node_shape', 'id', 'id', NULL, true, 6);
INSERT INTO config_web_fields VALUES (22, 'review_node', 'field_checked', NULL, 'boolean', NULL, NULL, 'FALSE', 'field_checked', 'checkbox', NULL, NULL, NULL, NULL, true, 11);
INSERT INTO config_web_fields VALUES (47, 'review_connec', 'y1', NULL, 'double', 12, 3, '0.00', 'y1', 'text', NULL, NULL, NULL, NULL, true, 1);
INSERT INTO config_web_fields VALUES (48, 'review_connec', 'sys_id', NULL, 'string', 16, NULL, '', 'connec_id', 'text', NULL, NULL, NULL, NULL, false, 2);
INSERT INTO config_web_fields VALUES (49, 'review_connec', 'matcat_id', NULL, 'string', 30, NULL, '', 'matcat_id', 'combo', 'cat_mat_arc', 'id', 'id', NULL, true, 3);
INSERT INTO config_web_fields VALUES (50, 'review_connec', 'y2', NULL, 'double', 12, 3, '0.00', 'y2', 'text', NULL, NULL, NULL, NULL, true, 4);
INSERT INTO config_web_fields VALUES (79, 'F24', 'position_id', NULL, 'string', 30, NULL, '', 'Position id', 'combo', NULL, NULL, NULL, NULL, true, 2);
INSERT INTO config_web_fields VALUES (80, 'F24', 'position_value', NULL, 'double', 12, NULL, '0.00', 'Position value', 'text', NULL, NULL, NULL, NULL, true, 3);
INSERT INTO config_web_fields VALUES (102, 'v_edit_man_chamber', 'sector_id', NULL, 'string', NULL, NULL, NULL, 'Sector', 'combo', 'sector', 'sector_id', 'name', NULL, true, 7);
INSERT INTO config_web_fields VALUES (108, 'v_edit_man_chamber', 'dma_id', NULL, 'string', NULL, NULL, NULL, 'Dma', 'combo', 'dma', 'dma_id', 'name', NULL, true, 14);
INSERT INTO config_web_fields VALUES (107, 'v_edit_man_chamber', 'chamber_comment', NULL, 'string', 500, NULL, NULL, 'Comment', 'text', NULL, NULL, NULL, NULL, true, 13);
INSERT INTO config_web_fields VALUES (128, 'v_edit_man_chamber', 'verified', NULL, 'string', 50, NULL, NULL, 'Verified', 'combo', 'value_verified', 'id', 'id', NULL, true, 33);
INSERT INTO config_web_fields VALUES (181, 'v_edit_man_conduit', 'arc_id', NULL, 'string', 16, NULL, NULL, 'Arc id', 'text', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_web_fields VALUES (8, 'review_arc', 'geom2', NULL, 'double', 12, 3, '0.00', 'geom2', 'text', NULL, NULL, NULL, NULL, true, 8);
INSERT INTO config_web_fields VALUES (9, 'review_arc', 'annotation', NULL, 'string', 500, NULL, '', 'annotation', 'textarea', NULL, NULL, NULL, NULL, true, 9);
INSERT INTO config_web_fields VALUES (10, 'review_arc', 'observ', NULL, 'string', 500, NULL, '', 'observ', 'textarea', NULL, NULL, NULL, NULL, true, 10);
INSERT INTO config_web_fields VALUES (12, 'review_node', 'sys_id', NULL, 'string', 16, NULL, '', 'node_id', 'text', NULL, NULL, NULL, NULL, false, 1);
INSERT INTO config_web_fields VALUES (112, 'v_edit_man_chamber', 'chamber_fluid_type', NULL, 'string', 50, NULL, NULL, 'Fluid type', 'combo', 'man_type_fluid', 'fluid_type', 'fluid_type', 'SELECT * FROM man_type_fluid WHERE feature_type=''NODE'' AND (featurecat_id is null OR featurecat_id=''CHAMBER'');', true, 18);
INSERT INTO config_web_fields VALUES (13, 'review_node', 'top_elev', NULL, 'double', 12, 3, '0.00', 'top_elev', 'text', NULL, NULL, NULL, NULL, true, 2);
INSERT INTO config_web_fields VALUES (18, 'review_node', 'geom1', NULL, 'double', 12, 3, '0.00', 'geom1', 'text', NULL, NULL, NULL, NULL, true, 7);
INSERT INTO config_web_fields VALUES (19, 'review_node', 'geom2', NULL, 'double', 12, 3, '0.00', 'geom2', 'text', NULL, NULL, NULL, NULL, true, 8);
INSERT INTO config_web_fields VALUES (20, 'review_node', 'annotation', NULL, 'string', 500, NULL, '', 'annotation', 'textarea', NULL, NULL, NULL, NULL, true, 9);
INSERT INTO config_web_fields VALUES (21, 'review_node', 'observ', NULL, 'string', 500, NULL, '', 'observ', 'textarea', NULL, NULL, NULL, NULL, true, 10);
INSERT INTO config_web_fields VALUES (58, 'review_gully', 'top_elev', NULL, 'double', 12, 3, '0.00', 'top_elev', 'text', NULL, NULL, NULL, NULL, true, 2);
INSERT INTO config_web_fields VALUES (61, 'review_gully', 'ymax', NULL, 'double', 12, 3, '0.00', 'ymax', 'text', NULL, NULL, NULL, NULL, true, 4);
INSERT INTO config_web_fields VALUES (65, 'review_gully', 'geom2', NULL, 'double', 12, 3, '0.00', 'geom2', 'text', NULL, NULL, NULL, NULL, true, 8);
INSERT INTO config_web_fields VALUES (66, 'review_gully', 'annotation', NULL, 'string', 500, NULL, '', 'annotation', 'textarea', NULL, NULL, NULL, NULL, true, 9);
INSERT INTO config_web_fields VALUES (67, 'review_gully', 'observ', NULL, 'string', 500, NULL, '', 'observ', 'textarea', NULL, NULL, NULL, NULL, true, 10);
INSERT INTO config_web_fields VALUES (69, 'review_gully', 'sandbox', NULL, 'double', 12, 3, '0.00', 'sandbox', 'text', NULL, NULL, NULL, NULL, true, 12);
INSERT INTO config_web_fields VALUES (74, 'review_gully', 'feature_id', NULL, 'string', 16, NULL, '', 'feature_id', 'text', NULL, NULL, NULL, NULL, true, 16);
INSERT INTO config_web_fields VALUES (136, 'v_edit_man_chamber', 'chamber_bottom_channel', NULL, 'boolean', NULL, NULL, NULL, 'Bottom channel', 'checkbox', NULL, NULL, NULL, NULL, true, 40);
INSERT INTO config_web_fields VALUES (119, 'v_edit_man_chamber', 'chamber_muni_id', NULL, 'string', NULL, NULL, NULL, 'Municipality', 'combo', 'ext_municipality', 'muni_id', 'name', NULL, true, 25);
INSERT INTO config_web_fields VALUES (113, 'v_edit_man_chamber', 'chamber_location_type', NULL, 'string', 50, NULL, NULL, 'Location type', 'combo', 'man_type_location', 'location_type', 'location_type', 'SELECT * FROM man_type_location WHERE feature_type=''NODE'' AND (featurecat_id is null OR featurecat_id=''CHAMBER'');', true, 19);
INSERT INTO config_web_fields VALUES (114, 'v_edit_man_chamber', 'chamber_workcat_id', NULL, 'string', 30, NULL, NULL, 'Work', 'combo', 'cat_work', 'id', 'id', NULL, true, 20);
INSERT INTO config_web_fields VALUES (115, 'v_edit_man_chamber', 'chamber_workcat_id_end', NULL, 'string', 30, NULL, NULL, 'Work end', 'combo', 'cat_work', 'id', 'id', NULL, true, 21);
INSERT INTO config_web_fields VALUES (117, 'v_edit_man_chamber', 'chamber_builtdate', NULL, 'date', NULL, NULL, NULL, 'Built date', 'date', NULL, NULL, NULL, NULL, true, 23);
INSERT INTO config_web_fields VALUES (118, 'v_edit_man_chamber', 'chamber_enddate', NULL, 'date', NULL, NULL, NULL, 'End date', 'date', NULL, NULL, NULL, NULL, true, 24);
INSERT INTO config_web_fields VALUES (131, 'v_edit_man_chamber', 'chamber_width', NULL, 'double', NULL, NULL, '0.00', 'Width', 'text', NULL, NULL, NULL, NULL, true, 35);
INSERT INTO config_web_fields VALUES (135, 'v_edit_man_chamber', 'chamber_inlet', NULL, 'boolean', NULL, NULL, NULL, 'Inlet', 'checkbox', NULL, NULL, NULL, NULL, true, 39);
INSERT INTO config_web_fields VALUES (137, 'v_edit_man_chamber', 'chamber_accessibility', NULL, 'string', 16, NULL, NULL, 'Accessibility', 'text', NULL, NULL, NULL, NULL, true, 41);
INSERT INTO config_web_fields VALUES (138, 'v_edit_man_chamber', 'chamber_name', NULL, 'string', 255, NULL, NULL, 'Name', 'text', NULL, NULL, NULL, NULL, true, 42);
INSERT INTO config_web_fields VALUES (139, 'v_edit_man_conduit', 'conduit_code', NULL, 'string', 15, NULL, NULL, 'Code', 'text', NULL, NULL, NULL, NULL, true, 1);
INSERT INTO config_web_fields VALUES (140, 'v_edit_man_conduit', 'conduit_y1', NULL, 'double', NULL, NULL, '0.00', 'conduit_y1', 'text', NULL, NULL, NULL, NULL, true, 2);
INSERT INTO config_web_fields VALUES (141, 'v_edit_man_conduit', 'conduit_y2', NULL, 'double', NULL, NULL, '0.00', 'conduit_y2', 'text', NULL, NULL, NULL, NULL, true, 3);
INSERT INTO config_web_fields VALUES (142, 'v_edit_man_conduit', 'conduit_custom_y1', NULL, 'double', NULL, NULL, '0.00', 'conduit_custom_y1', 'text', NULL, NULL, NULL, NULL, true, 4);
INSERT INTO config_web_fields VALUES (103, 'v_edit_man_chamber', 'state', NULL, 'string', NULL, NULL, NULL, 'State', 'combo', 'value_state', 'id', 'name', NULL, true, 8);
INSERT INTO config_web_fields VALUES (177, 'v_edit_man_conduit', 'expl_id', NULL, 'string', NULL, NULL, NULL, 'exploitation', 'combo', 'exploitation', 'expl_id', 'name', NULL, true, 16);
INSERT INTO config_web_fields VALUES (160, 'v_edit_man_conduit', 'conduit_soilcat_id', NULL, 'string', 30, NULL, NULL, 'soilcat', 'text', 'cat_soil', 'id', 'id', NULL, true, 23);
INSERT INTO config_web_fields VALUES (161, 'v_edit_man_conduit', 'conduit_function_type', NULL, 'string', 50, NULL, NULL, 'function type', 'text', 'man_type_function', 'function_type', 'function_type', 'SELECT * FROM man_type_function WHERE feature_type=''ARC'' AND (featurecat_id is null OR featurecat_id=''CONDUIT'');', true, 24);
INSERT INTO config_web_fields VALUES (174, 'v_edit_man_conduit', 'conduit_address_03', NULL, 'string', 250, NULL, NULL, 'address 3', 'text', NULL, NULL, NULL, NULL, true, 38);
INSERT INTO config_web_fields VALUES (175, 'v_edit_man_conduit', 'conduit_descript', NULL, 'string', 250, NULL, NULL, 'descript', 'text', NULL, NULL, NULL, NULL, true, 39);
INSERT INTO config_web_fields VALUES (104, 'v_edit_man_chamber', 'state_type', NULL, 'string', NULL, NULL, NULL, 'State type', 'combo', 'value_state_type', 'id', 'name', NULL, true, 9);
INSERT INTO config_web_fields VALUES (178, 'v_edit_man_conduit', 'conduit_num_value', NULL, 'double', NULL, NULL, '0.00', 'num value', 'text', NULL, NULL, NULL, NULL, true, 41);
INSERT INTO config_web_fields VALUES (159, 'v_edit_man_conduit', 'dma_id', NULL, 'string', NULL, NULL, NULL, 'dma', 'text', 'dma', 'dma_id', 'name', NULL, true, 22);
INSERT INTO config_web_fields VALUES (96, 'v_edit_man_chamber', 'chamber_code', NULL, 'string', 30, NULL, NULL, 'Code', 'text', NULL, NULL, NULL, NULL, true, 1);
INSERT INTO config_web_fields VALUES (97, 'v_edit_man_chamber', 'chamber_top_elev', NULL, 'double', 12, 3, '0.00', 'Top elev', 'text', NULL, NULL, NULL, NULL, true, 2);
INSERT INTO config_web_fields VALUES (99, 'v_edit_man_chamber', 'chamber_elev', NULL, 'double', 12, 3, '0.00', 'Elev', 'text', NULL, NULL, NULL, NULL, true, 4);
INSERT INTO config_web_fields VALUES (121, 'v_edit_man_chamber', 'chamber_streetaxis_id', NULL, 'string', 16, NULL, NULL, 'Street', 'combo', 'ext_streetaxis', 'id', 'name', NULL, true, 27);
INSERT INTO config_web_fields VALUES (179, 'v_edit_man_chamber', 'expl_id', NULL, 'string', NULL, NULL, NULL, 'exploitation', 'combo', 'exploitation', 'expl_id', 'name', NULL, true, 10);
INSERT INTO config_web_fields VALUES (101, 'v_edit_man_chamber', 'nodecat_id', NULL, 'string', 30, NULL, NULL, 'Nodecat', 'combo', 'cat_node', 'id', 'id', NULL, true, 6);
INSERT INTO config_web_fields VALUES (105, 'v_edit_man_chamber', 'chamber_annotation', NULL, 'string', 500, NULL, NULL, 'Annotation', 'text', NULL, NULL, NULL, NULL, true, 11);
INSERT INTO config_web_fields VALUES (106, 'v_edit_man_chamber', 'chamber_observ', NULL, 'string', 500, NULL, NULL, 'Observ', 'text', NULL, NULL, NULL, NULL, true, 12);
INSERT INTO config_web_fields VALUES (109, 'v_edit_man_chamber', 'chamber_soilcat_id', NULL, 'string', 30, NULL, NULL, 'Soilcat', 'combo', 'cat_soil', 'id', 'id', NULL, true, 15);
INSERT INTO config_web_fields VALUES (110, 'v_edit_man_chamber', 'chamber_function_type', NULL, 'string', 50, NULL, NULL, 'Function type', 'combo', 'man_type_function', 'function_type', 'function_type', 'SELECT * FROM man_type_function WHERE feature_type=''NODE'' AND (featurecat_id is null OR featurecat_id=''CHAMBER'');', true, 16);
INSERT INTO config_web_fields VALUES (111, 'v_edit_man_chamber', 'chamber_category_type', NULL, 'string', 50, NULL, NULL, 'Category type', 'combo', 'man_type_category', 'category_type', 'category_type', 'SELECT * FROM man_type_category WHERE feature_type=''NODE'' AND (featurecat_id is null OR featurecat_id=''CHAMBER'');', true, 17);
INSERT INTO config_web_fields VALUES (116, 'v_edit_man_chamber', 'chamber_buildercat_id', NULL, 'string', 30, NULL, NULL, 'Builder', 'combo', 'cat_builder', 'id', 'id', NULL, true, 22);
INSERT INTO config_web_fields VALUES (120, 'v_edit_man_chamber', 'chamber_ownercat_id', NULL, 'string', 150, NULL, NULL, 'Owner', 'combo', 'cat_owner', 'id', 'id', NULL, true, 26);
INSERT INTO config_web_fields VALUES (122, 'v_edit_man_chamber', 'epa_type', NULL, 'string', 30, NULL, NULL, 'Epa type', 'combo', 'inp_node_type', 'id', 'id', NULL, true, 28);
INSERT INTO config_web_fields VALUES (123, 'v_edit_man_chamber', 'chamber_address_01', NULL, 'string', 150, NULL, NULL, 'Address 1', 'text', NULL, NULL, NULL, NULL, true, 29);
INSERT INTO config_web_fields VALUES (124, 'v_edit_man_chamber', 'chamber_address_02', NULL, 'string', 150, NULL, NULL, 'Address 2', 'text', NULL, NULL, NULL, NULL, true, 30);
INSERT INTO config_web_fields VALUES (126, 'v_edit_man_chamber', 'chamber_descript', NULL, 'string', 256, NULL, NULL, 'Descript', 'text', NULL, NULL, NULL, NULL, true, 32);
INSERT INTO config_web_fields VALUES (125, 'v_edit_man_chamber', 'chamber_address_03', NULL, 'string', 150, NULL, NULL, 'Address 3', 'text', NULL, NULL, NULL, NULL, true, 31);
INSERT INTO config_web_fields VALUES (130, 'v_edit_man_chamber', 'chamber_length', NULL, 'double', NULL, NULL, '0.00', 'Length', 'text', NULL, NULL, NULL, NULL, true, 34);
INSERT INTO config_web_fields VALUES (132, 'v_edit_man_chamber', 'chamber_sander_depth', NULL, 'double', NULL, NULL, '0.00', 'Sander depth', 'text', NULL, NULL, NULL, NULL, true, 36);
INSERT INTO config_web_fields VALUES (133, 'v_edit_man_chamber', 'chamber_max_volume', NULL, 'double', NULL, NULL, '0.00', 'Max volume', 'text', NULL, NULL, NULL, NULL, true, 37);
INSERT INTO config_web_fields VALUES (134, 'v_edit_man_chamber', 'chamber_util_volume', NULL, 'double', NULL, NULL, '0.00', 'Util volume', 'text', NULL, NULL, NULL, NULL, true, 38);
INSERT INTO config_web_fields VALUES (143, 'v_edit_man_conduit', 'conduit_custom_y2', NULL, 'double', NULL, NULL, '0.00', 'conduit_custom_y2', 'text', NULL, NULL, NULL, NULL, true, 5);
INSERT INTO config_web_fields VALUES (144, 'v_edit_man_conduit', 'conduit_elev1', NULL, 'double', NULL, NULL, '0.00', 'conduit_elev1', 'text', NULL, NULL, NULL, NULL, true, 6);
INSERT INTO config_web_fields VALUES (145, 'v_edit_man_conduit', 'conduit_elev2', NULL, 'double', NULL, NULL, '0.00', 'conduit_elev2', 'text', NULL, NULL, NULL, NULL, true, 7);
INSERT INTO config_web_fields VALUES (146, 'v_edit_man_conduit', 'conduit_custom_elev1', NULL, 'double', NULL, NULL, '0.00', 'conduit_custom_elev1', 'text', NULL, NULL, NULL, NULL, true, 8);
INSERT INTO config_web_fields VALUES (147, 'v_edit_man_conduit', 'conduit_custom_elev2', NULL, 'double', NULL, NULL, '0.00', 'conduit_custom_elev2', 'text', NULL, NULL, NULL, NULL, true, 9);
INSERT INTO config_web_fields VALUES (148, 'v_edit_man_conduit', 'arc_type', NULL, 'string', 30, NULL, NULL, 'Arc type', 'combo', 'arc_type', 'id', 'id', NULL, true, 10);
INSERT INTO config_web_fields VALUES (149, 'v_edit_man_conduit', 'arccat_id', NULL, 'string', 30, NULL, NULL, 'Arccat id', 'combo', 'cat_arc', 'id', 'id', NULL, true, 11);
INSERT INTO config_web_fields VALUES (150, 'v_edit_man_conduit', 'epa_type', NULL, 'string', 30, NULL, NULL, 'Epa type', 'combo', 'inp_arc_type', 'id', 'id', NULL, true, 12);
INSERT INTO config_web_fields VALUES (163, 'v_edit_man_conduit', 'conduit_fluid_type', NULL, 'string', 50, NULL, NULL, 'fluid type', 'text', 'man_type_fluid', 'fluid_type', 'fluid_type', 'SELECT * FROM man_type_fluid WHERE feature_type=''ARC'' AND (featurecat_id is null OR featurecat_id=''CONDUIT'');', true, 26);
INSERT INTO config_web_fields VALUES (154, 'v_edit_man_conduit', 'conduit_annotation', NULL, 'string', 256, NULL, NULL, 'annotation', 'text', NULL, NULL, NULL, NULL, true, 17);
INSERT INTO config_web_fields VALUES (155, 'v_edit_man_conduit', 'conduit_observ', NULL, 'string', 256, NULL, NULL, 'observ', 'text', NULL, NULL, NULL, NULL, true, 18);
INSERT INTO config_web_fields VALUES (156, 'v_edit_man_conduit', 'conduit_comment', NULL, 'string', 256, NULL, NULL, 'comment', 'text', NULL, NULL, NULL, NULL, true, 19);
INSERT INTO config_web_fields VALUES (157, 'v_edit_man_conduit', 'conduit_inverted_slope', NULL, 'boolean', NULL, NULL, NULL, 'inverted slope', 'checkbox', NULL, NULL, NULL, NULL, true, 20);
INSERT INTO config_web_fields VALUES (158, 'v_edit_man_conduit', 'conduit_custom_length', NULL, 'double', NULL, NULL, '0.00', 'conduit_custom_length', 'text', NULL, NULL, NULL, NULL, true, 21);
INSERT INTO config_web_fields VALUES (164, 'v_edit_man_conduit', 'conduit_location_type', NULL, 'string', 50, NULL, NULL, 'location type', 'text', 'man_type_location', 'location_type', 'location_type', 'SELECT * FROM man_type_location WHERE feature_type=''ARC'' AND (featurecat_id is null OR featurecat_id=''CONDUIT'');', true, 27);
INSERT INTO config_web_fields VALUES (162, 'v_edit_man_conduit', 'conduit_category_type', NULL, 'string', 50, NULL, NULL, 'category type', 'text', 'man_type_category', 'category_type', 'category_type', 'SELECT * FROM man_type_category WHERE feature_type=''ARC'' AND (featurecat_id is null OR featurecat_id=''CONDUIT'');', true, 25);
INSERT INTO config_web_fields VALUES (165, 'v_edit_man_conduit', 'conduit_workcat_id', NULL, 'string', 150, NULL, NULL, 'workcat', 'combo', 'cat_work', 'id', 'id', NULL, true, 28);
INSERT INTO config_web_fields VALUES (166, 'v_edit_man_conduit', 'conduit_workcat_id_end', NULL, 'string', 150, NULL, NULL, 'workcat end', 'combo', 'cat_work', 'id', 'id', NULL, true, 29);
INSERT INTO config_web_fields VALUES (167, 'v_edit_man_conduit', 'conduit_buildercat_id', NULL, 'string', 150, NULL, NULL, 'builder', 'combo', 'cat_builder', 'id', 'id', NULL, true, 30);
INSERT INTO config_web_fields VALUES (168, 'v_edit_man_conduit', 'conduit_enddate', NULL, 'date', NULL, NULL, NULL, 'enddate', 'date', NULL, NULL, NULL, NULL, true, 32);
INSERT INTO config_web_fields VALUES (169, 'v_edit_man_conduit', 'conduit_ownercat_id', NULL, 'string', 30, NULL, NULL, 'owner', 'combo', 'cat_owner', 'id', 'id', NULL, true, 33);
INSERT INTO config_web_fields VALUES (172, 'v_edit_man_conduit', 'conduit_address_01', NULL, 'string', 250, NULL, NULL, 'address 1', 'text', NULL, NULL, NULL, NULL, true, 36);
INSERT INTO config_web_fields VALUES (173, 'v_edit_man_conduit', 'conduit_address_02', NULL, 'string', 250, NULL, NULL, 'address 2', 'text', NULL, NULL, NULL, NULL, true, 37);
INSERT INTO config_web_fields VALUES (176, 'v_edit_man_conduit', 'verified', NULL, 'string', 30, NULL, NULL, 'verified', 'combo', 'value_verified', 'id', 'id', NULL, true, 40);
INSERT INTO config_web_fields VALUES (171, 'v_edit_man_conduit', 'conduit_streetaxis_id', NULL, 'string', 16, NULL, NULL, 'streetaxis', 'combo', 'ext_streetaxis', 'id', 'name', NULL, true, 35);
INSERT INTO config_web_fields VALUES (152, 'v_edit_man_conduit', 'state', NULL, 'string', NULL, NULL, NULL, 'state', 'combo', 'value_state', 'id', 'name', NULL, true, 14);
INSERT INTO config_web_fields VALUES (153, 'v_edit_man_conduit', 'state_type', NULL, 'string', NULL, NULL, NULL, 'state type', 'combo', 'value_state_type', 'id', 'name', NULL, true, 15);
INSERT INTO config_web_fields VALUES (151, 'v_edit_man_conduit', 'sector_id', NULL, 'string', NULL, NULL, NULL, 'Sector', 'combo', 'sector', 'sector_id', 'name', NULL, true, 13);
INSERT INTO config_web_fields VALUES (170, 'v_edit_man_conduit', 'conduit_muni_id', NULL, 'string', NULL, NULL, NULL, 'municipality', 'combo', 'ext_municipality', 'muni_id', 'name', NULL, true, 34);





INSERT INTO config_web_forms VALUES (30, 'v_ui_doc_x_arc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_arc', 3);
INSERT INTO config_web_forms VALUES (318, 'v_ui_om_visitman_x_node', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_node', 3);
INSERT INTO config_web_forms VALUES (45, 'v_ui_node_x_connection_downstream', 'SELECT feature_id as sys_id, featurecat_id, x as sys_x, y as sys_y FROM v_ui_node_x_connection_downstream', 2);
INSERT INTO config_web_forms VALUES (37, 'v_ui_arc_x_connection', 'SELECT feature_id as sys_id, feature_type, x as sys_x, y as sys_y FROM v_ui_arc_x_connection', 1);
INSERT INTO config_web_forms VALUES (28, 'v_ui_doc_x_arc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_arc', 1);
INSERT INTO config_web_forms VALUES (46, 'v_ui_node_x_connection_downstream', 'SELECT feature_id as sys_id, featurecat_id, x as sys_x, y as sys_y FROM v_ui_node_x_connection_downstream', 3);
INSERT INTO config_web_forms VALUES (47, 'v_ui_node_x_connection_upstream', 'SELECT feature_id as sys_id, featurecat_id, x as sys_x, y as sys_y FROM v_ui_node_x_connection_upstream', 1);
INSERT INTO config_web_forms VALUES (32, 'v_ui_doc_x_connec', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_connec', 2);
INSERT INTO config_web_forms VALUES (3, 'v_ui_element_x_node', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_node', 3);
INSERT INTO config_web_forms VALUES (12, 'v_ui_element_x_gully', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_gully', 3);
INSERT INTO config_web_forms VALUES (7, 'v_ui_element_x_connec', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_connec', 1);
INSERT INTO config_web_forms VALUES (26, 'v_ui_doc_x_node', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_node', 2);
INSERT INTO config_web_forms VALUES (48, 'v_ui_node_x_connection_upstream', 'SELECT feature_id as sys_id, featurecat_id, x as sys_x, y as sys_y FROM v_ui_node_x_connection_upstream', 2);
INSERT INTO config_web_forms VALUES (40, 'v_ui_element', 'SELECT element_id, elementcat_id, num_elements, comment, state, observ, function_type, category_type, location_type, fluid_type, ownercat_id, workcat_id, builtdate, enddate, workcat_id_end, link FROM v_ui_element', 1);
INSERT INTO config_web_forms VALUES (10, 'v_ui_element_x_gully', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_gully', 1);
INSERT INTO config_web_forms VALUES (49, 'v_ui_node_x_connection_upstream', 'SELECT feature_id as sys_id, featurecat_id, x as sys_x, y as sys_y FROM v_ui_node_x_connection_upstream', 3);
INSERT INTO config_web_forms VALUES (20, 'v_ui_om_visit_x_connec', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_connec', 2);
INSERT INTO config_web_forms VALUES (11, 'v_ui_element_x_gully', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_gully', 2);
INSERT INTO config_web_forms VALUES (6, 'v_ui_element_x_arc', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_arc', 3);
INSERT INTO config_web_forms VALUES (21, 'v_ui_om_visit_x_connec', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_connec', 3);
INSERT INTO config_web_forms VALUES (34, 'v_ui_doc_x_gully', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_gully', 1);
INSERT INTO config_web_forms VALUES (22, 'v_ui_om_visit_x_gully', 'SELECT visit_id event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_gully', 1);
INSERT INTO config_web_forms VALUES (23, 'v_ui_om_visit_x_gully', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_gully', 2);
INSERT INTO config_web_forms VALUES (39, 'v_ui_arc_x_connection', 'SELECT feature_id as sys_id, feature_type, x as sys_x, y as sys_y FROM v_ui_arc_x_connection', 3);
INSERT INTO config_web_forms VALUES (24, 'v_ui_om_visit_x_gully', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_gully', 3);
INSERT INTO config_web_forms VALUES (324, 'v_ui_om_visitman_x_connec', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_connec', 3);
INSERT INTO config_web_forms VALUES (35, 'v_ui_doc_x_gully', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_gully', 2);
INSERT INTO config_web_forms VALUES (31, 'v_ui_doc_x_connec', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_connec', 1);
INSERT INTO config_web_forms VALUES (13, 'v_ui_om_visit_x_node', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_node', 1);
INSERT INTO config_web_forms VALUES (29, 'v_ui_doc_x_arc', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_arc', 2);
INSERT INTO config_web_forms VALUES (321, 'v_ui_om_visitman_x_arc', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_arc', 3);
INSERT INTO config_web_forms VALUES (27, 'v_ui_doc_x_node', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_node', 3);
INSERT INTO config_web_forms VALUES (322, 'v_ui_om_visitman_x_connec', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_connec', 1);
INSERT INTO config_web_forms VALUES (2, 'v_ui_element_x_node', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_node', 2);
INSERT INTO config_web_forms VALUES (9, 'v_ui_element_x_connec', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_connec', 3);
INSERT INTO config_web_forms VALUES (4, 'v_ui_element_x_arc', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_arc', 1);
INSERT INTO config_web_forms VALUES (323, 'v_ui_om_visitman_x_connec', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_connec', 2);
INSERT INTO config_web_forms VALUES (44, 'v_ui_node_x_connection_downstream', 'SELECT feature_id as sys_id, featurecat_id, x as sys_x, y as sys_y FROM v_ui_node_x_connection_downstream', 1);
INSERT INTO config_web_forms VALUES (5, 'v_ui_element_x_arc', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_arc', 2);
INSERT INTO config_web_forms VALUES (38, 'v_ui_arc_x_connection', 'SELECT feature_id as sys_id, feature_type, x as sys_x, y as sys_y FROM v_ui_arc_x_connection', 2);
INSERT INTO config_web_forms VALUES (25, 'v_ui_doc_x_node', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_node', 1);
INSERT INTO config_web_forms VALUES (33, 'v_ui_doc_x_connec', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_connec', 3);
INSERT INTO config_web_forms VALUES (36, 'v_ui_doc_x_gully', 'SELECT doc_id as sys_id, doc_id, path as sys_link FROM v_ui_doc_x_gully', 3);
INSERT INTO config_web_forms VALUES (1, 'v_ui_element_x_node', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_node', 1);
INSERT INTO config_web_forms VALUES (8, 'v_ui_element_x_connec', 'SELECT element_id as sys_id, elementcat_id FROM v_ui_element_x_connec', 2);
INSERT INTO config_web_forms VALUES (14, 'v_ui_om_visit_x_node', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_node', 2);
INSERT INTO config_web_forms VALUES (16, 'v_ui_om_visit_x_arc', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_arc', 1);
INSERT INTO config_web_forms VALUES (17, 'v_ui_om_visit_x_arc', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_arc', 2);
INSERT INTO config_web_forms VALUES (18, 'v_ui_om_visit_x_arc', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_arc', 3);
INSERT INTO config_web_forms VALUES (19, 'v_ui_om_visit_x_connec', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_connec', 1);
INSERT INTO config_web_forms VALUES (316, 'v_ui_om_visitman_x_node', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_node', 1);
INSERT INTO config_web_forms VALUES (317, 'v_ui_om_visitman_x_node', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_node', 2);
INSERT INTO config_web_forms VALUES (319, 'v_ui_om_visitman_x_arc', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_arc', 1);
INSERT INTO config_web_forms VALUES (320, 'v_ui_om_visitman_x_arc', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_arc', 2);
INSERT INTO config_web_forms VALUES (325, 'v_ui_om_visitman_x_gully', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_gully', 1);
INSERT INTO config_web_forms VALUES (326, 'v_ui_om_visitman_x_gully', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_gully', 2);
INSERT INTO config_web_forms VALUES (327, 'v_ui_om_visitman_x_gully', 'SELECT visit_id AS sys_id, visitcat_name, visit_start, visit_end, user_name FROM v_ui_om_visitman_x_gully', 3);
INSERT INTO config_web_forms VALUES (50, 'review_arc', NULL, NULL);
INSERT INTO config_web_forms VALUES (51, 'review_arc', 'SELECT arc_id AS sys_id, y1, y2, arc_type, matcat_id, shape, geom1, geom2, annotation, observ, field_checked FROM review_arc', NULL);
INSERT INTO config_web_forms VALUES (42, 'v_ui_element', 'SELECT element_id, elementcat_id, num_elements, comment, state, observ, function_type, category_type, location_type, fluid_type, ownercat_id, workcat_id, builtdate, enddate, workcat_id_end, link    FROM v_ui_element', 2);
INSERT INTO config_web_forms VALUES (43, 'v_ui_element', 'SELECT element_id, elementcat_id, num_elements, comment, state, observ, function_type, category_type, location_type, fluid_type, ownercat_id, workcat_id, builtdate, enddate, workcat_id_end, link    FROM v_ui_element', 3);
INSERT INTO config_web_forms VALUES (15, 'v_ui_om_visit_x_node', 'SELECT visit_id, event_id AS sys_id, parameter_id, parameter_type, value as valor FROM v_ui_om_visit_x_node', 3);






INSERT INTO config_web_layer_tab VALUES (104, 'v_edit_node', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (105, 'v_edit_node', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (106, 'v_edit_node', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (107, 'v_edit_node', 'tabDoc', 'INFO_UD_NODE', 'F11');

INSERT INTO config_web_layer_tab VALUES (116, 'v_edit_man_valve', 'tabElement', 'INFO_WS_NODE', 'F12');
INSERT INTO config_web_layer_tab VALUES (117, 'v_edit_man_valve', 'tabConnect', 'INFO_WS_NODE', 'F12');
INSERT INTO config_web_layer_tab VALUES (118, 'v_edit_man_valve', 'tabVisit', 'INFO_WS_NODE', 'F12');
INSERT INTO config_web_layer_tab VALUES (119, 'v_edit_man_valve', 'tabDoc', 'INFO_WS_NODE', 'F12');

INSERT INTO config_web_layer_tab VALUES (100, 'v_edit_arc', 'tabElement', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (101, 'v_edit_arc', 'tabConnect', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (102, 'v_edit_arc', 'tabVisit', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (103, 'v_edit_arc', 'tabDoc', 'INFO_UTILS_ARC', 'F13');

INSERT INTO config_web_layer_tab VALUES (108, 'v_edit_connec', 'tabElement', 'INFO_UTILS_CONNEC', 'F14');
INSERT INTO config_web_layer_tab VALUES (109, 'v_edit_connec', 'tabHydro', 'INFO_UTILS_CONNEC', 'F14');
INSERT INTO config_web_layer_tab VALUES (110, 'v_edit_connec', 'tabMincut', 'INFO_UTILS_CONNEC', 'F14');
INSERT INTO config_web_layer_tab VALUES (111, 'v_edit_connec', 'tabVisit', 'INFO_UTILS_CONNEC', 'F14');
INSERT INTO config_web_layer_tab VALUES (112, 'v_edit_connec', 'tabDoc', 'INFO_UTILS_CONNEC', 'F14');

INSERT INTO config_web_layer_tab VALUES (113, 'v_edit_gully', 'tabElement', 'INFO_UD_GULLY', 'F15');
INSERT INTO config_web_layer_tab VALUES (114, 'v_edit_gully', 'tabVisit', 'INFO_UD_GULLY', 'F15');
INSERT INTO config_web_layer_tab VALUES (115, 'v_edit_gully', 'tabDoc', 'INFO_UD_GULLY', 'F15');






/*
INSERT INTO config_web_layer_tab VALUES (56, 'v_edit_man_varc', 'tabDoc', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (32, 'v_edit_man_netgully', 'tabDoc', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (36, 'v_edit_man_netinit', 'tabDoc', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (8, 'v_edit_man_chamber', 'tabDoc', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (57, 'v_edit_man_varc', 'tabElement', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (33, 'v_edit_man_netgully', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (55, 'v_edit_man_varc', 'tabConnect', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (58, 'v_edit_man_varc', 'tabVisit', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (9, 'v_edit_man_chamber', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (7, 'v_edit_man_chamber', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (10, 'v_edit_man_chamber', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (61, 'v_edit_man_waccel', 'tabElement', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (25, 'v_edit_man_junction', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (69, 'v_edit_man_wwtp', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (73, 'review_arc', 'tabElement', 'REVIEW_UD_ARC', 'F51');
INSERT INTO config_web_layer_tab VALUES (67, 'v_edit_man_wwtp', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (59, 'v_edit_man_waccel', 'tabConnect', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (62, 'v_edit_man_waccel', 'tabVisit', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (23, 'v_edit_man_junction', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (26, 'v_edit_man_junction', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (29, 'v_edit_man_manhole', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (17, 'v_edit_man_connec', 'tabElement', 'INFO_UTILS_CONNEC', 'F14');
INSERT INTO config_web_layer_tab VALUES (70, 'v_edit_man_wwtp', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (31, 'v_edit_man_netgully', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (34, 'v_edit_man_netgully', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (71, 'review_arc', 'tabConnect', 'REVIEW_UD_ARC', 'F51');
INSERT INTO config_web_layer_tab VALUES (74, 'review_arc', 'tabVisit', 'REVIEW_UD_ARC', 'F51');
INSERT INTO config_web_layer_tab VALUES (37, 'v_edit_man_netinit', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (77, 'review_node', 'tabElement', 'REVIEW_UD_NODE', 'F52');
INSERT INTO config_web_layer_tab VALUES (81, 'review_connec', 'tabElement', 'REVIEW_UD_CONNEC', 'F53');
INSERT INTO config_web_layer_tab VALUES (82, 'review_connec', 'tabVisit', 'REVIEW_UD_CONNEC', 'F53');
INSERT INTO config_web_layer_tab VALUES (84, 'review_gully', 'tabElement', 'REVIEW_UD_GULLY', 'F54');
INSERT INTO config_web_layer_tab VALUES (13, 'v_edit_man_conduit', 'tabElement', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (75, 'review_node', 'tabConnect', 'REVIEW_UD_NODE', 'F52');
INSERT INTO config_web_layer_tab VALUES (78, 'review_node', 'tabVisit', 'REVIEW_UD_NODE', 'F52');
INSERT INTO config_web_layer_tab VALUES (18, 'v_edit_man_connec', 'tabVisit', 'INFO_UTILS_CONNEC', 'F14');
INSERT INTO config_web_layer_tab VALUES (21, 'v_edit_man_gully', 'tabElement', 'INFO_UD_GULLY', 'F15');
INSERT INTO config_web_layer_tab VALUES (22, 'v_edit_man_gully', 'tabVisit', 'INFO_UD_GULLY', 'F15');
INSERT INTO config_web_layer_tab VALUES (11, 'v_edit_man_conduit', 'tabConnect', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (14, 'v_edit_man_conduit', 'tabVisit', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (35, 'v_edit_man_netinit', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (45, 'v_edit_man_siphon', 'tabElement', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (86, 'review_gully', 'tabVisit', 'REVIEW_UD_GULLY', 'F54');
INSERT INTO config_web_layer_tab VALUES (43, 'v_edit_man_siphon', 'tabConnect', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (46, 'v_edit_man_siphon', 'tabVisit', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (38, 'v_edit_man_netinit', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (27, 'v_edit_man_manhole', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (30, 'v_edit_man_manhole', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (41, 'v_edit_man_outfall', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (39, 'v_edit_man_outfall', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (42, 'v_edit_man_outfall', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (49, 'v_edit_man_storage', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (47, 'v_edit_man_storage', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (50, 'v_edit_man_storage', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (53, 'v_edit_man_valve', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (51, 'v_edit_man_valve', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (54, 'v_edit_man_valve', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (65, 'v_edit_man_wjump', 'tabElement', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (63, 'v_edit_man_wjump', 'tabConnect', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (66, 'v_edit_man_wjump', 'tabVisit', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (60, 'v_edit_man_waccel', 'tabDoc', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (68, 'v_edit_man_wwtp', 'tabDoc', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (24, 'v_edit_man_junction', 'tabDoc', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (72, 'review_arc', 'tabDoc', 'REVIEW_UD_ARC', 'F51');
INSERT INTO config_web_layer_tab VALUES (16, 'v_edit_man_connec', 'tabDoc', 'INFO_UTILS_CONNEC', 'F14');
INSERT INTO config_web_layer_tab VALUES (28, 'v_edit_man_manhole', 'tabDoc', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (76, 'review_node', 'tabDoc', 'REVIEW_UD_NODE', 'F52');
INSERT INTO config_web_layer_tab VALUES (79, 'review_connec', 'tabDoc', 'REVIEW_UD_CONNEC', 'F53');
INSERT INTO config_web_layer_tab VALUES (12, 'v_edit_man_conduit', 'tabDoc', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (20, 'v_edit_man_gully', 'tabDoc', 'INFO_UD_GULLY', 'F15');
INSERT INTO config_web_layer_tab VALUES (83, 'review_gully', 'tabDoc', 'REVIEW_UD_GULLY', 'F54');
INSERT INTO config_web_layer_tab VALUES (44, 'v_edit_man_siphon', 'tabDoc', 'INFO_UTILS_ARC', 'F13');
INSERT INTO config_web_layer_tab VALUES (40, 'v_edit_man_outfall', 'tabDoc', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (48, 'v_edit_man_storage', 'tabDoc', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (52, 'v_edit_man_valve', 'tabDoc', 'INFO_UD_NODE', 'F11');
INSERT INTO config_web_layer_tab VALUES (64, 'v_edit_man_wjump', 'tabDoc', 'INFO_UD_NODE', 'F11');

*/
