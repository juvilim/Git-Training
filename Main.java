import jess.JessException;
import jess.Rete;

public class Main {
	
	public static Rete objRete = new Rete();
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			objRete.batch("main.clp");
			objRete.reset();
			objRete.run();
			
		} catch (JessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
