<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">

#page-wrap {
    overflow: hidden;
    background-color: #fff;
}
.top-nav {
    position: fixed;
    display: table;
    top: 0;
    left: 0;
    width: 100%;
    background-color: #fff;
    z-index: 99999;
    
};
.top-nav-list {
    position: relative;
    display: inline-block;
    float: right;
    font-size: 0;
    margin: 0;
    padding: 0;
    list-style: none;
}
li {
    color: #666;
};
.top-nav-list>li {
    text-align: center;
    display: inline-block;
};

.top-nav-list>li>a {
    position: relative;
    display: table-cell;
    font-family: Lato,sans-serif;
    font-size: 14px;
    color: #666;
    background-color: #eee;
    padding: 0 10px;
    line-height: 40px;
    min-width: 60px;
    z-index: 999;
    border-left: 1px solid #d4d4d4;
    -webkit-transition: all .3s ease 0s;
    -moz-transition: all .3s ease 0s;
    -ms-transition: all .3s ease 0s;
    -o-transition: all .3s ease 0s;
    transition: all .3s ease 0s;
};
</style>
</head>
<body id="page-top" onload="f1()">
	<div class="top-nav">
		<input id="min" type="hidden" value="${min}"> <input id="sec"
			type="hidden" value="${sec}">

		<div id="showtime"></div>
		<ul class="top-nav-list"
			>
			<li><a class="finish-all" ><i
					class="icon md-arrow-right"></i> <b>FINISH ALL</b></a></li>
			<li><a
				><b id="countdown">00:00</b></a></li>
			<li><a href="dfd"
				><b >Thoát</b></a></li>	

			
		</ul>
	</div>


	<script
		src="<c:url value="/resources/Client/JS/jquery-3.2.1.min.js" />"></script>
	<script type="text/javascript">
		
            console.log("cccc");
			var tim;

			var min = document.getElementById("min").value;
			
			var sec = document.getElementById("sec").value;
			  console.log("cccc min"+min);
			var f = new Date();
			function f1() {
				f2();
				

			}
			function f2() {
				if (parseInt(sec) > 0) {
					sec = parseInt(sec) - 1;
					document.getElementById("countdown").innerHTML =  min + "p : " + sec + "s";
					
					document.getElementById("min").value = min;
					document.getElementById("sec").value = sec;
					tim = setTimeout("f2()", 1000);
				} else {
					if (parseInt(sec) == 0) {
						min = parseInt(min) - 1;
						if (parseInt(min) == 0) {
							clearTimeout(tim);
							location.href = "default5.aspx";
						} else {
							sec = 60;
							document.getElementById("countdown").innerHTML = "Your Left Time  is :"
									+ min + " Minutes ," + sec + " Seconds";
							tim = setTimeout("f2()", 1000);
						}
					}

				}
			}
	
	</script>

</body>
</html>