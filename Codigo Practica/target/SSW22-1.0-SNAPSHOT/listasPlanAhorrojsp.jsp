<%@page import = "java.sql.*"%>
<%@page import="Controler.claseAhorroDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-16">
<title>Listado Planes Ahorro</title>
<link rel="stylesheet" type="text/css" href="estilos.css">
</head>
<body>
	<!-- Elementos de la barra lateral -->
	<nav class="navbar">
		<span class="navbar-toggle" id="js-navbar-toggle">
				<i class="fas fa-bars"></i>
		</span>
	    <div id="mySidenav" class="sidenav">
		    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    		<a href="resumen.jsp">INICIO</a>
			<a href="ingresaMov.jsp">AÑADIR MOVIMIENTO</a>
    		<a href="plan_ahorro.html">PLAN AHORROS</a>
			<a href="listasPlanAhorrojsp.jsp">LISTA PLANES</a>
    		<a href="modificar_perfil.jsp">TU PERFIL</a>
    		<div class="contenedor-div"></div>
    			<a class="contacto" href="descripcion.html">CONTÁCTANOS</a>
    			<a class="fotos" href="https://www.instagram.com/cash_saving_uva/"><img id = "imgIns" src="imagenes/instagram.png" /></a>
    			<a class="fotos2" href="https://twitter.com/CashSaving1"><img  id = "imgTw" src="imagenes/twitter.png"/></a>
    			<a class="fotos3" href="#"><img  id = "imgTel" src="imagenes/telefono.png"/></a>
        	</div>
	    <div id="main">
	    	<span id="button" style="font-size:30px;cursor:pointer;color:white" onclick="openNav()">&#9776; </span>
	    </div>
        <p id="nombre">CASH SAVING</p>
    		<ul class="main-nav" id="js-menu">
    		  <li>
    			<a href="index.html" class="nav-links">Principal</a>
    		  </li>
    		  <li>
    			<a href="descripcion.html" class="nav-links">Contacto</a>
    		  </li>
    		  <li>
    			<a href="login.html" class="nav-link"><img  id = "imgUsuario" src="imagenes/usuario.png"</img></a>
    		  </li>
    		</ul>
    </nav>
	<hr id="raya">
	    <!-- Fondo dinamico-->
	<div class="area" >
		<ul class="circles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div >
	<!-- Cuadro de eleccion del plan de ahorro -->
    <div id="cajaLista" class="container2">
		<p id="tituloCaja">SUS PLANES DE AHORRO</p>
        <div class="row">
          <div class="col-sm-12">
      
            <div ng-app="todoApp">
              <div ng-controller="TodoListController as TodoListController">
      
                <div class="panel panel-default">
                  <!-- Default panel contents -->
      
                  <!-- Table -->
                  <div class="table-wrapper">
                    <table id="listaTabla" class="table2">
                      <thead>
                        <tr>
                          <th>Nº</th>
                          <th>Nombre</th>
                          <th>€/Dia</th>
                          <th>Editar</th>
                          <th>Borrar</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr id="row1" ng-repeat="todo in TodoListController.todos">
                      
                          <%        
                        int num = 0;
                        ResultSet rs = claseAhorroDB.sacaPlanLPA((String)request.getSession().getAttribute("id"));
                        while(rs.next()){
                        String cosas= rs.getString(1);
                            %> 
                        <form action="editarPlanAhorrojsp.jsp" method="post">
                          <th><%=num++%></th>
                     
                          <td id="country_row1"> <%= rs.getString(3) %> </td>
                          <input type="hidden" name ="idPlan" id ="idPlan" value ="<%=cosas%>">
                          <td id="age_row1"> <%= Math.round(((rs.getDouble(5)/rs.getInt(4))/30)*100.0)/100.0 %> </td>
                          <td>
                              
                              <input type="submit" id="edit_button1" value="Edit" class="edit"></input>       
                          </td>
                         </form>
                      <form method = "post" action="borramosPlanServlet">
                          <td>
                              <input type="hidden" name ="idPlan" id ="idPlan" value ="<%=cosas%>">
                              <button type="submit" name="Delete" id="Delete">
                                <img src="imagenes/borrar.png" width="30px" height="30px"/>
                            </button>
                          </td>
                      </form>
                        </tr>	
                        <%
                        } 
%>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
</body>
<script>
	
        function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
		document.getElementById("main").style.marginLeft = "250px";
		document.getElementById("button").style.display = "none";
	}
	
	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("main").style.marginLeft= "0";
		document.getElementById("button").style.display = "block";
	}
	
	function deleteRow(row)
{
    var i=row.parentNode.parentNode.rowIndex;
    document.getElementById('listaTabla').deleteRow(i);
}

function edit_row(no)
{
 document.getElementById("edit_button"+no).style.display="none";
 document.getElementById("save_button"+no).style.display="initial";
	
 var name=document.getElementById("name_row"+no);
 var country=document.getElementById("country_row"+no);
 var age=document.getElementById("age_row"+no);
	
 var name_data=name.innerHTML;
 var country_data=country.innerHTML;
 var age_data=age.innerHTML;
	
 name.innerHTML="<input  style=width:60px; type='text' id='name_text"+no+"' value='"+name_data+" '>";
 country.innerHTML="<input style=width:148.38px; type='text' id='country_text"+no+"' value='"+country_data+"'>";
 age.innerHTML="<input style=width:70.167px; type='text' id='age_text"+no+"' value='"+age_data+"'>";
}

function save_row(no)
{
 var name_val=document.getElementById("name_text"+no).value;
 var country_val=document.getElementById("country_text"+no).value;
 var age_val=document.getElementById("age_text"+no).value;

 document.getElementById("name_row"+no).innerHTML=name_val;
 document.getElementById("country_row"+no).innerHTML=country_val;
 document.getElementById("age_row"+no).innerHTML=age_val;

 document.getElementById("edit_button"+no).style.display="initial";
 document.getElementById("save_button"+no).style.display="none";
}

</script>
</html>