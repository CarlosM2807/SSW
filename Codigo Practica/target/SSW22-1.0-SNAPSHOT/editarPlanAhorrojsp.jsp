<%@page import="java.sql.*"%>
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

        <%
        
        String cod = request.getParameter("idPlan");
        request.getSession().setAttribute("idPlan", cod);
        ResultSet rs=claseAhorroDB.sacaPlanEPA(cod);
        if(rs.next()){
        
%>
        <center>
    <div id="cajaLista2" class="container3">
        <section class="form-register-c">
            <form method = "post" action="modificaAhorroServlet" >
		<p id="tituloCaja2">Editar Plan de Ahorro</p>
                <p id="textoCajaEdit"> Nombre</p>
                <input class="controls3" type="text" name="nombre" id="nombres" value="<%=rs.getString("nombre") %>" required pattern="[A-Za-z]+[[:space:][A-Za-z]]*" >
                <p id="textoCajaEdit"> Cantidad</p>
                <input class="controls3" type="Double" name="Cantidad" id="apellidos" value="<%=rs.getDouble("cantidad") %>" required pattern="[+]?([0-9]+([.][0-9]*)?|[.][0-9]+)">
                <p id="textoCajaEdit"> Meses</p>
                <input class="controls3" type="Int" name="meses" id="correo" value="<%= rs.getInt("mes") %>" required pattern="[0-9]+" >
                <div class="pos">
                    <input name= "Aceptar" type="submit" id="Aceptar" value="Aceptar" href="listasPlanAhorrojsp.jsp">
                    </form>
                <form method = "post" action="listasPlanAhorrojsp.jsp" >
                    <input name= "Cancelar" type="submit" id="Cancelar" value="Cancelar" >
                </form>
		</div>
        </section>
      </div>
        </center>
        <%  
            }
            
        %>
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