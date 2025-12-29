package kr.co.sist.myCar;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisHandler;

public class CarDAO {

	private static CarDAO cDAO;
	
	private CarDAO() {
		
		
	}
	public static CarDAO getInstance() {
		if(cDAO==null) {
			cDAO=new CarDAO();
			
		}//end if
		
		return cDAO;
	}//getInstance
	
	public List<String> selectConutry() throws PersistenceException{
		List<String> cmoList = null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		cmoList=ss.selectList("kr.co.sist.myCar.country");
		
		if(ss!=null) {ss.close();}//end if
		
		return cmoList;
		
	}//selectConutry
	
	public List<String> selectMaker(String country) throws PersistenceException{
		List<String> mrList = null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		
		mrList=ss.selectList("kr.co.sist.myCar.marker",country);
		if(ss!=null) {ss.close();}//end if
		
		return mrList;
		
	}//selectConutry
	
	public List<String> selectModel(String maker) throws PersistenceException{
		List<String> mrList = null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		
		mrList=ss.selectList("kr.co.sist.myCar.model",maker);
		if(ss!=null) {ss.close();}//end if
		
		return mrList;
		
	}//selectConutry
	
	
	
	
}//class
