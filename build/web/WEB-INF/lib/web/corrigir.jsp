<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var = "conexao" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/gerenciadordeatividades"
         user = "root"  password = ""/>
         
         <sql:query dataSource = "${conexao}" var = "result">
             SELECT * FROM atividade WHERE id = <%=request.getParameter("id_atv")%>
         </sql:query> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Gerenciador de Atividades - Index</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="assets/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="assets/css/style.css" rel="stylesheet">
    
</head>
<body>
<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark teal darken-4">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="">Gerenciador de Atividades</a>

    <!-- Collapse button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Links -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="main.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <!-- Links -->
        <form class="form-inline"  action="controller" method="POST" name="sair">
            <input type="hidden" name="tarefa" value="Logout">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ">
                      <a class="nav-link" href="javascript:sair.submit()">Sair</a>
               </li> 
            </ul>
        </form>
    </div>
    <!-- Collapsible content -->
</nav>
<!--/.Navbar-->
        <div class="container"> 
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 mt-5">
                <c:forEach var="index" items="${result.rows}">     
                <div class="card mx-auto">
                    <div class="card-header teal darken-4 white-text">
                        <h3><i class="fa fa-times-circle-o"></i> Corrigir Atividade</h3>
                    </div>
                    <div class="card-body">
                        <h3><p><c:out value="${index.titulo}"/></p></h3>
                    <h4><p>
                        <c:out value="${index.corpo}"/>
                        </p></h4>
                       <hr> 
                       <form action="controller" method="POST">
                            <input type="hidden" name="tarefa" value="Corrigir">
                            <div class="md-form">
                                <i class="fa fa-pencil prefix teal-text"></i>
                                <input type="number" id="nota" class="form-control" name="nota" step="0.01" min="0" max="10.0"/>
                                <label for="nota">Nota</label>
                            </div>
                            <div class="md-form">
                                <i class="fa fa-book prefix teal-text"></i>
                                <textarea type="text" id="observa" class="md-textarea form-control" name="observa" value="
"></textarea>
                                <label for="observa">Correcao <%=request.getParameter("id_atv")%></label>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn teal darken-4"> Enviar </button>
                            </div>
                            
                        </form>
                    </div>
                </div></c:forEach>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>

            
               
              
        </div>
        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
    </body>
</html>
