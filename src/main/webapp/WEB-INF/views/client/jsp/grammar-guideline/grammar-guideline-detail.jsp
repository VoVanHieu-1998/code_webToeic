<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Grammar guideline detail</title>
</head>
<body>
	<!-- modal -->
	<div class="modal fade" id="popup_cmt_form" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thông tin người
						gửi</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="comment-form" name="form-comment"
						action="${pageContext.request.contextPath}/comment/add"
						method="post" name="commentForm">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Họ
								tên(bắt buộc):</label> <input type="text" class="form-control"
								id="recipient-name" name="name">
							<p id="errHoten" style="color: red;"></p>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Số điện
								thoại:</label> <input type="number" class="form-control"
								id="message-text" name="sdt">


							<p id="errSdt" style="color: red;"></p>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Email(để
								nhận phản hồi qua email):</label> <input type="email"
								class="form-control" id="message-text" name="email">

							<p id="errEmail" style="color: red;"></p>
						</div>
						<input type="hidden" name="grammarId"
							value="${grammarGuideline.id}" id="productId_cmt"> <input
							type="hidden" name="cmtContent" id="lastCmtContent" value="">

						<p id="errCmt" style="color: red;"></p>
						<p id="errProduct" style="color: red;"></p>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Send
								Comment</button>
						</div>
					</form>
					<hr />
					<div id="errorMsg">${error}</div>
				</div>



			</div>
		</div>
	</div>

	<!-- modal -->
	<div class="modal fade" id="popup_cmt_form_reply" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thông tin người
						gửi</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="reply-form" name="form-comment"
						action="${pageContext.request.contextPath}/reply/add"
						method="post" name="commentForm">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Họ
								tên(bắt buộc):</label> <input type="text" class="form-control"
								id="recipient-name" name="name">
							<p id="errHotenReply" style="color: red;"></p>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Số điện
								thoại:</label>
							<textarea class="form-control" id="message-text" name="sdt"></textarea>


							<input type="number" class="form-control" id="message-text"
								name="sdt">

							<p id="errSdtReply" style="color: red;"></p>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Email(để
								nhận phản hồi qua email):</label> <input type="email"
								class="form-control" id="message-text" name="email">

							<p id="errEmailReply" style="color: red;"></p>
						</div>
						<input type="hidden" name="commentId" value="" id="commentId">

						<input type="hidden" name="replyContent" id="lastReplyContent"
							value="">

						<p id="errReply" style="color: red;"></p>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Send
								Comment</button>
						</div>
					</form>
					<hr />
					<div id="errorMsg">${error}</div>
				</div>



			</div>
		</div>
	</div>

	<div class="features">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div>
						<h3>${grammarGuideline.name}</h3>

					</div>
				</div>

			</div>

			<hr>

			<div class="row">
				<div class="col-12 row" style="margin-top: 3vh">
					<div class="container bg-light border"
						style="border-radius: 10px; padding: 3vh">
						<div>${grammarGuideline.content}</div>

					</div>

					<div class="container">
						<h3 style="text-align: center; margin-top: 15px;">Hỏi và đáp</h3>
					</div>

					<div class="col col-12">
						<div class="">
							<h6>Hỏi và đáp</h6>



							<div style="width: 100%; font-size: 20px;">
								<div class="f-left form-add"
									style="border: 1px solid #dadada; border-radius: 5px !important;">

								</div>




								<!-- form -->
								<div class="main_form"
									style="display: block; width: 100%; height: 100%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px; -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s; -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s; transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;">

									<textarea class="form-control" name="detail"
										style="overflow: auto; border: none; border-radius: 5px; padding: 10px !important;"
										id="review_field" cols="5" rows="5"
										placeholder="Xin mời để lại câu hỏi, Chúng tôi sẽ trả lời trong 1h từ 8h sáng - 22h tối mỗi ngày."></textarea>

									<div class="f-left user_action_wrap"
										style="border-top: 1px solid #dadada; padding: 10px 5px;">

										<div class="cmt_right" style="float: right;">
											<a data-toggle="modal" data-target="#popup_cmt_form"
												style="padding: 5px 25px; height: 20px; font-size: 14px; color: #fff; text-transform: uppercase; border: 1px solid #e11b1e; border-radius: 4px; background: #e11b1e; margin: 0;"
												class="button" href="javascript:void(0)" id="btnSendCmt"
												onclick="sendCmt();">Gửi</a>
										</div>
									</div>
								</div>

								<!-- /form -->

								<ul style="padding: 0 !important; list-style: none;"
									data-index="1" data-load="0" data-count="">

									<c:forEach items="${comments }" var="c">
										<li
											style="margin-top: 10px; list-style-type: none; width: 100%; float: left !important;">
											<div>
												<a style="color: #d70018; text-decoration: none;"
													href="javascript:void(0)">
													<div
														style="float: left; width: 25px; height: 25px; background: #ddd; margin-right: 7px; text-align: center; color: #666; text-transform: uppercase; font-size: 12px; line-height: 26px; font-weight: 600; text-shadow: 1px 1px 0 rgba(255, 255, 255, .2);">H</div>
													<strong
													style="float: left; overflow: hidden; line-height: 22px; margin-top: 2px; text-transform: capitalize; font-size: 14px; color: #000;">Hoang
														${c.name }</strong>
												</a>
											</div>

											<div class="question"
												style="display: block; overflow: hidden; position: relative; margin: 0; font-size: 13px; color: #333; line-height: 24px; clear: both; float: none; width: auto; padding: 10px 0 10px 30px;">
												<p style="font-size: 20px;">${c.content }</p>
											</div>

											<div class="actionuser"
												style="display: block; height: 34px; position: relative; margin: -5px 10px 0 0; font-size: 14px; color: #333; line-height: 24px; margin-bottom: 6px; padding-left: 25px;">
												<a href="javascript:void(0)" class="respondent"
													style="float: left; font-size: 13px; padding: 5px; color: #d70018; text-decoration: none;"
													onclick="reply(${c.commentId})"> <i
													style="display: inline-block; font: normal normal normal 14px/1 FontAwesome; font-size: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased;"
													class="fa fa-commenting" aria-hidden="true"></i> Trả lời
												</a><a
													style="float: left; padding: 5px 0; font-size: 13px; text-decoration: none; color: #999; position: relative;"
													href="javascript:void(0)" class="time">| 2 tiếng trước</a>
											</div> <c:forEach items="${c.replies }" var="r">
												<div class="reply_list"
													style="position: relative; background: #eee; margin-bottom: 10px; width: calc(100% - 30px); float: right; border: 1px solid #dadada; border-radius: 5px; padding: 15px 15px 0;">
													<span
														style="width: 100%; position: absolute; z-index: 2; top: -18px; color: #eee; text-align: left; left: 8px;">
														<font
														style="position: absolute; top: 2px; left: 0; z-index: 1;"
														class="fa fa-caret-up fa-2x"></font><font
														style="color: #dadada; position: absolute; top: 1px; left: 0; z-index: 0;"
														class="fa fa-caret-up fa-2x"></font>
													</span>
													<div
														style="display: block; position: relative; clear: both; font-size: 14px; color: #333; line-height: 24px; padding: 0;"
														class="cmt_item rep_item" id="" "item_461652"="">
														<div class="rowuser">
															<c:choose>
																<c:when test="${r.user_reply != null }">
																	<a
																		style="float: left; font-size: 13px; padding: 5px; color: #d70018; text-decoration: none;"
																		href="javascript:void(0)"><div class="cmt_admin"></div>
																		<strong> ${r.user_reply.name }</strong></a>
																	<b class="qtv"
																		style="background: #e11b1e; border-radius: 2px; padding: 0 5px; line-height: normal; border: 1px solid #e11b1e; font-size: 11px; color: #fff; font-weight: 400; display: inline-block; margin: 5px 0 0 10px;">QTV</b>


																</c:when>
																<c:otherwise>
																	<a
																		style="float: left; font-size: 13px; padding: 5px; color: #d70018; text-decoration: none;"
																		href="javascript:void(0)"><div class="cmt_admin"></div>
																		<strong> ${r.name }</strong></a>


																</c:otherwise>
															</c:choose>

														</div>
														<div class="question"
															style="display: block; overflow: hidden; position: relative; margin: 0; font-size: 13px; color: #333; line-height: 24px; clear: both; float: none; width: auto; padding: 10px 0 10px 30px;">
															${r.content} <br>
														</div>
														<div class="actionuser"
															style="display: block; height: 34px; position: relative; margin: -5px 10px 0 0; font-size: 14px; color: #333; line-height: 24px; margin-bottom: 6px; padding-left: 25px;">
															<a href="javascript:void(0)" class="respondent"
																style="float: left; font-size: 13px; padding: 5px; color: #d70018; text-decoration: none;"
																onclick="reply(${c.commentId})"> <i
																style="display: inline-block; font: normal normal normal 14px/1 FontAwesome; font-size: inherit; text-rendering: auto; -webkit-font-smoothing: antialiased;"
																class="fa fa-commenting" aria-hidden="true"></i> Trả lời
															</a><a
																style="float: left; padding: 5px 0; font-size: 13px; text-decoration: none; color: #999; position: relative;"
																href="javascript:void(0)" class="time">| 2 tiếng
																trước</a>
														</div>
													</div>
												</div>
											</c:forEach> <br />
											<div class="f-left form-add" id="txt_cmt_${c.commentId }"
												style="border: 1px solid #dadada; display: none; border-radius: 5px !important;">
												<div class="main_form"
													style="display: block; width: 100%; height: 100%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px; -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s; -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s; transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;">

													<textarea class="form-control" name="detail"
														style="overflow: auto; border: none; border-radius: 5px; padding: 10px !important;"
														id="review_field_reply_${c.commentId }" cols="5" rows="5"
														placeholder="Xin mời để lại câu hỏi, Chúng tôi sẽ trả lời trong 1h từ 8h sáng - 22h tối mỗi ngày."></textarea>

													<div class="f-left user_action_wrap"
														style="border-top: 1px solid #dadada; padding: 10px 5px;">

														<div class="cmt_right" style="float: right;">
															<a data-toggle="modal"
																data-target="#popup_cmt_form_reply"
																style="padding: 5px 25px; height: 20px; font-size: 14px; color: #fff; text-transform: uppercase; border: 1px solid #e11b1e; border-radius: 4px; background: #e11b1e; margin: 0;"
																class="button" href="javascript:void(0)" id="btnSendCmt"
																onclick="sendReply();">Gửi</a>
														</div>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>

								</ul>


							</div>

						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="product__details__tab__desc"></div>
						</div>


					</div>
				</div>
			</div>

			<div>
				<button class="btn btn-default" style="color: white; !importance">
					<a href="<c:url value="/grammar-guideline/2"/>">Quay lại</a>
				</button>

			</div>

		</div>


	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

	<script type="text/javascript">
	function sendCmt(){
        var lastCmtContent = document.getElementById("lastCmtContent");
        var productId = document.getElementById("productId_cmt");
        lastCmtContent.value = document.getElementById("review_field").value ;
        console.log(lastCmtContent.value);
        console.log(productId.value);
    }

    function sendReply(){

        var lastReplyContent = document.getElementById("lastReplyContent");

        lastReplyContent.value = document.getElementById("review_field_reply_"+document.getElementById("commentId").value).value ;
        console.log("mandfjsdklfjsdlkfjsdlkf"+lastReplyContent.value);
        console.log("mand comment id"+ document.getElementById("commentId").value);

    }

    function reply(idCmt){


        document.getElementById("commentId").value = idCmt;
        console.log("dfsdf"+document.getElementById("commentId").value);
        document.getElementById("txt_cmt_"+idCmt).style.display="block";
    }
//khi comment form submit
    $('#comment-form').on('submit', function(event){

        var self = this;
        var form = $(this);


     /*    if (form.data('requestRunning')) {
            return;
        }

        form.data('requestRunning', true); */
        event.preventDefault();

        $.ajax({
            url: form.attr("action"),
            type: form.attr("method"),
            data: form.serialize(),
            success: function(res){
                console.log(res);
                if(res){
                    if(res.status == "FAIL"){
                        for(var i = 0;i<res.result.length;i++){
                            if(res.result[i].code == "cmtContent"){


                                var cmt = document.getElementById("errCmt");
                                cmt.innerHTML= res.result[i].defaultMessage;
                           

                            }
                            if(res.result[i].field == "name"){
                                errName.html = res.result[i].code;
                                console.log(res.result[i].code);

                                var name = document.getElementById("errHoten");
                                name.innerHTML= res.result[i].code;
                            }

                            if(res.result[i].field == "email"){


                                var email = document.getElementById("errEmail");
                                email.innerHTML= res.result[i].code;
                            }


                        }
                    }
                    else{
                        location.reload();
                    }

                }

            }

        });

    });


    $('#reply-form').on('submit', function(event){

        var self = this;
        var form = $(this);


        /* if (form.data('requestRunning')) {
            return;
        }

        form.data('requestRunning', true); */
        //ngăn không cho mở liên kết url
        event.preventDefault();

        $.ajax({
            url: form.attr("action"),
            type: form.attr("method"),
            data: form.serialize(),
            success: function(res){
                console.log(res);
                if(res){
                    if(res.status == "FAIL"){
                        for(var i = 0;i<res.result.length;i++){
                            if(res.result[i].code == "replyContent"){

                                var cmt = document.getElementById("errReply");
                                cmt.innerHTML= res.result[i].defaultMessage;

                            }

                            if(res.result[i].field == "name"){


                                var name = document.getElementById("errHotenReply");
                                name.innerHTML= res.result[i].code;
                            }

                            if(res.result[i].field == "email"){


                                var email = document.getElementById("errEmailReply");
                                email.innerHTML= res.result[i].code;
                            }


                        }
                    }
                    else{
                        location.reload();
                    }

                }

            }

        });

    });
	</script>
</body>
</html>