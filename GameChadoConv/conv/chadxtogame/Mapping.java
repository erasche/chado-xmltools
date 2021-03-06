//Mapping
package conv.chadxtogame;

import java.util.*;

public class Mapping {
private static HashMap m_FeatSubMap = new HashMap(10);

	public Mapping(){
	}

	public static void Add(String the_id,FeatSub the_element){
		if(m_FeatSubMap!=null){
			//System.out.print("MAPPING ADD<"+the_id+">");
			if(Lookup(the_id)==null){
			//	System.out.println(" NEW");
				m_FeatSubMap.put(the_id,the_element);
			}else{
			//	System.out.println(" REPEAT");
				m_FeatSubMap.put(the_id,the_element);
			}
		}
	}

	public static FeatSub Lookup(String the_id){
		if(m_FeatSubMap!=null){
			return (FeatSub)(m_FeatSubMap.get(the_id));
		}else{
			return null;
		}
	}

	public static void removeIfMatch(String the_id){
		if(m_FeatSubMap!=null){
			FeatSub fs = (FeatSub)(m_FeatSubMap.get(the_id));
			if(fs.isMatch()){
				m_FeatSubMap.remove(the_id);
				//System.out.println("========REMOVING FEATSUB<"+the_id+"> OF TYPE<"+fs.getTypeId()+">");
			}
		}
	}

	public static void clear(){
		m_FeatSubMap.clear();
		m_FeatSubMap = null;
	}

	public static void Display(){
		//System.out.println("MAPPED ATTRIBUTES:");
		Iterator it = m_FeatSubMap.keySet().iterator();
		while(it.hasNext()){
			String keyTxt = (String)it.next();
			//System.out.println("-FEATSUB KEY <"+keyTxt+">");
			FeatSub at = Lookup(keyTxt);
			at.Display(1);
			//System.out.println("");
		}
	}
}

