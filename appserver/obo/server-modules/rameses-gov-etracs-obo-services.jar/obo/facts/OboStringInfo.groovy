package obo.facts;

public class OboStringInfo extends OboVariableInfo {

	public String getValue() {
		return this.stringvalue;
	}
	
	public void setValue( String d ) {
		this.stringvalue = d;
	}
	
	public OboStringInfo() {}

	public OboStringInfo(def d) {
		copy(d);
	}

}


