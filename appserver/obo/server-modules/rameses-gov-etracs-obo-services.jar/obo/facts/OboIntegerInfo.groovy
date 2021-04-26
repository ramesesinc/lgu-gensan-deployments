package obo.facts;

public class OboIntegerInfo extends OboVariableInfo {

	public int getValue() {
		return this.intvalue;
	}
	
	public void setValue( int d ) {
		this.intvalue = d;
	}

	public OboIntegerInfo() {}

	public OboIntegerInfo(def d) {
		copy(d);
	}
	
}


