-- Generated by Ora2Pg, the Oracle database Schema converter, version 19.1
-- Copyright 2000-2018 Gilles DAROLD. All rights reserved.
-- DATASOURCE: dbi:Oracle:host=localhost;sid=orcl;port=1521

SET client_encoding TO 'UTF8';

SET search_path = pbs_data;
\set ON_ERROR_STOP ON

CREATE OR REPLACE VIEW pcv4_work_history (pxobjclass, pxhistoryforreference, pxtimecreated, pyhistoryclass, pyhistoryinskey, pyperformer, pyagefromdate, pycustomer, pycustomerenterprise, pycustomerorg, pyfoldertype, pyid, pyorigdivision, pyorigorg, pyorigorgunit, pyoriguserdivision, pyoriguserid, pyoriguserworkgroup, pyownerdivision, pyownerorg, pyownerorgunit, pyresolveddivision, pyresolvedorg, pyresolvedorgunit, pystatuscustomersat, pystatuswork, pyworkclass, pzinskey) AS SELECT 
	'Data-Work-History' AS pxObjClass,
	pc_history_work.pxHistoryForReference,
	pc_history_work.pxTimeCreated,
	pc_history_work.pxObjClass AS pyHistoryClass,
	pc_history_work.pzInsKey AS pyHistoryInsKey,
	pc_history_work.pyPerformer,
	pc_work.pyAgeFromDate,
	pc_work.pyCustomer,
	pc_work.pyCustomerEnterprise,
	pc_work.pyCustomerOrg,
	pc_work.pyFolderType,
	pc_work.pyID,
	pc_work.pyOrigDivision,
	pc_work.pyOrigOrg,
	pc_work.pyOrigOrgUnit,
	pc_work.pyOrigUserDivision,
	pc_work.pyOrigUserID,
	pc_work.pyOrigUserWorkgroup,
	pc_work.pyOwnerDivision,
	pc_work.pyOwnerOrg,
	pc_work.pyOwnerOrgUnit,
	pc_work.pyResolvedDivision,
	pc_work.pyResolvedOrg,
	pc_work.pyResolvedOrgUnit,
	pc_work.pyStatusCustomerSat,
	pc_work.pyStatusWork,
	pc_work.pxObjClass AS pyWorkClass,
	pc_work.pzInsKey
 FROM PBS_DATA.pc_history_work,PBS_DATA.pc_work
WHERE (pc_history_work.pxHistoryForReference = pc_work.pzInsKey);

CREATE OR REPLACE VIEW pcv4_assignment_summary (pxobjclass, pxassignedoperatorid, pxassignedorg, pxassignedorgdiv, pxassignedorgunit, pxassignedusername, pxcreatedatetime, pxdeadlinetime, pxflowname, pxgoaltime, pxrefobjectkey, pxtasklabel, pxtaskname, pxurgency, pxurgencyassign, pxworkgroup, pyassignmentclass, pyassignmentstatus, pyinstructions, pylabel, pxinsname, pycustomer, pycustomerenterprise, pycustomerorg, pyeffortactual, pyeffortestimate, pymanager, pyorigdivision, pyorigorg, pyorigorgunit, pyownerdivision, pyownerorg, pyownerorgunit, pystatuswork, pyworkclass, pyworkid, pzinskey, pxupdateoperator, pxupdatedatetime, pyworklistdate1, pyworklistdatetime1, pyworklistdatetime2, pyworklistdecimal1, pyworklistdecimal2, pyworklistinteger1, pyworklisttext1, pyworklisttext2, pyworklisttext3) AS SELECT 
	'Data-Assignment-Summary' AS pxObjClass,
	pc_assign_worklist.pxAssignedOperatorID,
	pc_assign_worklist.pxAssignedOrg,
	pc_assign_worklist.pxAssignedOrgDiv,
	pc_assign_worklist.pxAssignedOrgUnit,
	pc_assign_worklist.pxAssignedUserName,
	pc_assign_worklist.pxCreateDateTime,
	pc_assign_worklist.pxDeadlineTime,
	pc_assign_worklist.pxFlowName,
	pc_assign_worklist.pxGoalTime,
	pc_assign_worklist.pxRefObjectKey,
	pc_assign_worklist.pxTaskLabel,
	pc_assign_worklist.pxTaskName,
	pc_assign_worklist.pxUrgency,
	pc_assign_worklist.pxUrgencyAssign,
	pc_assign_worklist.pxWorkGroup,
	pc_assign_worklist.pxObjClass AS pyAssignmentClass,
	pc_assign_worklist.pyAssignmentStatus,
	pc_assign_worklist.pyInstructions,
	pc_assign_worklist.pyLabel,
	pc_work.pxInsName,
	pc_work.pyCustomer,
	pc_work.pyCustomerEnterprise,
	pc_work.pyCustomerOrg,
	pc_work.pyEffortActual,
	pc_work.pyEffortEstimate,
	pr_data_admin.pyManager,
	pc_work.pyOrigDivision,
	pc_work.pyOrigOrg,
	pc_work.pyOrigOrgUnit,
	pc_work.pyOwnerDivision,
	pc_work.pyOwnerOrg,
	pc_work.pyOwnerOrgUnit,
	pc_work.pyStatusWork,
	pc_work.pxObjClass AS pyWorkClass,
	pc_work.pyID AS pyWorkID,
	pc_assign_worklist.pzInsKey,
	pc_assign_worklist.pxUpdateOperator,
    pc_assign_worklist.pxUpdateDateTime,
	pc_work.pyWorkListDate1,
	pc_work.pyWorkListDateTime1, 
	pc_work.pyWorkListDateTime2, 
    pc_work.pyWorkListDecimal1,
    pc_work.pyWorkListDecimal2,
    pc_work.pyWorkListInteger1, 
    pc_work.pyWorkListText1,
    pc_work.pyWorkListText2, 
    pc_work.pyWorkListText3  
 FROM pbs_data.pr_data_admin, pbs_data.pc_work, pbs_data.pc_assign_worklist, pc_assign_worklist
LEFT OUTER JOIN pr_data_admin ON (pc_assign_worklist.pxWorkGroup = pr_data_admin.pyWorkGroupName)
WHERE pc_assign_worklist.pxRefObjectKey = pc_work.pzInsKey;

CREATE OR REPLACE VIEW pcv4_assignmentwb_summary (pxobjclass, pxassignedoperatorid, pxassignedorg, pxassignedorgdiv, pxassignedorgunit, pxcreatedatetime, pxdeadlinetime, pxflowname, pxgoaltime, pyassignmentclass, pxrefobjectkey, pxtasklabel, pxtaskname, pxurgency, pxurgencyassign, pxworkgroup, pyassignmentstatus, pyinstructions, pylabel, pxinsname, pycustomer, pycustomerenterprise, pycustomerorg, pyeffortactual, pyeffortestimate, pyworkid, pymanager, pyorigdivision, pyorigorg, pyorigorgunit, pyownerdivision, pyownerorg, pyownerorgunit, pystatuswork, pyworkclass, pzinskey, pyworklisttext3, pyworklisttext2, pyworklisttext1, pyworklistinteger1, pyworklistdecimal2, pyworklistdecimal1, pyworklistdatetime2, pyworklistdatetime1, pyworklistdate1, pxupdatedatetime, pxupdateoperator) AS SELECT 
	'Data-Assignment-WBSummary' AS pxObjClass,
	pc_assign_workbasket.pxAssignedOperatorID,
	pc_assign_workbasket.pxAssignedOrg,
	pc_assign_workbasket.pxAssignedOrgDiv,
	pc_assign_workbasket.pxAssignedOrgUnit,
	pc_assign_workbasket.pxCreateDateTime,
	pc_assign_workbasket.pxDeadlineTime,
	pc_assign_workbasket.pxFlowName,
	pc_assign_workbasket.pxGoalTime,
	pc_assign_workbasket.pxObjClass AS pyAssignmentClass,
	pc_assign_workbasket.pxRefObjectKey,
	pc_assign_workbasket.pxTaskLabel,
	pc_assign_workbasket.pxTaskName,
	pc_assign_workbasket.pxUrgency,
	pc_assign_workbasket.pxUrgencyAssign,
	pc_assign_workbasket.pxWorkGroup,
	pc_assign_workbasket.pyAssignmentStatus,
	pc_assign_workbasket.pyInstructions,
	pc_assign_workbasket.pyLabel,
	pc_work.pxInsName,
	pc_work.pyCustomer,
	pc_work.pyCustomerEnterprise,
	pc_work.pyCustomerOrg,
	pc_work.pyEffortActual,
	pc_work.pyEffortEstimate,
	pc_work.pyID AS pyWorkID,
	pr_data_admin.pyManager,
	pc_work.pyOrigDivision,
	pc_work.pyOrigOrg,
	pc_work.pyOrigOrgUnit,
	pc_work.pyOwnerDivision,
	pc_work.pyOwnerOrg,
	pc_work.pyOwnerOrgUnit,
	pc_work.pyStatusWork,
	pc_work.pxObjClass AS pyWorkClass,
	pc_assign_workbasket.pzInsKey,
	pc_work.pyWorkListText3, 
	pc_work.pyWorkListText2, 
	pc_work.pyWorkListText1, 
	pc_work.pyWorkListInteger1, 
	pc_work.pyWorkListDecimal2, 
	pc_work.pyWorkListDecimal1, 
	pc_work.pyWorkListDateTime2, 
	pc_work.pyWorkListDateTime1, 
	pc_work.pyWorkListDate1, 
	pc_assign_workbasket.pxUpdateDateTime, 
	pc_assign_workbasket.pxUpdateOperator
 FROM pbs_data.pr_data_admin, pbs_data.pc_work, pbs_data.pc_assign_workbasket, pc_assign_workbasket
LEFT OUTER JOIN pr_data_admin ON (pc_assign_workbasket.pxWorkGroup = pr_data_admin.pyWorkGroupName)
WHERE pc_assign_workbasket.pxRefObjectKey = pc_work.pzInsKey;


