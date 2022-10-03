<%@page import="Controler.UserDB"%>
<%@page import="Containers.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta charset="utf-16">
<title>Check Configuracion</title>
<link rel="stylesheet" type="text/css" href="estilos.css">  </head>
</head>
<body>
	<!-- elementos barra horizontal cosas-->
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
	<!-- elemenntos cuadro-->
	  <div class="container">
        
        <div class="leftbox">
          <nav>
            <a href="modificar_perfil.jsp" id="profile" class="active"><img src="imagenes/usuario2.png" class="active2"></img></a>
            <a href="datos_economicos.jsp" id="payment" class="active"><img src="imagenes/tarjeta.png" class="active2" ></img></a>
            <a href="checklist.jsp" id="privacy" class="activeA"><img src="imagenes/check.png" class="active2" ></img></a>
            <a href="ajustes.jsp" id="settings" class="active"><img src="imagenes/engranaje.png" class="active2" ></img></a>
          </nav>
        </div>
        <%
            User usuario = UserDB.selectUser((String)session.getAttribute("id"));
        %>        
      <div class="rightbox">
        <form action="ModificarPermisosServlet" method="post">
          <div class="profile">
            <h1>Permisos</h1>
            <h2>Correos de gestión de sus finanzas</h2>
            <%
                if(usuario.getPermisoGestionCorreo() == 1){
            %>
                <input class="controls" name="correo" type="radio" id="Si1" name="correo" value="Si" checked>
                <label class="etiquetaCues" for="Si1">Si</label>
                <input class="controls" name="correo" type="radio" id="No1" name="correo" value="No">
                <label class="etiquetaCues" for="No1">No</label>
            <%
                }else{
            %>
                <input class="controls" name="correo" type="radio" id="Si1" name="correo" value="Si">
                <label class="etiquetaCues" for="Si1">Si</label>
                <input class="controls" name="correo" type="radio" id="No1" name="correo" value="No" checked>
                <label class="etiquetaCues" for="No1">No</label>
            <%
                }
            %> 
            <h2>Correos de aplicaciones relacionadas</h2>
            <%
                if(usuario.getPermisoAppRelacionadas() == 1){
            %>
                <input class="controls" name="app" type="radio" id="Si2" name="apps" value="Si"checked>
                <label class="etiquetaCues" for="Si2">Si</label>
                <input class="controls" name="app" type="radio" id="No2" name="apps" value="No">
                <label class="etiquetaCues" for="No2">No</label>
            <%
                }else{
            %>
                <input class="controls" name="app" type="radio" id="Si2" name="apps" value="Si">
                <label class="etiquetaCues" for="Si2">Si</label>
                <input class="controls" name="app" type="radio" id="No2" name="apps" value="No" checked>
                <label class="etiquetaCues" for="No2">No</label>
            <%
                }
            %> 
            <h2>Permitir anuncios personalizados</h2>
            <%
                if(usuario.getPermisoAnuncios() == 1){
            %>
                <input class="controls" name="anuncio" type="radio" id="Si3" name="anuncios" value="Si" checked>
                <label class="etiquetaCues" for="Si3">Si</label>
                <input class="controls" name="anuncio" type="radio" id="No3" name="anuncios" value="No">
                <label class="etiquetaCues" for="No3" style="color: black;">No</label>
            <%
                }else{
            %>
                <input class="controls" name="anuncio" type="radio" id="Si3" name="anuncios" value="Si">
                <label class="etiquetaCues" for="Si3">Si</label>
                <input class="controls" name="anuncio" type="radio" id="No3" name="anuncios" value="No" checked>
                <label class="etiquetaCues" for="No3" style="color: black;">No</label>
            <%
                }
            %> 
            <h2>¿Recomendaria la aplicacion a un conocido? </h2>
            <%
                if(usuario.getRecomendado() == 1){
            %>
                <input class="controls" name="recomendado" type="radio" id="Si4" name="recom" value="Si" checked>
                <label class="etiquetaCues" for="Si4">Si</label>
                <input class="controls" name="recomendado" type="radio" id="No4" name="recom" value="No">
                <label class="etiquetaCues" for="No4">No</label>
            <%
                }else{
            %>
                <input class="controls" name="recomendado" type="radio" id="Si4" name="recom" value="Si">
                <label class="etiquetaCues" for="Si4">Si</label>
                <input class="controls" name="recomendado" type="radio" id="No4" name="recom" value="No" checked>
                <label class="etiquetaCues" for="No4">No</label>
            <%
                }
            %> 
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
