USE obo 
go 


alter table building_evaluation add CONSTRAINT fk_building_application_section_appid 
  FOREIGN KEY (appid) REFERENCES building_permit (objid)
go 
alter table building_evaluation add CONSTRAINT fk_building_application_section_taskid 
  FOREIGN KEY (taskid) REFERENCES building_evaluation_task (taskid)
go 
alter table building_evaluation add CONSTRAINT fk_building_application_section_typeid 
  FOREIGN KEY (typeid) REFERENCES building_evaluation_type (objid)
go 


alter table building_evaluation_finding add CONSTRAINT fk_building_permit_finding_appid 
  FOREIGN KEY (appid) REFERENCES building_permit (objid)
go 
alter table building_evaluation_finding add CONSTRAINT fk_building_permit_finding_parentid 
  FOREIGN KEY (parentid) REFERENCES building_evaluation (objid)
go 
alter table building_evaluation_finding add CONSTRAINT fk_building_permit_finding_supersederid 
  FOREIGN KEY (supersederid) REFERENCES building_evaluation_finding (objid)
go 


alter table building_evaluation_task add CONSTRAINT fk_building_permit_evaluation_task_refid 
  FOREIGN KEY (refid) REFERENCES building_evaluation (objid)
go 


alter table building_evaluation_type add CONSTRAINT fk_building_evaluation_type_sectionid 
  FOREIGN KEY (sectionid) REFERENCES obo_section (objid)
go 


alter table building_evaluation_type_role add CONSTRAINT fk_building_evaluation_type_role_typeid 
  FOREIGN KEY (typeid) REFERENCES building_evaluation_type (objid)
go 


alter table building_permit add CONSTRAINT fk_building_application_supervisorid 
  FOREIGN KEY (supervisorid) REFERENCES obo_professional_info (objid)
go 
alter table building_permit add CONSTRAINT fk_building_application_taskid 
  FOREIGN KEY (taskid) REFERENCES building_permit_task (taskid)
go 
alter table building_permit add CONSTRAINT fk_building_permit_controlid 
  FOREIGN KEY (occupancytypeid) REFERENCES obo_occupancy_type (objid)
go 
alter table building_permit add CONSTRAINT fk_building_permit_supervisorid 
  FOREIGN KEY (zoneclassid) REFERENCES obo_zoneclass (objid)
go 
alter table building_permit add CONSTRAINT fk_building_permit_taskid 
  FOREIGN KEY (controlid) REFERENCES obo_control (objid)
go 
alter table building_permit add CONSTRAINT fk_building_permit_zoneclassid 
  FOREIGN KEY (applicantid) REFERENCES building_permit_entity (objid)
go 


alter table building_permit_checklist add CONSTRAINT fk_building_permit_checklist_parentid 
  FOREIGN KEY (parentid) REFERENCES building_permit_doc (objid) 
go 


alter table building_permit_doc add CONSTRAINT fk_building_permit_doc_appid 
  FOREIGN KEY (appid) REFERENCES building_permit (objid)
go 
alter table building_permit_doc add CONSTRAINT fk_building_permit_doc_controlid 
  FOREIGN KEY (controlid) REFERENCES obo_control (objid)
go 
alter table building_permit_doc add CONSTRAINT fk_building_permit_doc_designprofid 
  FOREIGN KEY (designprofessionalid) REFERENCES obo_professional_info (objid)
go 
alter table building_permit_doc add CONSTRAINT fk_building_permit_doc_doctypeid 
  FOREIGN KEY (doctypeid) REFERENCES obo_doctype (objid)
go 
alter table building_permit_doc add CONSTRAINT fk_building_permit_doc_superprofid 
  FOREIGN KEY (supervisorid) REFERENCES obo_professional_info (objid)
go 



alter table building_permit_entity add CONSTRAINT fk_building_permit_entity_appid 
  FOREIGN KEY (appid) REFERENCES building_permit (objid)
go


alter table building_permit_fee add CONSTRAINT fk_building_permit_fee_appid 
  FOREIGN KEY (appid) REFERENCES building_permit (objid)
go 
alter table building_permit_fee add CONSTRAINT fk_building_permit_fee_itemid 
  FOREIGN KEY (itemid) REFERENCES obo_itemaccount (objid)
go 
alter table building_permit_fee add CONSTRAINT fk_builidng_permit_fee_parentid 
  FOREIGN KEY (parentid) REFERENCES building_permit_doc (objid)
go 


alter table building_permit_info add CONSTRAINT fk_building_permit_info_appid 
  FOREIGN KEY (appid) REFERENCES building_permit (objid)
go 
alter table building_permit_info add CONSTRAINT fk_building_permit_info_parentid 
  FOREIGN KEY (parentid) REFERENCES building_permit_doc (objid)
go 


alter table building_permit_payment add CONSTRAINT fk_building_permit_payment_appid 
  FOREIGN KEY (appid) REFERENCES building_permit (objid)
go 


alter table building_permit_requirement add CONSTRAINT fk_building_permit_requirement_appid 
  FOREIGN KEY (appid) REFERENCES building_permit (objid)
go 
alter table building_permit_requirement add CONSTRAINT fk_building_permit_requirement_parentid 
  FOREIGN KEY (parentid) REFERENCES building_permit_doc (objid)
go 
alter table building_permit_requirement add CONSTRAINT fk_building_permit_requirement_supersederid 
  FOREIGN KEY (supersederid) REFERENCES building_permit_requirement (objid)
go 
alter table building_permit_requirement add CONSTRAINT fk_building_permit_requirement_transmittalid 
  FOREIGN KEY (transmittalid) REFERENCES building_permit_transmittal (objid)
go 
alter table building_permit_requirement add CONSTRAINT fk_building_permit_requirement_typeid 
  FOREIGN KEY (typeid) REFERENCES obo_requirement_type (objid)
go 


alter table building_permit_rpu add CONSTRAINT fk_building_permit_rpu_appid 
  FOREIGN KEY (appid) REFERENCES building_permit (objid)
go 
alter table building_permit_rpu add CONSTRAINT fk_building_permit_rpu_ownerid 
  FOREIGN KEY (ownerid) REFERENCES building_permit_entity (objid)
go 


alter table building_permit_task add CONSTRAINT fx_building_permit_task_refid 
  FOREIGN KEY (refid) REFERENCES building_permit (objid)
go 


alter table building_permit_transmittal add CONSTRAINT fk_building_permit_transmittal_appid 
  FOREIGN KEY (appid) REFERENCES building_permit (objid)
go 


alter table obo_checklist_master add CONSTRAINT fk_obo_checklist_master 
  FOREIGN KEY (doctypeid) REFERENCES obo_doctype (objid)
go 


alter table obo_control add CONSTRAINT fk_obo_control_approverid 
  FOREIGN KEY (approverid) REFERENCES sys_signature (objid)
go 
alter table obo_control add CONSTRAINT fk_obo_control_doctypeid 
  FOREIGN KEY (doctypeid) REFERENCES obo_doctype (objid)
go 
alter table obo_control add CONSTRAINT fk_obo_control_endorserid 
  FOREIGN KEY (endorserid) REFERENCES sys_signature (objid)
go 


alter table obo_doctype add CONSTRAINT fk_obo_doctype_approverid 
  FOREIGN KEY (approverid) REFERENCES sys_signature (objid)
go 
alter table obo_doctype add CONSTRAINT fk_obo_doctype_endorserid 
  FOREIGN KEY (endorserid) REFERENCES sys_signature (objid)
go 
alter table obo_doctype add CONSTRAINT fk_obo_doctype_sectionid 
  FOREIGN KEY (sectionid) REFERENCES obo_section (objid)
go 


alter table obo_doctype_itemaccount add CONSTRAINT obo_doctype_itemaccount_itemid 
  FOREIGN KEY (itemid) REFERENCES obo_itemaccount (objid)
go 
alter table obo_doctype_itemaccount add CONSTRAINT obo_doctype_itemaccount_typeid 
  FOREIGN KEY (typeid) REFERENCES obo_doctype (objid)
go 


alter table obo_itemaccount add CONSTRAINT fk_obo_itemaccount_doctypeid 
  FOREIGN KEY (doctypeid) REFERENCES obo_doctype (objid)
go 


alter table obo_itemaccount_report_tag add CONSTRAINT fk_obo_itemaccount_itemid 
  FOREIGN KEY (itemid) REFERENCES obo_itemaccount (objid)
go 
alter table obo_itemaccount_report_tag add CONSTRAINT fk_obo_itemaccount_tag 
  FOREIGN KEY (tag) REFERENCES sys_report_tag (objid)
go 


alter table obo_occupancy_type add CONSTRAINT fk_obo_occupancytype_divisionid 
  FOREIGN KEY (divisionid) REFERENCES obo_occupancy_type_division (objid)
go 


alter table obo_occupancy_type_division add CONSTRAINT obo_occupancy_type_division_ibfk_1 
  FOREIGN KEY (groupid) REFERENCES obo_occupancy_type_group (objid)
go 


alter table obo_professional add CONSTRAINT fk_obo_professional_infoid 
  FOREIGN KEY (infoid) REFERENCES obo_professional_info (objid)
go


alter table obo_variable add CONSTRAINT fk_obo_variable_doctypeid 
  FOREIGN KEY (doctypeid) REFERENCES obo_doctype (objid)
go 
alter table obo_variable add CONSTRAINT fk_obo_variable_occupancytypeid 
  FOREIGN KEY (occupancytypeid) REFERENCES obo_occupancy_type (objid)
go 


alter table obo_work_type add CONSTRAINT fk_obo_work_type_doctypeid 
  FOREIGN KEY (doctypeid) REFERENCES obo_doctype (objid)
go


alter table occupancy_inspection add CONSTRAINT fx_occupancy_application_section_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid)
go 
alter table occupancy_inspection add CONSTRAINT fx_occupancy_application_section_taskid 
  FOREIGN KEY (taskid) REFERENCES occupancy_inspection_task (taskid)
go 
alter table occupancy_inspection add CONSTRAINT fx_occupancy_application_section_typeid 
  FOREIGN KEY (typeid) REFERENCES occupancy_inspection_type (objid)
go 


alter table occupancy_inspection_finding add CONSTRAINT fk_occupancy_application_finding_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid)
go 
alter table occupancy_inspection_finding add CONSTRAINT fk_occupancy_application_finding_parentid 
  FOREIGN KEY (parentid) REFERENCES occupancy_inspection (objid)
go 
alter table occupancy_inspection_finding add CONSTRAINT fk_occupancy_application_finding_supersederid 
  FOREIGN KEY (supersederid) REFERENCES occupancy_inspection_finding (objid)
go 


alter table occupancy_inspection_task add CONSTRAINT fk_occupancy_application_section_task_refid 
  FOREIGN KEY (refid) REFERENCES occupancy_inspection (objid) 
go


alter table occupancy_inspection_type add CONSTRAINT fk_occupancy_inspection_type_sectionid 
  FOREIGN KEY (sectionid) REFERENCES obo_section (objid) 
go


alter table occupancy_inspection_type_itemaccount add CONSTRAINT occupancy_inspection_type_itemaccount_itemid 
  FOREIGN KEY (itemid) REFERENCES obo_itemaccount (objid) 
go 
alter table occupancy_inspection_type_itemaccount add CONSTRAINT occupancy_inspection_type_itemaccount_typeid 
  FOREIGN KEY (typeid) REFERENCES occupancy_inspection_type (objid) 
go 


alter table occupancy_inspection_type_role add CONSTRAINT fk_building_inspection_type_role_typeid 
  FOREIGN KEY (typeid) REFERENCES occupancy_inspection_type (objid)
go


alter table occupancy_permit add CONSTRAINT fk_occupancy_permit_applicantid 
  FOREIGN KEY (applicantid) REFERENCES occupancy_permit_entity (objid) 
go 
alter table occupancy_permit add CONSTRAINT fk_occupancy_permit_bldgpermitid 
  FOREIGN KEY (bldgpermitid) REFERENCES building_permit (objid) 
go 
alter table occupancy_permit add CONSTRAINT fk_occupancy_permit_controlid 
  FOREIGN KEY (controlid) REFERENCES obo_control (objid) 
go 
alter table occupancy_permit add CONSTRAINT fk_occupancy_permit_supervisorid 
  FOREIGN KEY (supervisorid) REFERENCES obo_professional_info (objid) 
go 
alter table occupancy_permit add CONSTRAINT fk_occupancy_permit_taskid 
  FOREIGN KEY (taskid) REFERENCES occupancy_permit_task (taskid) 
go 


alter table occupancy_permit_checklist add CONSTRAINT fk_occupancy_permit_checklist_parentid 
  FOREIGN KEY (parentid) REFERENCES occupancy_permit_doc (objid)
go 


alter table occupancy_permit_doc add CONSTRAINT fk_occupancy_permit_doc_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid)
go 
alter table occupancy_permit_doc add CONSTRAINT fk_occupancy_permit_doc_controlid 
  FOREIGN KEY (controlid) REFERENCES obo_control (objid)
go 
alter table occupancy_permit_doc add CONSTRAINT fk_occupancy_permit_doc_doctypeid 
  FOREIGN KEY (doctypeid) REFERENCES obo_doctype (objid)
go 


alter table occupancy_permit_entity add CONSTRAINT fk_occupancy_permit_entity_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid) 
go


alter table occupancy_permit_fee add CONSTRAINT fk_occupancy_permit_fee_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid)
go 
alter table occupancy_permit_fee add CONSTRAINT fk_occupancy_permit_fee_itemid 
  FOREIGN KEY (itemid) REFERENCES obo_itemaccount (objid)
go 
alter table occupancy_permit_fee add CONSTRAINT fk_occupancy_permit_fee_parentid 
  FOREIGN KEY (parentid) REFERENCES occupancy_permit_doc (objid)
go 


alter table occupancy_permit_info add CONSTRAINT fk_occupancy_permit_info_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid)
go 
alter table occupancy_permit_info add CONSTRAINT fk_occupancy_permit_info_parentid 
  FOREIGN KEY (parentid) REFERENCES occupancy_permit_doc (objid)
go 


alter table occupancy_permit_payment add CONSTRAINT fk_occupancy_permit_payment_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid)
go


alter table occupancy_permit_professional add CONSTRAINT fk_occupancy_permit_professional_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid)
go 
alter table occupancy_permit_professional add CONSTRAINT fk_occupancy_permit_professional_entityid 
  FOREIGN KEY (entityid) REFERENCES occupancy_permit_entity (objid)
go


alter table occupancy_permit_requirement add CONSTRAINT fk_occupancy_permit_requirement_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid)
go 
alter table occupancy_permit_requirement add CONSTRAINT fk_occupancy_permit_requirement_supersederid 
  FOREIGN KEY (supersederid) REFERENCES occupancy_permit_requirement (objid)
go 
alter table occupancy_permit_requirement add CONSTRAINT fk_occupancy_permit_requirement_transmittalid 
  FOREIGN KEY (transmittalid) REFERENCES occupancy_permit_transmittal (objid)
go 
alter table occupancy_permit_requirement add CONSTRAINT fk_occupancy_permit_requirement_typeid 
  FOREIGN KEY (typeid) REFERENCES obo_requirement_type (objid)
go 


alter table occupancy_permit_task add CONSTRAINT fk_occupancy_application_task_refid 
  FOREIGN KEY (refid) REFERENCES occupancy_permit (objid)
go 


alter table occupancy_permit_transmittal add CONSTRAINT fk_occupancy_application_transmittal_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid)
go 


alter table occupancy_rpu add CONSTRAINT fk_occupancy_rpu_appid 
  FOREIGN KEY (appid) REFERENCES occupancy_permit (objid)
go 


alter table sys_rule add CONSTRAINT fk_sys_rule_rulegroup_ruleset 
  FOREIGN KEY (rulegroup, ruleset) REFERENCES sys_rulegroup (name, ruleset)
go 
alter table sys_rule add CONSTRAINT fk_sys_rule_ruleset 
  FOREIGN KEY (ruleset) REFERENCES sys_ruleset (name) 
go 


alter table sys_rulegroup add CONSTRAINT fk_sys_rulegroup_ruleset  
  FOREIGN KEY (ruleset) REFERENCES sys_ruleset (name)
go 


alter table sys_ruleset_actiondef add CONSTRAINT fk_sys_ruleset_actiondef_actiondef  
  FOREIGN KEY (actiondef) REFERENCES sys_rule_actiondef (objid)
go 
alter table sys_ruleset_actiondef add CONSTRAINT fk_sys_ruleset_actiondef_ruleset  
  FOREIGN KEY (ruleset) REFERENCES sys_ruleset (name)
go 


alter table sys_ruleset_fact add CONSTRAINT fk_sys_ruleset_fact_rulefact  
  FOREIGN KEY (rulefact) REFERENCES sys_rule_fact (objid)
go 
alter table sys_ruleset_fact add CONSTRAINT fk_sys_ruleset_fact_ruleset  
  FOREIGN KEY (ruleset) REFERENCES sys_ruleset (name)
go 


alter table sys_rule_action add CONSTRAINT fk_sys_rule_action_actiondef_objid  
  FOREIGN KEY (actiondef_objid) REFERENCES sys_rule_actiondef (objid) 
go 
alter table sys_rule_action add CONSTRAINT fk_sys_rule_action_parentid  
  FOREIGN KEY (parentid) REFERENCES sys_rule (objid) 
go 


alter table sys_rule_actiondef_param add CONSTRAINT fk_sys_rule_actiondef_param_parentid  
  FOREIGN KEY (parentid) REFERENCES sys_rule_actiondef (objid)
go 


alter table sys_rule_action_param add CONSTRAINT fk_sys_rule_action_param_obj_key 
  FOREIGN KEY (obj_key) REFERENCES obo_itemaccount (objid)
go 
alter table sys_rule_action_param add CONSTRAINT fk_sys_rule_action_param_actiondefparam_objid 
  FOREIGN KEY (actiondefparam_objid) REFERENCES sys_rule_actiondef_param (objid)
go 
alter table sys_rule_action_param add CONSTRAINT fk_sys_rule_action_param_parentid 
  FOREIGN KEY (parentid) REFERENCES sys_rule_action (objid)
go 
alter table sys_rule_action_param add CONSTRAINT fk_sys_rule_action_param_var_objid 
  FOREIGN KEY (var_objid) REFERENCES sys_rule_condition_var (objid)
go 


alter table sys_rule_condition add CONSTRAINT fk_sys_rule_condition_fact_objid  
  FOREIGN KEY (fact_objid) REFERENCES sys_rule_fact (objid)
go 
alter table sys_rule_condition add CONSTRAINT fk_sys_rule_condition_parentid  
  FOREIGN KEY (parentid) REFERENCES sys_rule (objid)
go 


alter table sys_rule_condition_constraint add CONSTRAINT fk_sys_rule_condition_constraint_field_objid 
  FOREIGN KEY (field_objid) REFERENCES sys_rule_fact_field (objid)
go 
alter table sys_rule_condition_constraint add CONSTRAINT fk_sys_rule_condition_constraint_parentid  
  FOREIGN KEY (parentid) REFERENCES sys_rule_condition (objid)
go 
alter table sys_rule_condition_constraint add CONSTRAINT fk_sys_rule_condition_constraint_var_objid  
  FOREIGN KEY (var_objid) REFERENCES sys_rule_condition_var (objid)
go 


alter table sys_rule_condition_var add CONSTRAINT fk_sys_rule_condition_var_parentid  
  FOREIGN KEY (parentid) REFERENCES sys_rule_condition (objid)
go 


alter table sys_rule_deployed add CONSTRAINT fk_sys_rule_deployed_objid  
  FOREIGN KEY (objid) REFERENCES sys_rule (objid)
go 


alter table sys_rule_fact_field add CONSTRAINT fk_sys_rule_fact_field_parentid 
  FOREIGN KEY (parentid) REFERENCES sys_rule_fact (objid)
go 


