package workflow.actions;

import com.rameses.rules.common.*;
import com.rameses.util.*;
import java.util.*;
import com.rameses.osiris3.common.*;
import com.rameses.util.*;
import com.rameses.osiris3.core.TransactionContext;
import com.rameses.osiris3.script.*;

class WfExecuteScript implements RuleActionHandler {
	
	public void execute(def params, def drools) {
		def scriptName = params.scriptname;
		def actionName = params.actionname;
		def connection = params.connectionname;

		if(!actionName) actionName = "execute";

		def vparams = [:];
		if(  params.params ) {
			vparams = params.params.eval();
		}
		def txn = TransactionContext.getCurrentContext();
		def smr = txn.getManager(ScriptTransactionManager.class);
        def executor = smr.create( scriptName );
        def res = executor.execute( actionName, vparams )

        if( params.debug ) {
        	throw new Exception("info is " + res);
        }

		if(res && params.info!=null) {
        	params.info.putAll( res );
        }
	}

}
