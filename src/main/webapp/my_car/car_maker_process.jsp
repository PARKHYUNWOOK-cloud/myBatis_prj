<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.myCar.CarService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String country = request.getParameter("country");
	

	CarService cs = CarService.getInstance();
	
	List<String> list = cs.serachMaker(country);
	
	
	JSONArray makerArr =  new JSONArray();
	JSONObject makerObj = null;
	
	for(int i =0; i<list.size(); i++){
		 makerObj = new JSONObject() ;
		 makerObj.put("maker", list.get(i));
		 makerObj.put("value", list.get(i));
		 
		 
		 makerArr.add(makerObj);

	}//end for
	
	out.print(makerArr.toJSONString());
	
	



%>