use obo_gensan;

insert into sys_orgclass (name, title) values ('EXTERNAL','EXTERNAL OFFICE'); 

insert into sys_org (objid, name, orgclass, code, root, txncode) 
values 
('BFP', 'BUREAU OF FIRE PROTECTION', 'EXTERNAL', 'BFP', 0, 'BFP'),
('CPDO', 'CITY PLANNING AND DEVELOPMENT OFFICE', 'EXTERNAL', 'CPDO', 0, 'CPDO'),
('OBO', 'OBO', 'EXTERNAL', 'OBO', 0, 'OBO')
;
