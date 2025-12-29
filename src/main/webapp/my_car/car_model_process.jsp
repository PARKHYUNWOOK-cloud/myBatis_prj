<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.myCar.CarService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String maker = request.getParameter("maker");

	CarService cs= CarService.getInstance();
	
	List<String> mList = cs.serachModel(maker);
	
	
	JSONArray modelArr = new JSONArray();
	JSONObject modelObj =null;
	
	for(int i=0; i<mList.size(); i++){
		modelObj = new JSONObject();
		
		modelObj.put("model", mList.get(i));
		modelObj.put("value", mList.get(i));
		
		modelArr.add(modelObj);
		
	}//end for


	out.print(modelArr.toJSONString());



%>