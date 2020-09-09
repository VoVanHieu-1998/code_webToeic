<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Practice Part5</title>

</head>
<body>


	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div>
						<h3>Luyện tập part5</h3>

					</div>
				</div>

			</div>
			<hr>

			<div class="row">
				<div class="col-9 row" style="margin-top: 3vh">
					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh">


						<div id="explan" style="color: black;"></div>


						<hr />



						<div class="question">


							<div class="row ask" style="padding: 3vh">

								<h5>Giải thích</h5>
								<div id="explantation" style="margin-top: 10px; color: black;"></div>
							</div>

							<div class="row ask" style="padding: 3vh">
								<h5 id="@qesstionContent_${part5Question.id}"
									style="text-align: left;">${part5Question.order}.${part5Question.content}





								</h5>
								<br> <input type="hidden"
									name="@anwser_${part5Question.id}"
									id="@input_${part5Question.id}" /> <input id="qessId"
									type="hidden" name="qessId" value="${part5Question.id}">
								<input type="hidden" name="" id="@btnClick_${part5Question.id}" />

							</div>

							<div class="row answers" id="showCheck">


								<div class="row col-md-12" style="margin: auto;">
									<button id="@op1_${part5Question.id}"
										name="${part5Question.op1}" class="col btn-de"
										style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
										onclick="setInput('@op1_${part5Question.id}', '@input_${part5Question.id}','@op2_${part5Question.id}','@op3_${part5Question.id}','@op4_${part5Question.id}','@btnClick_${part5Question.id }')"
										type="button">A. ${part5Question.op1}</button>


									<button id="@op2_${part5Question.id}"
										name="${part5Question.op2}" class="col btn-de"
										style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
										onclick="setInput('@op2_${part5Question.id}', '@input_${part5Question.id}','@op1_${part5Question.id}','@op3_${part5Question.id}','@op4_${q.id}','@btnClick_${part5Question.id }')"
										type="button">B. ${part5Question.op2}</button>

								</div>



								<br>

								<div class="row col-md-12" style="margin: auto;">
									<button id="@op3_${part5Question.id}"
										name="${part5Question.op3}" class="col btn-de"
										style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
										onclick="setInput('@op3_${part5Question.id}', '@input_${part5Question.id}','@op1_${part5Question.id}','@op2_${part5Question.id}','@op4_${part5Question.id}','@btnClick_${part5Question.id }')"
										type="button">C. ${part5Question.op3}</button>



									<button id="@op4_${part5Question.id}"
										name="${part5Question.op4}" class="col btn-de"
										style="color: #535353; border: solid; border-radius: 5px; height: 70px; width: 170px; margin: 1vh; text-align: left;"
										onclick="setInput('@op4_${part5Question.id}','@input_${part5Question.id}','@op1_${part5Question.id}','@op2_${part5Question.id}','@op3_${part5Question.id}','@btnClick_${part5Question.id }')"
										type="button">D. ${part5Question.op4}</button>
								</div>


							</div>




							<button id="btnCheck" onclick="check(${idPart5Lesson})"
								class="btn btn-danger">Check</button>
							<c:choose>
								<c:when test="${groupNum +1 < 10}">
									<a id="btnNext" style="display: none;"
										href="<c:url value="/practice/part5/detail?lessonId=${idPart5Lesson}&groupNum=${groupNum + 1 }"/>"><button
											id="btnCheck" class="btn btn-danger">Next</button></a>

								</c:when>
								<c:otherwise>
									<a id="btnNext" href="<c:url value="/practice/part5/result"/>"><button
											id="btnCheck" class="btn btn-danger">Next</button></a>

								</c:otherwise>
							</c:choose>

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
	
	<script language="javascript" type="text/javascript">
		window.onbeforeunload = function() {
	   
		return "Are you really sure?\nI don't know why anyone would want to leave my beautiful website!";
	};
	
</script>
	<script type="text/javascript">
	
	
	  
		/// check email exist
       function check (idPart5Lesson) {
    	   document.getElementById("btnNext").style.display = "inline-block";
    	  
    	   
    	   var x, i;
    	   x = document.querySelectorAll("#qessId");
    	   
    	   var quess = [];
    	  	   
    	   for (i = 0; i < x.length; i++) {
    		   var obj = {};
    		      		
    		    console.log("tra loi  "+x[i].value);
    		    obj.idPart = idPart5Lesson;
    		    obj.idQuestion = x[i].value;
    		    obj.answer = document.getElementById("@input_"+x[i].value).value;
   
    		    quess.push(obj);
    	   
    	   }
    	   
    	   console.log(quess);
    	   
    	   $.ajax({
    	        type: "POST",
    	        contentType : "application/json",
    	        url : "/toeic2020/API/checkAnswerQuestionPart5",
    	        data : JSON.stringify(quess),
    	      
    	        success: function(res){
    	        	console.log(res);
    	        	
    	        var exlan =	document.getElementById("explan");
    	     //   explan.innerHTML= res.part5QuestionExplantaion["meanContent"];
    	        
    	        //disable btn check
    	        document.getElementById("btnCheck").disabled = true;
    	        
    	       
    	        const explan = (res || {}).part5QuestionExplantaion || null;        
        		console.log("dfdf"+explan);
        		
        		
        		
        		//2.dich cau tra loi
        		// neu nhu cau hoi do ko co dich, thi set no la null
        				
        		
        		
        		if(explan != null){
        			
        			
        			var explantation= document.getElementById("explantation");
        			explantation.innerHTML = (((res || {}).part5QuestionExplantaion || {}).explantation) || '';
        			//1.dich cau hoi
	        		
	        		var qContent= document.getElementById("@qesstionContent_"+res.id);
	        		const meanQuesContent = (((res || {}).part5QuestionExplantaion || {}).meanContent) || '';
	        		qContent.innerHTML = res.content +"<br/> ( " + meanQuesContent + " )";
        			
        			//neu nhu cau tra loi do chua dc set nghia, thi set cho no la ''
        			const meanop1 = (((res || {}).part5QuestionExplantaion || {}).mean_op1) || '';	
        			var op1 = document.getElementById("@op1_"+ res.id);
        		 	op1.innerHTML = "A."+ op1.name +"<br/> <span style=\"color :blue;\"> --->(" + meanop1 + ")</span>";
        		 	
        		 	const meanop2 = (((res || {}).part5QuestionExplantaion || {}).mean_op2) || '';	
        			var op2 = document.getElementById("@op2_"+ res.id);
        		 	op2.innerHTML = "B."+ op2.name +"<br/> <span style=\"color :blue;\"> --->(" + meanop2 + ")</span>"; 
        		 	
        		 	const meanop3 = (((res || {}).part5QuestionExplantaion || {}).mean_op3) || '';	
        			var op3 = document.getElementById("@op3_"+ res.id);
        		 	op3.innerHTML = "C."+ op3.name +"<br/> <span style=\"color :blue;\"> --->(" + meanop3 + ")</span>"; 
        		 	
        		 	const meanop4 = (((res || {}).part5QuestionExplantaion || {}).mean_op4) || '';	
        			var op4 = document.getElementById("@op4_"+ res.id);
        		 	op4.innerHTML = "D."+ op4.name +"<br/> <span style=\"color :blue;\"> --->(" + meanop4 + ")</span>"; 
        			 
        		}
        		if(res.isTrue == 0){
        			
        			//khi click vao btn se lay dc id cua btn do
        			var btnClick = document.getElementById("@btnClick_"+ res.id).value;
        			
        			// neu btn do ma sai, thi hien thi mau do
        			var answerWrong = document.getElementById(btnClick);
        			answerWrong.style.color = "red";
        		
        			// neu content cua op1 == vs op_true, thi hien thi mau xanh
        			//@op1_8,@op1_9,@op1_10
        			if( document.getElementById("@op1_"+ res.id).name == res.op_true){
        				document.getElementById("@op1_"+ res.id).style.color = "green";
        			}
        			if( document.getElementById("@op2_"+ res.id).name == res.op_true){
        				document.getElementById("@op2_"+ res.id).style.color = "green";
        			}
        			if( document.getElementById("@op3_"+ res.id).name == res.op_true){
        				document.getElementById("@op3_"+ res.id).style.color = "green";
        			}
        			if( document.getElementById("@op4_"+ res.id).name == res.op_true){
        				document.getElementById("@op4_"+ res.id).style.color = "green";
        			}
        		}
        		
    	        
    	        	
    	        		//disable cac btn
    	        		document.getElementById("@op1_"+ res.id).disabled = true;	
    	        		document.getElementById("@op2_"+ res.id).disabled = true;	
    	        		document.getElementById("@op3_"+ res.id).disabled = true;	
    	        		document.getElementById("@op4_"+ res.id).disabled = true;	
    	        	
    	        	//	console.log(document.getElementById("@input_"+x[i].value).value);
    	        		
    	        		
    	        		
    	        		
    	        		
    	        		     		
    	        	
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