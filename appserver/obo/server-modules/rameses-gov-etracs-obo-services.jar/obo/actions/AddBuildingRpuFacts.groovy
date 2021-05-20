package obo.actions;

import rules.obo.facts.*;
import com.rameses.osiris3.core.TransactionContext;
import com.rameses.osiris3.script.*;
import com.rameses.rules.common.*;
import com.rameses.osiris3.common.*;
import com.rameses.util.*;
import obo.facts.*;

public class AddBuildingRpuFacts implements RuleActionHandler {

	public void execute(def params, def drools) {
		if(!params.params) throw new Exception("params required in AddBuildingRpuCount")
		def vparams = [:];
		if(  params.params ) {
			vparams = params.params.eval();
		}
		def txn = TransactionContext.getCurrentContext();
		def smr = txn.getManager(ScriptTransactionManager.class);
        def executor = smr.create( "BuildingPermitRpuService" );
        def facts = executor.execute( "getRpuFacts", vparams );
		def ct = RuleExecutionContext.getCurrentContext();
		ct.facts.addAll( facts );
	}

}