<%@page import = "java.sql.*"%>
<%@page import="Controler.MovimientoDB"%>
<%@page contentType = "text/html" pageEncoding = "UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-16">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Añadir Movimiento</title>
 <%       String colores = "";
%>
        <link rel="stylesheet" type="text/css" href="estilos.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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
                <a class="fotos" href="https://www.instagram.com/cash_saving_uva/"><img id="imgIns" src="imagenes/instagram.png"/></a>
                <a class="fotos2" href="https://twitter.com/CashSaving1"><img id="imgTw" src="imagenes/twitter.png"/></a>
                <a class="fotos3" href="#"><img id="imgTel" src="imagenes/telefono.png"/></a>
            </div>
            <div id="main" style="margin-left: 0px;">
                <span id="button" style="font-size: 30px; cursor: pointer; color: white; display: block;" onclick="openNav()">☰ </span>
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
                    <a href="login.html" class="nav-link"><img  id = "imgUsuario" src="imagenes/usuario.png"/></a>
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
        <!-- Gráficos -->
        <div id="restoPag">
            <div class="container-b">
                <h2 id="font">AÑADE UN NUEVO MOVIMIENTO</h2>
                

                <div id="form-box">
                    <form id="formularioTransacciones" action="MovimientoServlet" method="post">
                        <div>
                            <span>Tipo pago:</span> 
                            <select name="type">
                                <option value="Tarjeta">Tarjeta</option>
                                <option value="Efectivo">Efectivo</option>
                                <option value="Bizum">Bizum</option>
                                <option value="Otro">Otro</option>
                            </select>
                        </div>

                        <div>
                            <span>Concepto:</span> <input type="text" name="concept" placeholder="Concepto del gasto" required pattern="[a-zA-Z0-9]+">
                        </div>

                        <div>
                            <span>Fecha:</span> <input type="date" name="date" placeholder="Fecha gasto" required>
                        </div>

                        <div>
                            <span>Cantidad:</span> <input type="number" name="amount" placeholder="Cantidad" step="any" required pattern="[+]?([0-9]+([.][0-9]*)?|[.][0-9]+)">
                        </div>
                        <input type="submit" id="botonacciona" value="AÑADIR" />
                    </form>



                </div>        
                <div class="tablaDelimita">
                    <table id="tablamov">
                        <tr>
                            <th>TIPO PAGO</th>
                            <th>CONCEPTO</th>
                            <th>FECHA</th>
                            <th>CANTIDAD</th>
                        </tr>
                        <%     
                    String cod = (String)session.getAttribute("id");
                    ResultSet rs = MovimientoDB.selectMovimientos((String)session.getAttribute("id"));
                       
                        System.out.println(cod);
                        while(rs.next()){
                    
                            if(rs.getFloat("cantidad") > 0){
                                colores = "green";
                            }else{
                                colores = "red";
                            }
                    %>
                            <tr>
                            <td><%= rs.getString(3)%></td>
                            <td><%= rs.getString(4)%></td>
                            <td><%= rs.getString(5)%></td>
                            <td style="color: <%= colores%>"><%= rs.getFloat("cantidad")%></td>
                    
                    <%
                        }
%>

                </table>
                </div>

            </div>
        </div>

    </body>
    
    <script>
        const formulario = document.getElementById("formularioTransacciones");
        
        
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
            document.getElementById("button").style.display = "none";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
            document.getElementById("button").style.display = "block";
        }


    </script>
</html>