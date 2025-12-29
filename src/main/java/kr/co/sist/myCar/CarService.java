package kr.co.sist.myCar;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

public class CarService {

	private static CarService cs;
	
	private CarService() {
		
	}
	public static CarService getInstance() {
		if(cs==null) {
			cs=new CarService();
		}//end if
		
		return cs;
		
	}//getInstance
	
	public List<String> serachConutry(){
		List<String> list = null;
		
		CarDAO cDAO = CarDAO.getInstance();
		try {
			list=cDAO.selectConutry();
			
			
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch 
		
		
		return list;
		
	}//serachConutry
	
	
	public List<String> serachMaker(String country){
		List<String> list = null;
		
		CarDAO cDAO = CarDAO.getInstance();
		try {
			
			list=cDAO.selectMaker(country);
			
			
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch 
		
		
		return list;
		
	}//serachMaker
	
	
	public List<String> serachModel(String maker){
		List<String> list = null;
		
		CarDAO cDAO = CarDAO.getInstance();
		try {
			
			list=cDAO.selectModel(maker);
			
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch 
		
		
		return list;
		
	}//serachMaker
}
