<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Practice Part3</title>

</head>
<body>


	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div>
						<h3>Luyện tập part1</h3>

					</div>
				</div>

			</div>
			<hr>

			<div class="row">
				<div class="col-9 row" style="margin-top: 3vh">
					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh">


						<div class="row" style="padding: 3vh">
							<audio controls style="margin: auto">

								<source src="<c:url value="${mp3 }" />">

								Your browser does not support the audio element.
							</audio>


						</div>
						<div id="explan" style="color: black;"></div>
						<div class="row">
							<h6 style="margin: auto">A small text to lead the audio.</h6>
						</div>

						<hr />



						<div class="question">

							<c:forEach items="${lists}" var="q" varStatus="loop">

								<div class="row col-md-12"
									style="padding: 3vh; margin-top: 20px; color: black;">
									<p id="@qesstionContent_${q.id}">Câu ${loop.index + 1 }</p>

									<img src="<c:url value="${q.img}" />" width="450px"
										height="400px" />
										
									<hr />
									 <input type="hidden" name="@anwser_${q.id}"
										id="@input_${q.id}" /> <input id="qessId" type="hidden"
										name="qessId" value="${q.id}"> <input type="hidden"
										name="" id="@btnClick_${q.id}" />
								</div>
								
								

								<div class="row answers" id="showCheck">


									<div class="row col-md-12" style="margin: auto;">
										<button id="@op1_${q.id}" name="${q.op1}" class="col btn-de"
											<c:if test="${part1 != null}">disabled="disabled" </c:if>
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											onclick="setInput('@op1_${q.id}', '@input_${q.id}','@op2_${q.id}','@op3_${q.id}','@op4_${q.id}','@btnClick_${q.id }')"
											type="button">A</button>


										<button id="@op2_${q.id}" name="${q.op2}" class="col btn-de"
											<c:if test="${part1 != null}">disabled="disabled" </c:if>
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											onclick="setInput('@op2_${q.id}', '@input_${q.id}','@op1_${q.id}','@op3_${q.id}','@op4_${q.id}','@btnClick_${q.id }')"
											type="button">B</button>

									</div>



									<br>
									<div class="row col-md-12" style="margin: auto;">
										<button id="@op3_${q.id}" name="${q.op3}" class="col btn-de"
											<c:if test="${part1 != null}">disabled="disabled" </c:if>
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											onclick="setInput('@op3_${q.id}', '@input_${q.id}','@op1_${q.id}','@op2_${q.id}','@op4_${q.id}','@btnClick_${q.id }')"
											type="button">C</button>




										<button id="@op4_${q.id}" name="${q.op4}" class="col btn-de"
											<c:if test="${part1 != null}">disabled="disabled" </c:if>
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											onclick="setInput('@op4_${q.id}','@input_${q.id}','@op1_${q.id}','@op2_${q.id}','@op3_${q.id}','@btnClick_${q.id }')"
											type="button">D</button>
									</div>


								</div>


							</c:forEach>

							<button onclick="check(${idPart1})" class="btn btn-danger"
								id="btnCheck">Check</button>

						</div>

						<hr />



					</div>

				</div>

				<div class="col-3">
					<div class="col-md-11 col-xs-11 card card-body bg-light"
						style="margin-top: 30px; margin-bottom: 30px;">
						<div>
							<h3 style="color: dimgray">Exams</h3>
						</div>
						<br>
						<h4>
							<a href="#">Quizzes</a>
						</h4>
						<br>
						<h4>
							<a href="#">Vocabulary</a>
						</h4>
						<br>
						<h4>
							<a href="#">Reading</a>
						</h4>
						<br>
						<h4>
							<a href="#">Listening</a>
						</h4>

					</div>
				</div>

			</div>


		</div>

	</div>

	<script type="text/javascript">
	
	  
	  
		/// check email exist
       function check (idPart1) {
    	  
    	  
    	   
    	   var x, i;
    	   x = document.querySelectorAll("#qessId");
    	   
    	   var quess = [];
    	  	   
    	   for (i = 0; i < x.length; i++) {
    		   var obj = {};
    		      		
    		    console.log("tra loi  "+x[i].value);
    		    obj.idPart = idPart1;
    		    obj.idQuestion = x[i].value;
    		    obj.answer = document.getElementById("@input_"+x[i].value).value;
   
    		    quess.push(obj);
    	   
    	   }
    	   
    	   console.log(quess);
    	   
    	   $.ajax({
    	        type: "POST",
    	        contentType : "application/json",
    	        url : "/toeic2020/API/checkAnswerPart1",
    	        data : JSON.stringify(quess),
    	      
    	        success: function(res){
    	        	console.log(res);
    	        	
    	       // var exlan =	document.getElementById("explan");
    	        //explan.innerHTML= res.part1_questrionTranslate["contentEng"];
    	        	for(var i=0;i<res.part1Questions.length;i++){
    	        		
    	        	
    	        	//	console.log(document.getElementById("@input_"+x[i].value).value);
    	        		
    	        		document.getElementById("@op1_"+ res.part1Questions[i].id).disabled = true;	
    	        		document.getElementById("@op2_"+ res.part1Questions[i].id).disabled = true;	
    	        		document.getElementById("@op3_"+ res.part1Questions[i].id).disabled = true;	
    	        		document.getElementById("@op4_"+ res.part1Questions[i].id).disabled = true;	
    	        		
    	        		var op1 = document.getElementById("@op1_"+ res.part1Questions[i].id);
	        		 	op1.innerHTML = "A."+ op1.name;
	        		 	
	        		 	var op2 = document.getElementById("@op2_"+ res.part1Questions[i].id);
	        		 	op2.innerHTML = "B."+ op2.name;
	        		 	var op3 = document.getElementById("@op3_"+ res.part1Questions[i].id);
	        		 	op3.innerHTML = "C."+ op3.name;
	        		 	var op4 = document.getElementById("@op4_"+ res.part1Questions[i].id);
	        		 	op4.innerHTML = "D."+ op4.name;
    	        		
    	        		if(res.part1Questions[i].isTrue == 0){
    	        			
    	        			//khi click vao btn se lay dc id cua btn do
    	        			var btnClick = document.getElementById("@btnClick_"+ res.part1Questions[i].id).value;
    	        			
    	        			// neu btn do ma sai, thi hien thi mau do
    	        			var answerWrong = document.getElementById(btnClick);
    	        			answerWrong.style.color = "red";
    	        			
    	        			// neu content cua op1 == vs op_true, thi hien thi mau xanh
    	        			//@op1_8,@op1_9,@op1_10
    	        			if( document.getElementById("@op1_"+ res.part1Questions[i].id).name == res.part1Questions[i].op_true){
    	        				document.getElementById("@op1_"+ res.part1Questions[i].id).style.color = "green";
    	        			}
    	        			if( document.getElementById("@op2_"+ res.part1Questions[i].id).name == res.part1Questions[i].op_true){
    	        				document.getElementById("@op2_"+ res.part1Questions[i].id).style.color = "green";
    	        			}
    	        			if( document.getElementById("@op3_"+ res.part1Questions[i].id).name == res.part1Questions[i].op_true){
    	        				document.getElementById("@op3_"+ res.part1Questions[i].id).style.color = "green";
    	        			}
    	        			if( document.getElementById("@op4_"+ res.part1Questions[i].id).name == res.part1Questions[i].op_true){
    	        				document.getElementById("@op4_"+ res.part1Questions[i].id).style.color = "green";
    	        			}
    	        		}
    	        		
    	        		const explan = (res || {}).part1Questions[i].questionExplantation_part1 || null;        
    	        		
    	        		
    	        		
    	        		
    	        		//2.dich cau tra loi
    	        		// neu nhu cau hoi do ko co dich, thi set no la null
    	        				
    	        		
    	        		
    	        		if(explan != null){
    	        			//1.dich cau hoi
        	        		
        	        		var qContent= document.getElementById("@qesstionContent_"+res.part1Questions[i].id);
        	        		const meanQuesContent = (((res || {}).part1Questions[i].questionExplantation_part1 || {}).meanContent) || '';
        	        		qContent.innerHTML = res.part1Questions[i].content +" ( " + meanQuesContent + " )";
    	        			
    	        			//neu nhu cau tra loi do chua dc set nghia, thi set cho no la ''
    	        			const meanop1 = (((res || {}).part1Questions[i].questionExplantation_part1 || {}).mean_op1) || '';	
    	        			var op1 = document.getElementById("@op1_"+ res.part1Questions[i].id);
    	        		 	op1.innerHTML = "A."+ op1.name +" (" + meanop1 + ")";
    	        		 	
    	        		 	const meanop2 = (((res || {}).part1Questions[i].questionExplantation_part1 || {}).mean_op2) || '';	
    	        			var op2 = document.getElementById("@op2_"+ res.part1Questions[i].id);
    	        		 	op2.innerHTML = "B."+ op2.name +" (" + meanop2 + ")"; 
    	        		 	
    	        		 	const meanop3 = (((res || {}).part1Questions[i].questionExplantation_part1 || {}).mean_op3) || '';	
    	        			var op3 = document.getElementById("@op3_"+ res.part1Questions[i].id);
    	        		 	op3.innerHTML = "C."+ op3.name +" (" + meanop3 + ")"; 
    	        		 	
    	        		 	const meanop4 = (((res || {}).part1Questions[i].questionExplantation_part1 || {}).mean_op4) || '';	
    	        			var op4 = document.getElementById("@op4_"+ res.part1Questions[i].id);
    	        		 	op4.innerHTML = "D."+ op4.name +" (" + meanop4 + ")"; 
    	        			 
    	        		}
    	        		     		
    	        	}
    	        }
    	   });
    	   
			
			
			
		};
	
		function setInput(button, input, out1, out2, out3,btn) {

			document.getElementById(input).value = document.getElementById(button).name;
			document.getElementById(btn).value = document.getElementById(button).id;
			document.getElementById(button).style.color = "green";
			document.getElementById(out1).style.color = "#535353";
			document.getElementById(out2).style.color = "#535353";
			document.getElementById(out3).style.color = "#535353";

		};
		
		
	
		
		
		
	
	</script>
</body>

</html>