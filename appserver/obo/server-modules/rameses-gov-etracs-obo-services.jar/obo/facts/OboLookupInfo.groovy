package obo.facts;

public class OboLookupInfo extends OboVariableInfo {

	public String getValue() {
		return this.stringvalue;
	}
	
	public void setValue( String d ) {
		this.stringvalue = d;
	}
	
	public OboLookupInfo() {}

	public OboLookupInfo(def d) {
		copy(d);
		setValue( d.value.objid );
	}

}


