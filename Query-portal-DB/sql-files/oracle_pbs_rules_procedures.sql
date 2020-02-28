-- Generated by Ora2Pg, the Oracle database Schema converter, version 19.1
-- Copyright 2000-2018 Gilles DAROLD. All rights reserved.
-- DATASOURCE: dbi:Oracle:host=localhost;sid=orcl;port=1521

SET client_encoding TO 'UTF8';

SET search_path = pbs_rules;
\set ON_ERROR_STOP ON



-- Copyright (c) 2010  Pegasystems Inc.
-- All rights reserved.
--
-- This  software  has  been  provided pursuant  to  a  License
-- Agreement  containing  restrictions on  its  use.   The  software
-- contains  valuable  trade secrets and proprietary information  of
-- Pegasystems Inc and is protected by  federal   copyright law.  It
-- may  not be copied,  modified,  translated or distributed in  any
-- form or medium,  disclosed to third parties or used in any manner
-- not provided for in  said  License Agreement except with  written
-- authorization from Pegasystems Inc.
--
-- procedure to rebuild all the indexes for the rule tables and to recompute the statistics
-- Usage: SPPR_REBUILD_INDEXES('rules'), where rules is a special key word to re-index only the rule tables
CREATE OR REPLACE FUNCTION pbs_rules.sppr_rebuild_indexes (index_type text) RETURNS VOID AS $body$
DECLARE

indexName varchar(255);
cmd varchar(500);
tableOwner varchar(255);
tableName varchar(255);
onlineOptAvail varchar(5) := 'FALSE';
onlineClause varchar(7) := ' ';





lv_statcollected boolean := false;
lv_table varchar(30) := ' ';

-- Objects created using quotes like "foo" will be persisted in specified case in the system catalog
indexCursor CURSOR FOR
SELECT index_name,
  table_owner,
  table_name
FROM user_indexes
WHERE table_name IN ('PR4_RULE_VW',   'PR_INDEX_REFERENCE',   'PR4_BASE',   'PR4_RULE',   'PR4_FIELDVALUE',
'PR4_RULE_AUTOTEST',   'PR4_RULE_FILE',   'PR4_RULE_FLOW',   'PR4_RULE_PROPERTY',   'PR4_RULE_SYSGEN',   
'PR_SYS_DECCHG', 'PR4_RULE_SHORTCUT', 'PR4_RULE_RULESET', 'PR_SYS_CACHE_DEP', 'PR_SYS_CACHE_ENTRY', 
'PR_SYS_RULESET_INDEX', 'PR_SYS_CLASS_ANCESTORS', 'PR_SYS_APP_RULESET_INDEX', 'PR_SYS_APPCACHE_SHORTCUT', 
'PR_SYS_APPCACHE_ENTRY', 'PR_SYS_APP_HIERARCHY_FLAT', 'PR_SYS_APPCACHE_DEP', 'PR_INDEX_WARNINGS') 
       AND index_type = 'NORMAL'
       AND upper(table_owner) = upper('PBS_RULES')
       ORDER BY table_name;

BEGIN
 
	IF lower(index_type) = 'rules' THEN
    OPEN indexCursor;
    LOOP
		FETCH indexCursor
		INTO indexName,tableOwner,tableName;

		EXIT
			WHEN indexCursor % NOTFOUND;
    		
    	--DBMS_OUTPUT.PUT_LINE('rebuild index ' || tableOwner || '.' || indexName );
    	cmd := 'ALTER INDEX ' || tableOwner || '.' || indexName || ' REBUILD ';
		-- Create a exception block to trap the exception RESOURCE NO WAIT time out found 
		IF tableName <> lv_table THEN
			lv_table := tableName;
			lv_statcollected := false;
		END IF;	
        BEGIN
			EXECUTE(cmd);
		EXCEPTION
  			WHEN SQLSTATE '50001' THEN
    				NULL;
  			WHEN OTHERS THEN
    			RAISE;
		END;
		--
		--Skip any locked table. Need to do optimization in next release to improve performance
		--
		BEGIN
		     IF lv_statcollected = false THEN	
          		--dbms_output.put_line('gather stats on table ' || tableOwner || '.' || tableName);
		     	dbms_stats.gather_table_stats(tableOwner,   tableName);
		     	lv_statcollected := true;
		     END IF;
		EXCEPTION
    		WHEN SQLSTATE '50002' THEN
		    	NULL;
		    WHEN OTHERS THEN
		    	RAISE;
    	END;
	END LOOP;

  CLOSE indexCursor;
END IF;
END;
$body$
LANGUAGE PLPGSQL
;
-- REVOKE ALL ON FUNCTION pbs_rules.sppr_rebuild_indexes (index_type text) FROM PUBLIC;

