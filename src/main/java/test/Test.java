package test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.jupiter.api.DisplayName;

import day1224.EmpDTO;
import day1224.SelectDAO;
import day1224.SelectService;
import day1226.EmpDomain;
import day1226.SelectDAO2;
import day1229.SelectDAO3;
import kr.co.sist.car.CarDAO;
import kr.co.sist.car.CarService;

public class Test {

	@org.junit.Test
	@DisplayName("select 테스트")
	public void test() {
		/* SelectService ss =SelectService.getInstance(); */
		/* assertEquals(ss.scsr(10),"ACCOUNTINGGG"); */
		/* assertNotNull(ss.scmr(10)); */

		/*
		 * SelectDAO sDAO= SelectDAO.getInstance(); // EmpDTO eDTO =sDAO.mcsr(7788);
		 * List<EmpDTO> list = sDAO.mcmr(10); System.out.println(list);
		 * assertNotNull(list); 
		 * assertEquals(list.size(), 3);
		 */
		
		/*
		 * day1226.EmpDTO eDTO = new day1226.EmpDTO(); eDTO.setEmpno(7521);
		 * eDTO.setDeptno(30);
		 */
		/*
		 * SelectDAO2 sDAO =SelectDAO2.getInstance(); CarService cs =
		 * CarService.getInstance();
		 */
		/*
		 * EmpDomain ed = sDAO.useDomain(eDTO); 
		 * assertNotNull(ed);
		 */
//		CarService cs = CarService.getInstance();
//		System.out.println(cs.searchMaker("국산"));
//		System.out.println(cs.searchModel("현대"));
//		 CarDAO cDAO=CarDAO.getInstance();
		
		SelectDAO3 sd3= SelectDAO3.getInstance();
		try {
			
//			assertNotNull(sDAO.useLike("대치동"));
//			assertNotNull(sDAO.greaterThan(3000));
//			assertNotNull(sDAO.subquery());
//			assertNotNull(sDAO.union());
			/* assertNotNull(sDAO.join()); */
//			 assertNotNull(cs.serachModel("현대")); 
//			 assertNotNull(cDAO.selectModel("현대")); 
//			 assertNotNull(cDAO.selectCar("K5")); 
//			 assertNotNull(sd3.subQueryNjoin()); 
//			 assertNotNull(sd3.dollar("cp_emp5")); 
			 assertNotNull(sd3.dynamicIf(10)); 
			
		}catch (Exception e) {
			e.printStackTrace();
		}//end catch
		
	}// test

}// class
