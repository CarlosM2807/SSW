<%@page import="Controler.UserDB"%>
<%@page import="Containers.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-16">
<title>Configuración</title>
<link rel="stylesheet" type="text/css" href="estilos.css">  </head>
</head>
<body>
	<!-- elementos barra horizontal loko-->
	<nav class="navbar">
		<span class="navbar-toggle" id="js-navbar-toggle">
				<i class="fas fa-bars"></i>
		</span>
	<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="resumen.jsp">INICIO</a>
			<a href="ingresarMov.jsp">AÑADIR MOVIMIENTO</a>
			<a href="plan_ahorro.html">PLAN AHORROS</a>
			<a href="listasPlanAhorrojsp.jsp">LISTA PLANES</a>
			<a href="modificar_perfil.jsp">TU PERFIL</a>
			<div class="contenedor-div"></div>
				<a class="contacto" href="descripcion.html">CONTÁCTANOS</a>
				<a class="fotos" href="https://www.instagram.com/cash_saving_uva/"><img id = "imgIns" src="imagenes/instagram.png" </img></a>
				<a class="fotos2" href="https://twitter.com/CashSaving1"><img  id = "imgTw" src="imagenes/twitter.png"</img></a>
				<a class="fotos3" href="#"><img  id = "imgTel" src="imagenes/telefono.png"</img></a>
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
	<!-- elementos cuadro-->
	<div class="container">
        <div class="leftbox">
          <nav>
            <a href="modificar_perfil.jsp" id="profile" class="active"><img src="imagenes/usuario2.png" class="active2"></img></a>
            <a href="datos_economicos.jsp" id="payment" class="active"><img src="imagenes/tarjeta.png" class="active2" ></img></a>
            <a href="checklist.jsp" id="privacy" class="active"><img src="imagenes/check.png" class="active2" ></img></a>
            <a href="ajustes.jsp" id="settings" class="activeA"><img src="imagenes/engranaje.png" class="active2" ></img></a>
          </nav>
        </div>
        

	<%
            User usuario = UserDB.selectUser((String)session.getAttribute("id"));
        %>
        <div class="rightbox">
            <form action="ComentarioServlet" method="post">
                <div class="profile">
                    <h1>Ajustes</h1>
                    <h2>Elija el tipo de divisa</h2>
                    <%
                        if(usuario.getDivisa().equals("Euro")){
                    %>
                    <select name="select">
                        <option value="Euro" selected>Euro</option>
                        <option value="Dolar">Dolar</option>
                        <option value="Libra">Libra</option>
                    </select>
                    <%
                        }else if(usuario.getDivisa().equals("Dolar")){
                    %>
                    <select name="select">
                        <option value="Euro">Euro</option>
                        <option value="Dolar" selected>Dolar</option>
                        <option value="Libra">Libra</option>
                    </select>
                    <%
                        }else{
                    %>
                    <select name="select">
                        <option value="Euro">Euro</option>
                        <option value="Dolar">Dolar</option>
                        <option value="Libra" selected>Libra</option>
                    </select>
                    <%
                        }
                    %>
                    <h2>Caja de comentarios y sugerencias</h2>
                    <textarea name="comentario" rows="5" cols="50" id="comentario"></textarea>
                </div>
                <div>
                    <input type="submit" value="Guardar y Salir" id="CTA">
                </div>
            </form>
      </div>
</body>
<!-- script menú lateral -->
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
</script>
</html>
