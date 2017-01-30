<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Todolist</title>
</head>
<body>
	<!-- J'ai choisi de faire sous forme de tableau pour que l'affichage soit plus uniforme -->
	<table style=" border-collapse:collapse">
		<!-- Pour chaque tâche, on affiche le nom, le statut, et le bouton pour la terminer -->
	 	<c:forEach items="${tasks}" var="task">
		 	<tr>
		     	<td style="border:1px solid black">
		     		${task.name} 
		     	</td>
		     	<td style="border:1px solid black">
		     	    ${task.status.name}
		     	</td>
		     	<td style="border:1px solid black">
			     	<a href="/todolist-presentation/terminate/${task.id}">Terminer la tâche</a>
				</td>
		    </tr>
		 </c:forEach>
	</table>
</body>
</html>