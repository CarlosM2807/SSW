<%-- 
    Document   : resumen
    Created on : 20-abr-2022, 18:15:58
    Author     : carlo
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controler.MovimientoDB"%>
<%@page import="Controler.UserDB"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-16">
<title>Resumen Economía</title>
<%
    String id = "";
    double cp = 0;
    String cp2 = "";
    int ntar = 0;
    int nbizum = 0;
    int notro = 0;
    int nefec = 0;
    double totaltar = 0;
    double totalbizum = 0;
    double totalotro = 0;
    double totalefec = 0;
    String colores = "";
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
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"> &times;</a>
        <a href="resumen.jsp">INICIO</a>
        <a href="ingresaMov.jsp">AÑADIR MOVIMIENTO</a>
        <a href="plan_ahorro.html">PLAN AHORROS</a>
        <a href="listasPlanAhorrojsp.jsp">LISTA PLANES</a>
        <a href="modificar_perfil.jsp">TU PERFIL</a>
        <div class="contenedor-div"></div>
            <a class="contacto" href="descripcion.html">CONTÁCTANOS</a>
            <a class="fotos" href="https://www.instagram.com/cash_saving_uva/"><img id="imgIns" src="imagenes/instagram.png" <="" img=""></a>
            <a class="fotos2" href="https://twitter.com/CashSaving1"><img id="imgTw" src="imagenes/twitter.png" <="" img=""></a>
            <a class="fotos3" href="#"><img id="imgTel" src="imagenes/telefono.png" <="" img=""></a>
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
              <a href="login.html" class="nav-link"><img  id = "imgUsuario" src="imagenes/usuario.png"</img></a>
            </li>
          </ul>
    </nav>
	<hr id="raya">
         <!-- Gráficos -->
    
	<div class="centerDiv">
	  	<canvas id="myChart" style="width:100%;max-width:600px;margin: top 3px"></canvas>
	</div>
    
        <%
                
                ResultSet resultSet = UserDB.sacaUsuarioRS((String)session.getAttribute("id"));
                while(resultSet.next()) {  
                double gasto = resultSet.getDouble("gasto_mensual");
                double ingreso = resultSet.getDouble("ingreso_mensual"); 
                System.out.println("gasto= "+gasto);
                System.out.println("ingreso= "+ingreso);
                double proporcion = (ingreso/gasto);
                String var;
                if (proporcion >= 1){
                    var ="green";
                    proporcion = (proporcion-1)*100;
                }else{
                    var = "red";
                    proporcion = (1-proporcion)*100;
                }
                System.out.println("PROPORCION= "+proporcion);
                System.out.println("COLOR= "+var);
                double porcen = Math.round(proporcion*100.0)/100.0;
        %>
        <div class="semi-donut" style="--percentage : <%=proporcion%>;--fill: <%=var%>;">
                   <%=porcen%>% 
            <br>
            Ing VS Gas
    </div>
                <!-- Tabla de transferencias -->
                
        <div class="c-section-card">
            <div class="c-section-card__header">
   
            </div>
        
            <div class="c-section-card__content">
                <!-- agregar graficos -->  
                <canvas id="bar-chart" style="width:100%;max-width:500px;margin: top 50px; height:275px" ></canvas>
            </div>
        </div>
                
        <div class="centerDiv4">
            <table class="tabla">
             <caption>TUS ÚLTIMOS MOVIMIENTOS</caption>
            <br>
            <tr>
                <th>Concepto</th>
                <th>Cantidad</th>
            </tr>
                  <%
                cp = Double.valueOf(resultSet.getDouble("ingreso_mensual"));
                }
                %>
                
                <%
                 
                
                ResultSet resultSet2 = MovimientoDB.selectMovimientosResumen((String)session.getAttribute("id"));
                while(resultSet2.next()) {
            %>
         
            <tr>
                <td><%=resultSet2.getString("concepto")%></td>
                <%
                    if(resultSet2.getFloat("cantidad") > 0){
                        colores = "green";
                    }else{
                        colores = "red";
                    }
                    %>
                <td style=" color: <%=colores%> "><%=resultSet2.getFloat("cantidad") %></td>
                
                 <% 
        
                if (resultSet2.getString("tipopago").equals("Tarjeta")){
                    ntar++;
                    if(resultSet2.getFloat("cantidad") < 0){
                        totaltar = totaltar +   Math.abs(resultSet2.getFloat("cantidad"));
                    }
                }
                if (resultSet2.getString("tipopago").equals("Bizum")){
                    nbizum++;
                    if(resultSet2.getFloat("cantidad") < 0){
                        totalbizum = totalbizum + Math.abs(resultSet2.getFloat("cantidad"));
                    }
                }
                if (resultSet2.getString("tipopago").equals("Efectivo")){
                    nefec++;
                    if(resultSet2.getFloat("cantidad") < 0){
                        totalefec = totalefec + Math.abs(resultSet2.getFloat("cantidad"));
                    }
                }
                if (resultSet2.getString("tipopago").equals("Otro")){
                    notro++;
                    if(resultSet2.getFloat("cantidad") < 0){
                        totalotro = totalotro + Math.abs(resultSet2.getFloat("cantidad"));
                    }
                }
                
                System.out.println(totaltar);
                System.out.println(totalbizum);
                System.out.println(totalefec);
                System.out.println(totalotro);
                %>
            </tr>
            <%           
                 cp2 = resultSet2.getString("tipopago");
                }
            %>
           
        </table> 
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
	
	var xValues = ["Efectivo", "Tarjeta", "Bizum", "Otros"];
        var valorEfec = "<%=nefec%>";
        var valorTarjeta = "<%=ntar%>";
        var valorBizum = "<%=nbizum%>";
        var valorOtro = "<%=notro%>";
        
        var totefe = "<%=(int)totalefec%>";
        var tottar = "<%=(int)totaltar%>";
        var totbiz = "<%=(int)totalbizum%>";
        var tototr = "<%=(int)totalotro%>";
       
        
    var yValues = [valorEfec,valorTarjeta,valorBizum,valorOtro];
    var barColors = [
    "#1792a4",
    "#44b4c4",
    "#a3d5d1",
    "#c8e5e3"
    ];

    new Chart("myChart", {
    type: "doughnut",
    data: {
        labels: xValues,
        datasets: [{
        backgroundColor: barColors,
        data: yValues
        }]
    },
    options: {
        legend: {
        display: true,
        align: 'center',
        position: 'bottom',
            labels: {
                padding: 20,
            }
        },
        title: {
        display: true,
        text: "DISTRIBUCION PAGOS (€)",
        fontSize: 20,
        }
    }
    });
      
    new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: xValues,
      datasets: [{
      backgroundColor: barColors,
      data: [totefe,tottar,totbiz,tototr]
      }]
    },
    options: {
        legend: {
        display: false,
        align: 'center',
        position: 'bottom',
            labels: {
                padding: 20,
            }
        },
        title: {
        display: true,
        text: "€ GASTADOS POR METODO PAGO",
        fontSize: 20,
        }
    }
});

</script>

</html>