<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<script src="http://192.168.10.77/mybatis_prj/common/js/color-modes.js"></script>

<link rel = "shortcut icon" href="http://192.168.10.77/mybatis_prj/common/images/favicon.ico">
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->


<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.77/mybatis_prj/common/css/carousel.css" rel="stylesheet">
<c:import url="http://192.168.10.77/mybatis_prj/fragments/bootstrap_css.jsp"/>
<style type="text/css">

#wrap{ margin: 0px auto; width:1200px; height:1000px;}

#header{ height:150px; /* background-color: #4179C2 */}
#container{ height:700px; /* background-color: #71B75E */}
#footer{ height:150px; /* background-color: #EF6E1 */}

select {text-align: center;}

#selectDiv{
	margin-bottom: 60px;

}
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	

	
	$("#carCountry").change(function(){
		
		
		
		var selModel=$("#carModel")[0];
		selModel.length=1;
		
		
		if($("#carCountry")[0].selectedIndex!=0){
			var param = {country:$("#carCountry").val()};
			
			$.ajax({
				url:"searchMaker.jsp",
				type:"get",
				data:param,
				dataType:"JSON",
				error:function(xhr){
					alert("제조사 조회 시 문제발생. \n 잠시 후에 다시 시도해주세요");
					console.log(xhr.status);
					
					
				},
				success:function(jsonObj){
					if(jsonObj.result && jsonObj.makerCnt!=0){
						
						//제조사를 설정할 select을 가져온다.
						var selMarker=$("#carMaker")[0];
						selMarker.length=1;
						
						var jsonArr = jsonObj.data;
						for(var i=0; i<jsonObj.data.length;i++){
							selMarker.options[i+1]=new Option(jsonArr[i].maker,jsonArr[i].maker);
							
						}//end for
						
					}//end if
							
				}
			});//ajax
			
		}//end if
	});//carCountry	
	
	$("#carMaker").change(function(){
		if($("#carMaker")[0].selectedIndex!=0){
			var param = {maker:$("#carMaker").val()};
						
						$.ajax({
							url:"searchModel.jsp",
							type:"get",
							data:param,
							dataType:"JSON",
							error:function(xhr){
								alert("모델 조회 시 문제발생. \n 잠시 후에 다시 시도해주세요");
								console.log(xhr.status);
								
								
							},
							success:function(jsonObj){
								if(jsonObj.result && jsonObj.modelCnt!=0){
									
									//모델를 설정할 select을 가져온다.
									var selModel=$("#carModel")[0];
									selModel.length=1;
									
									var jsonArr = jsonObj.data;
									for(var i=0; i<jsonObj.data.length;i++){
										selModel.options[i+1]=new Option(jsonArr[i].model,jsonArr[i].model);
										
									}//end for
									
								}//end if
										
							}
						});//ajax
					
		}//end if
			
	});//carMaker
	
	
$("#btn").click(function(){
	
			if($("#carModel")[0].selectedIndex!=0){
				var param = {model:$("#carModel").val()};
				
				$.ajax({
					url:"searchCar.jsp",
					type:"get",
					data:param,
					dataType:"JSON",
					error:function(xhr){
						alert("세부차량 조회 시 문제발생. \n 잠시 후에 다시 시도해주세요");
						console.log(xhr.status);
						
						
					},
					success:function(jsonObj){
						if(jsonObj.result ){
							
							//조회결과를 보여줄 table을 가져온다.
							var carTab=$("#catList");
							$("#carList > tbody").empty();
						
							var jsonArr = jsonObj.data;
							var createTr="";
							var jsonObjCar;
							for(var i=0; i<jsonObj.data.length;i++){
								jsonObjCar=jsonArr[i];
								createTr="<tr>"
								createTr+="<td><img src='http://localhost/mybatis_prj/day1226/car_img/"
											+jsonObjCar.car_img+"' style='width:80px; height:60px;'></td>"
								
								createTr+="<td>"+(jsonObjCar.car_option!=null?jsonObjCar.car_option:"無옵션")+"</td>";
								createTr+="<td>"+jsonObjCar.car_year+"</td>";
								createTr+="<td>"+jsonObjCar.price+"</td>";
								createTr+="<td>"+jsonObjCar.cc+"</td>";
								createTr+="<td>"+jsonObjCar.input_date+"</td>";
								createTr+="</tr>"
											
								$("#carList tbody:last").append(createTr);
							}//end for
							
							if(jsonObj.carCnt==0){//조회는 성공이나 해당 차가 없다면
								createTr="<tr><td colspan='6' style='text-align: center; height:100px; margin:0 auto'>보유중인 차량이 없어요!!!</td></tr>";
								
								$("#carList tbody:last").append(createTr);
								
							}//end if
							
						}//end if
								
					}
				});//ajax
							
			}//end if
		
});//btn
		
	
});//ready

</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="http://192.168.10.77/mybatis_prj/fragments/header.jsp"/>
	</header>
	<main>
		
		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
				<div>
					<!-- 뭐든 들어갈거 같은 영역 -->
					<div>
					<div id="selectDiv">
						<select id=carCountry>
							<option value="N/A">---제조국 선택---</option>
							<option value="국산">국산</option>
							<option value="수입">수입</option>
						
						</select>
						<select id=carMaker>
							<option value="N/A">---제조사 선택---</option>
						
						</select>
						<select id=carModel>
							<option value="N/A">---모델 선택---</option>
						
						</select>
						<input type="button" value="조회" id="btn" class="btn btn-info btn-sm"/> 
					</div>
					<div id="carListDiv">
						<table class="table table-hover" id="carList">
							<thead>
							<tr>
								<th>이미지</th>
								<th>옵션</th>
								<th>연식</th>
								<th>가격</th>
								<th>배기량</th>
								<th>입력일</th>
							</tr>
							</thead>
							<tbody></tbody>
					
					
					
						</table>
					
					</div>
					</div>
				</div>
			</div>
			<hr class="featurette-divider">
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<c:import url="http://192.168.10.77/mybatis_prj/fragments/footer.jsp"/>
		</footer>
	</main>

</body>
</html>