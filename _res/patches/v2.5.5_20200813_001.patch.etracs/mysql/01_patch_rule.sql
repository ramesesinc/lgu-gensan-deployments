INSERT INTO `sys_rule_fact` (`objid`, `name`, `title`, `factclass`, `sortorder`, `handler`, `defaultvarname`, `dynamic`, `lookuphandler`, `lookupkey`, `lookupvalue`, `lookupdatatype`, `dynamicfieldname`, `builtinconstraints`, `domain`, `factsuperclass`) 
VALUES ('treasury.facts.VarString', 'treasury.facts.VarString', 'Var String', 'treasury.facts.VarString', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TREASURY', NULL);

INSERT INTO `sys_rule_fact_field` (`objid`, `parentid`, `name`, `title`, `datatype`, `sortorder`, `handler`, `lookuphandler`, `lookupkey`, `lookupvalue`, `lookupdatatype`, `multivalued`, `required`, `vardatatype`, `lovname`) 
VALUES ('treasury.facts.VarString.tag', 'treasury.facts.VarString', 'tag', 'Tag', 'string', '1', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);

INSERT INTO `sys_rule_fact_field` (`objid`, `parentid`, `name`, `title`, `datatype`, `sortorder`, `handler`, `lookuphandler`, `lookupkey`, `lookupvalue`, `lookupdatatype`, `multivalued`, `required`, `vardatatype`, `lovname`) 
VALUES ('treasury.facts.VarString.value', 'treasury.facts.VarString', 'value', 'Value', 'string', '2', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'string', NULL);

INSERT INTO `sys_ruleset_fact` (`ruleset`, `rulefact`) 
VALUES ('revenuesharing', 'treasury.facts.VarString');

