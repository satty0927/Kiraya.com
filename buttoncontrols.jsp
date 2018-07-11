<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
		function change(){
			
			if(document.getElementById("btn1").value=="aa"){
				document.getElementById("btn1").onclick=function() {bb()};
				document.getElementById("btn1").value="bb";
				}
			else{
				document.getElementById("btn1").onclick=function() {aa()};
				document.getElementById("btn1").value="aa";
			}
			
			
		}
		function bb(){
			
			document.getElementById("view").innerHTML="bb";
			
		}
		function aa(){
			document.getElementById("view").innerHTML="aa";
			
		}
	</script>
</head>

<body>
	<input type="button" value="aa" style="float:left" onclick="aa()" id="btn1">
	<input type="button" value="change" style="float:right" onclick=change()>
	<label id="view"></label>
</body>
</html>