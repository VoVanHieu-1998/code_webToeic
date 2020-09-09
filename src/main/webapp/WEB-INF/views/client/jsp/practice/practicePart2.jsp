<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Practice Part2</title>

</head>
<body>


	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div>
						<h3>Luyện tập part2</h3>

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

								<div class="row ask" style="padding: 3vh">
									<h5 id="@qesstionContent_${q.id}" style="text-align: left;">${loop.index + 1}.${q.content}

										



									</h5>
									<br> <input type="hidden" name="@anwser_${q.id}"
										id="@input_${q.id}" /> <input id="qessId" type="hidden"
										name="qessId" value="${q.id}"> <input type="hidden"
										name="" id="@btnClick_${q.id}" />

								</div>

								<div class="row answers" id="showCheck">


									<div class="row col-md-10" style="margin: auto;">
										<button id="@op1_${q.id}" name="${q.op1}" class="col btn-de"
											<c:if test="${part2 != null}">disabled="disabled" </c:if>
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											onclick="setInput('@op1_${q.id}', '@input_${q.id}','@op2_${q.id}','@op3_${q.id}','@btnClick_${q.id }')"
											type="button">A. ${q.op1}</button>


										<button id="@op2_${q.id}" name="${q.op2}" class="col btn-de"
											<c:if test="${part2 != null}">disabled="disabled" </c:if>
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											onclick="setInput('@op2_${q.id}', '@input_${q.id}','@op1_${q.id}','@op3_${q.id}','@btnClick_${q.id }')"
											type="button">
											B. ${q.op2}
											

										</button>
										
										<button id="@op3_${q.id}" name="${q.op3}" class="col btn-de"
											<c:if test="${part2 != null}">disabled="disabled" </c:if>
											style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
											onclick="setInput('@op3_${q.id}', '@input_${q.id}','@op1_${q.id}','@op2_${q.id}','@btnClick_${q.id }')"
											type="button">
											C. ${q.op3}
											

										</button>
									</div>
								</div>


							</c:forEach>

							<button onclick="check(${idPart2})" class="btn btn-danger" id="btnCheck"
								>Check</button>

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
       function check(idPart2) {
    	   
    	   var x, i;
    	   x = document.querySelectorAll("#qessId");
    	   
    	   var quess = [];
    	  	   
    	   for (i = 0; i < x.length; i++) {
    		   var obj = {};
    		      		
    		    console.log("tra loi  "+x[i].value);
    		    obj.idPart = idPart2;
    		    obj.idQuestion = x[i].value;
    		    obj.answer = document.getElementById("@input_"+x[i].value).value;
   
    		    quess.push(obj);
    	   
    	   }
    	   
    	   console.log(quess);
    	   
    	   $.ajax({
    	        type: "POST",
    	        contentType : "application/json",
    	        url : "/toeic2020/API/checkAnswerPart2",
    	        data : JSON.stringify(quess),
    	      
    	        success: function(res){
    	        	console.log(res);
    	        	
    	        var exp = document.getElementById("explan");
    	       // console.log("dcm:"+exp.value)
    	       // explan.innerHTML= res.part2_questrionTranslate["contentEng"];
    	        document.getElementById("btnCheck").disabled = true;
    	        	for(var i=0;i<res.part2Questions.length;i++){
    	        		document.getElementById("@op1_"+ res.part2Questions[i].id).disabled = true;	
    	        		document.getElementById("@op2_"+ res.part2Questions[i].id).disabled = true;	
    	        		document.getElementById("@op3_"+ res.part2Questions[i].id).disabled = true;	
    	        		
    	        	
    	        	//	console.log(document.getElementById("@input_"+x[i].value).value);
    	        		
    	        		
    	        		if(res.part2Questions[i].isTrue == 0){
    	        			
    	        			//khi click vao btn se lay dc id cua btn do
    	        			var btnClick = document.getElementById("@btnClick_"+ res.part2Questions[i].id).value;
    	        			
    	        			// neu btn do ma sai, thi hien thi mau do
    	        			var answerWrong = document.getElementById(btnClick);
    	        			answerWrong.style.color = "red";
    	        			// neu content cua op1 == vs op_true, thi hien thi mau xanh
    	        			//@op1_8,@op1_9,@op1_10
    	        			if( document.getElementById("@op1_"+ res.part2Questions[i].id).name == res.part2Questions[i].op_true){
    	        				document.getElementById("@op1_"+ res.part2Questions[i].id).style.color = "green";
    	        			}
    	        			if( document.getElementById("@op2_"+ res.part2Questions[i].id).name == res.part2Questions[i].op_true){
    	        				document.getElementById("@op2_"+ res.part2Questions[i].id).style.color = "green";
    	        			}
    	        			if( document.getElementById("@op3_"+ res.part2Questions[i].id).name == res.part2Questions[i].op_true){
    	        				document.getElementById("@op3_"+ res.part2Questions[i].id).style.color = "green";
    	        			}
    	        		}
    	        		
    	        		const explan = (res || {}).part2Questions[i].questionExplantation_part2 || null;        
    	        		
    	        		console.log(explan);
    	        		
    	        		
    	        		//2.dich cau tra loi
    	        		// neu nhu cau hoi do ko co dich, thi set no la null
    	        				
    	        		
    	        		
    	        		if(explan != null){
    	        			//1.dich cau hoi
        	        		
        	        		var qContent= document.getElementById("@qesstionContent_"+res.part2Questions[i].id);
        	        		const meanQuesContent = (((res || {}).part2Questions[i].questionExplantation_part2 || {}).meanContent) || '';
        	        		qContent.innerHTML = res.part2Questions[i].content +" ( " + meanQuesContent + " )";
    	        			
    	        			//neu nhu cau tra loi do chua dc set nghia, thi set cho no la ''
    	        			const meanop1 = (((res || {}).part2Questions[i].questionExplantation_part2 || {}).mean_op1) || '';	
    	        			var op1 = document.getElementById("@op1_"+ res.part2Questions[i].id);
    	        		 	op1.innerHTML = "A."+ op1.name +" (" + meanop1 + ")";
    	        		 	
    	        		 	const meanop2 = (((res || {}).part2Questions[i].questionExplantation_part2 || {}).mean_op2) || '';	
    	        			var op2 = document.getElementById("@op2_"+ res.part2Questions[i].id);
    	        		 	op2.innerHTML = "B."+ op2.name +" (" + meanop2 + ")"; 
    	        		 	
    	        		 	const meanop3 = (((res || {}).part2Questions[i].questionExplantation_part2 || {}).mean_op3) || '';	
    	        			var op3 = document.getElementById("@op3_"+ res.part2Questions[i].id);
    	        		 	op3.innerHTML = "C."+ op3.name +" (" + meanop3 + ")"; 
    	        			 
    	        		}
    	        		     		
    	        	}
    	        }
    	   });	
			
		};
	
		function setInput(button, input, out1, out2,btn) {

			document.getElementById(input).value = document.getElementById(button).name;
			document.getElementById(btn).value = document.getElementById(button).id;
			document.getElementById(button).style.color = "green";
			document.getElementById(out1).style.color = "#535353";
			document.getElementById(out2).style.color = "#535353";

		};
		
	</script>
</body>

</html>