<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Question Vocabulary</title>
<style type="text/css">
	.btn-question{
		color: green;
	}

</style>
</head>
<body>


	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div>
						<h3>Luyện tập Từ vựng</h3><br/>
						<h4>Hãy trả lời nghĩa của từ vựng trên:</h4>
					</div>
				</div>

			</div>
			<hr>

			<div class="row">
				<div class="col-9 row" style="margin-top: 1vh">
					<div class="container bg-light border"
						style="border-radius: 10px; ">


						<div class="row">
							

						</div>
						<div id="explan" style="color: red;"></div>
						<div class="row">
							<h2 id="ketqua" value-name="${vocabularycontent.question }" style="margin: auto; color: red">${vocabularycontent.getNamevocabularycontent() }</h2>
						</div>

						<hr />



						<div class="question">

							<c:forEach items="${setquestion}" var="q" varStatus="loop">

								
								<div class="row answers" id="showCheck">


									<div class="row col-md-6" style="margin: auto;">
										<button id="btn-click_${loop.index}" value-name="${q.mean_content}" class="col btn-de btn-check "
											
											style=" border: solid; border-radius: 5px; height: 70px; width: 300px; margin: 1vh; text-align: center;float: left;"
											  type="button" 
                                                         onclick="setInput(${loop.index})">${q.mean_content}
										</button>
									</div>
									<br>
								</div>
							</c:forEach>

							<button id="btn-deteteProductCart" class="btn btn-success"
                                                        data-toggle="modal" 
                                                        data-target="#exampleModal1">Xem kết quả
                             </button>
								
								<button class="btn btn-danger"><a href="<c:url value="/vocabularycontent/${1}"/>">Thoát</a></button>
								<button style="float: right;"  type="button" class="btn btn-secondary btn-next" data-dismiss="modal" id="btn-next">Next</button>
								<input type="hidden" id="tenVocabulary" value="${vocabularycontent.getNamevocabularycontent() }"/>
								<input type="hidden" id="dichVocabulary" value="${vocabularycontent.getMean() }"/>
								<input type="hidden" id="nghiaVocabulary" value="${vocabularycontent.getQuestion() }"/>
								
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
							<a href="<c:url value="/vocabulary/list/"></c:url>">Vocabulary</a>
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
<div class="delete-product">
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 style="color: #FF3399;" class="modal-title" id="exampleModalLabel" value-id="${vocabularycontent.idvocabularycontent }">Thông tin từ vựng</h5><br/>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div  class="modal-body">
                	<h5 style="color: #cc043c" class="modal-title" id="exampleModalLabel">Tên từ vựng:${vocabularycontent.getNamevocabularycontent() }</h5><br/>
                    <h5 style="color: #336666" class="modal-title" id="exampleModalLabel">${vocabularycontent.getMean() }</h5><br/>
                     <h5 style="color: #336666" class="modal-title" id="exampleModalLabel">Nghĩa của từ vựng trên là: <span style="color: red"">${vocabularycontent.getQuestion() }</span></h5><br/>
               
               <audio controls="controls"
										style=" margin-left: 50px;">
										<source src="<c:url value='/resources/Client/vocabularyline/contentvocabulary/${ vocabularycontent.getAudiomp3()}' />" type="audio/mpeg">
				</audio>
				<br/>
				<h3 style="color: red" class="modal-title" id="exampleModalLabel">Bạn đã trả lời đúng  </h3>
				<img style="width: 64px; height: 64px; margin-left: 200px;" alt="hinh"
										src="<c:url value='/resources/Client/vocabularyline/happy.png' />" />
                </div>
                <div class="modal-footer">
                	<button  type="button" class="btn btn-primary btn-next" data-dismiss="modal" id="btn-next">Next</button>
                	
                    <button  type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    
                    
                   
                </div>

            </div>
        </div>
    </div>
</div>
<div class="delete-product">
    <!-- Modal -->
    <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 style="color: #FF3399;" class="modal-title" id="exampleModalLabel" value-id="${vocabularycontent.idvocabularycontent }">Thông tin từ vựng</h5><br/>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div  class="modal-body">
               		<h5 style="color: #cc043c" class="modal-title" id="ten"></h5><br/>
                    <h5 style="color: #336666" class="modal-title" id="dich"></h5><br/>
                    <h5 style="color: #336666" class="modal-title" id="nghia"></h5><br/>
               
               
               <audio controls="controls"
										style=" margin-left: 50px;">
										<source src="<c:url value='/resources/Client/vocabularyline/contentvocabulary/${ vocabularycontent.getAudiomp3()}' />" type="audio/mpeg">
				</audio>
				<br/>
				
				<p  style="color: red;" id="txtKetQua">Bạn chưa chọn đáp án!</p>
                </div>
                <div class="modal-footer">
                	
                	
                    <button  type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    
                    
                   
                </div>

            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(".btn-next").click(function () {
	var a=$("#exampleModalLabel").attr("value-id");/* Chuổi */
	var sum = parseInt(a) +1;
	if(sum<32){
		duongDanHienTai=window.location.href; 
		duongDan = duongDanHienTai.replace(a,sum);
		window.location = duongDan;
		
	}else{
		duongDanHienTai=window.location.href; 
		duongDan = duongDanHienTai.replace(a,23);
		window.location = duongDan; 
	}

});

function setInput(id){
	var remain = new Array();
	var ketqua=$("#ketqua").attr("value-name");
	
	for (var i =0;i<4;i++){
		if(i==id){
			continue;
		}
		remain.push(i);
	}
	var count=0;
	var name=$("#btn-click_"+id).attr("value-name");
	
	var ten=document.getElementById("tenVocabulary").value
	var dich=document.getElementById("dichVocabulary").value
	var nghia=document.getElementById("nghiaVocabulary").value
	
	if(ketqua===name){
		document.getElementById("btn-click_"+id).style.color = "#00CC00";
		 $("#exampleModal").modal();
		 var cmt = document.getElementById("txtKetQua");
         cmt.innerHTML= "Chúc mừng bạn đã trả lời đúng!";
		 
	}else{
		document.getElementById("btn-click_"+id).style.color = "red";
		
		var cmt = document.getElementById("ten");
        cmt.innerHTML="Tên từ vựng :"+ten;
        
        var cmt = document.getElementById("dich");
        cmt.innerHTML="Tra nghĩa của từ trên :" +dich;
        
        var cmt = document.getElementById("nghia");
        cmt.innerHTML= "Đáp án của câu trên là :"+ nghia;

		 var cmt = document.getElementById("txtKetQua");
         cmt.innerHTML= "Bạn đã trả lời sai!";
         console.log(cmt);
	}

	for (var i =0;i<3;i++){
		console.log("btn-click_"+remain[i]);
		document.getElementById("btn-click_"+remain[i]).style.color = "black";
	}
	
};


</script>
</body>

</html>