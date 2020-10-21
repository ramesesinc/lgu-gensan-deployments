CREATE TABLE batch_rpttaxcredit (
  objid varchar(50) NOT NULL,
  state varchar(25) NOT NULL,
  txndate date NOT NULL,
  txnno varchar(25) NOT NULL,
  rate decimal(10,2) NOT NULL,
  paymentfrom date DEFAULT NULL,
  paymentto varchar(255) DEFAULT NULL,
  creditedyear int NOT NULL,
  reason varchar(255) NOT NULL,
  validity date NULL,
  PRIMARY KEY (objid)
) 
go

create index ix_state on batch_rpttaxcredit(state)
go
create index ix_txnno on batch_rpttaxcredit(txnno)
go

CREATE TABLE batch_rpttaxcredit_ledger (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NOT NULL,
  state varchar(25) NOT NULL,
  error varchar(255) NULL,
	barangayid varchar(50) not null, 
  PRIMARY KEY (objid)
) 
go


create index ix_parentid on batch_rpttaxcredit_ledger (parentid)
go
create index ix_state on batch_rpttaxcredit_ledger (state)
go
create index ix_barangayid on batch_rpttaxcredit_ledger (barangayid)
go

alter table batch_rpttaxcredit_ledger 
add constraint fk_rpttaxcredit_rptledger_parent foreign key(parentid) references batch_rpttaxcredit(objid)
go

alter table batch_rpttaxcredit_ledger 
add constraint fk_rpttaxcredit_rptledger_rptledger foreign key(objid) references rptledger(objid)
go




CREATE TABLE batch_rpttaxcredit_ledger_posted (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NOT NULL,
  barangayid varchar(50) NOT NULL,
  PRIMARY KEY (objid)
)
go

create index ix_parentid on batch_rpttaxcredit_ledger_posted(parentid)
go
create index ix_barangayid on batch_rpttaxcredit_ledger_posted(barangayid)
go

alter table batch_rpttaxcredit_ledger_posted 
add constraint fk_rpttaxcredit_rptledger_posted_parent foreign key(parentid) references batch_rpttaxcredit(objid)
go

alter table batch_rpttaxcredit_ledger_posted 
add constraint fk_rpttaxcredit_rptledger_posted_rptledger foreign key(objid) references rptledger(objid)
go

create view vw_batch_rpttaxcredit_error
as 
select br.*, rl.tdno
from batch_rpttaxcredit_ledger br 
inner join rptledger rl on br.objid = rl.objid 
where br.state = 'ERROR'
go

alter table rpttaxcredit add info text
go


alter table rpttaxcredit add discapplied decimal(16,2) not null
go

update rpttaxcredit set discapplied = 0 where discapplied is null 
go

