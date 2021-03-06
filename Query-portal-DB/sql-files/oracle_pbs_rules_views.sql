-- Generated by Ora2Pg, the Oracle database Schema converter, version 19.1
-- Copyright 2000-2018 Gilles DAROLD. All rights reserved.
-- DATASOURCE: dbi:Oracle:host=localhost;sid=orcl;port=1521

SET client_encoding TO 'UTF8';

SET search_path = pbs_rules;
\set ON_ERROR_STOP ON

CREATE OR REPLACE VIEW pwbv4_rule_overrides (pxinsname, pyclass, pyclassname, pyruleset, pyrulesetversion, pycircumstanceval, pycircumstanceprop, pxupdatedatetime, pxupdateoperator, pylabel, pzinskey, pxobjclass) AS SELECT 
	distinct(r1.pxInsName),
	r1.pyClass,
	r1.pyClassName,
	r1.pyRuleSet,
	r1.pyRuleSetVersion,
	r1.pyCircumstanceVal,
	r1.pyCircumstanceProp,
	r1.pxUpdateDateTime,
	r1.pxUpdateOperator,
	r1.pyLabel,
	r1.pzInsKey,
	'Data-Rule-Overrides' AS pxObjClass
 FROM PBS_RULES.pr4_rule_vw r1,pr4_rule_vw r2
WHERE (r1.pxInsName = r2.pxInsName
	AND r1.pyClass = r2.pyClass
	AND r1.pyRuleSet <> r2.pyRuleSet
	AND r1.pyRuleSetVersion IS NOT NULL);

CREATE OR REPLACE VIEW pwbv4_rule_locking (pxcreatedatetime, pxobjclass, pxinsname, pyclass, pyclassname, pxupdatedatetime, pxupdateopname, pxupdateoperator, pylabel, pyrulename, pyruleset, pyrulesetversion, pycircumstanceprop, pxinstancelockedby, pzinskey, pycircumstanceval, pyruleavailable) AS SELECT 
   pxCreateDateTime,
	'Data-Rule-Locking' AS pxObjClass,
	pxInsName,
	pyClass,
	pyClassName,
	pxUpdateDateTime,
	pxUpdateOpName,
	pxUpdateOperator,
	pyLabel,
	pyRuleName,
	pyRuleSet,
	pyRuleSetVersion,
	pyCircumstanceProp,
	pxInstanceLockedBy,
	pzInsKey,
	pyCircumstanceVal,
	pyRuleAvailable
 FROM PBS_RULES.pr4_rule_vw WHERE pyClass != 'Rule-Obj-Class';

CREATE OR REPLACE VIEW pwbv4_circumstance_duplicates (pycircumstanceprop, pxinsname, pzinskey, pyclass, pxobjclass) AS SELECT 
	distinct(r1.pyCircumstanceProp) AS pyCircumstanceProp,
	r1.pxInsName,
	r1.pzInsKey as pzInsKey,
	r1.pyClass,
	'Data-Circumstance-Duplicates' AS pxObjClass
 FROM PBS_RULES.pr4_rule_vw r1,PBS_RULES.pr4_rule_vw r2
WHERE (r1.pxInsName = r2.pxInsName
	AND r2.pyCircumstanceProp is not null
	AND r1.pyCircumstanceProp <> r2.pyCircumstanceProp);


