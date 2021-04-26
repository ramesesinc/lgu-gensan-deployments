package obo.facts;

public class OboDecimalInfo extends OboVariableInfo {

	public double getValue() {
		return this.decimalvalue;
	}
	
	public void setValue( double d ) {
		this.decimalvalue = d;
	}
	
	public OboDecimalInfo() {}
	
	public OboDecimalInfo(def d) {
		copy(d);
	}


}


