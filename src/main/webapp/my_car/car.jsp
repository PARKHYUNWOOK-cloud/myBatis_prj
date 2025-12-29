<%@page import="day1226.CarMakerDomain"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.myCar.CarService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">

#selectLine{
	margin: 0 auto;
	margin-top:50px;
	margin-bottom:70px;
	text-align: center;
	justify-content: center;



}
select{

	text-align: center;
}

#carCountry{
	width: 100px;


}
#carMaker{
	width: 100px;


}


#carModel{
	width: 100px;


}





</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		alert("되겠냐..?");
	});
	
/* 자동차 국가를 가져오는 javascript  */
	$("#carCountry").change(function(){
		var country = $("#carCountry").val();
		if(country==="국산"|| country==="수입"){
			
			/* alert(country); */
		var param = "country="+country
			$.ajax({
				url :"car_maker_process.jsp",
				type:"get",
				data : param,
				dataType:"JSON",
			error:function(xhr){
					alert("error code : "+xhr.status +", msg : "+xhr.statusText);
				},
			success:function(data){
	    		
				   makerListPrint(data);
		    		
		    	}
			});//ajax
		}//end if
		
/* 자동차 모델을 가져오는 javascript  */
		
		$("#carMaker").change(function(){
			var maker = $("#carMaker").val();
			if(maker!="N/A"){
			
				
				/* alert(country); */
			var param = "maker="+maker
				$.ajax({
					url :"car_model_process.jsp",
					type:"get",
					data : param,
					dataType:"JSON",
				error:function(xhr){
						alert("error code : "+xhr.status +", msg : "+xhr.statusText);
					},
				success:function(data){
		    		
						modelListPrint(data);
			    		
			    	}
				});//ajax
			}//end if
			
			
			
			
			
		});//change
	});//change
	
	
	
	
});

function makerListPrint(data){
	var makerSel =$("#carMaker")[0];
	
	makerSel.length=1;
	$.each(data, function(i,ele){
		makerSel.options[i+1]=new Option(ele.maker,ele.value);
		
	});//each
	
	
}//makerListPrint

function modelListPrint(data){
	var modelSel =$("#carModel")[0];
		
		modelSel.length=1;
		$.each(data, function(i,ele){
			modelSel.options[i+1]=new Option(ele.model,ele.value);
			
		});//each
	
}//modelListPrint



</script>
</head>
<body>
<%
	CarService cs = CarService.getInstance();


%>


<div id="selectLine">
<select id="carCountry">
	<option value="N/A">선택</option>
	<option value="국산">국산</option>
	<option value="수입">수입</option>
</select>
<select id="carMaker">
	<option value="N/A">선택</option>
</select>
<select id="carModel">
	<option value="N/A">선택</option>
</select>
<input type="button" value="검색" id="btn" class="btn btn-info btn-sm"/>
</div>
<div id="tableLine">
<table class="table table-hover" style="text-align: center;">
<tr>
	<th>이미지</th>
	<th>제조사</th>
	<th>모델명</th>
	<th>년식</th>
	<th>가격</th>
	<th>배기량</th>
	<th>입력일</th>

</tr>

</table>

</div>

</body>
</html>