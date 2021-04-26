package obo.util;

class ServerCheckListUtil {
	
 	public def format( def txt, def vals ) {
        if(vals==null) vals = [];
        def s = txt =~ /\{\w\}/ ;
        def sb = new StringBuffer();
        int i = 0;
        while (s.find()) {
           if(vals.size()-1 <= i) vals << "";
           def val = vals[i++];
           if( !val ) val = "?";
           s.appendReplacement(sb,"<u>"+val+"</u>"); 
        } 
        s.appendTail(sb);
        return sb.toString();
    }

}