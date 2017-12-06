<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var = "conexao" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/recomenda_livros"
         user = "root"  password = ""/>
         
         <sql:query dataSource = "${conexao}" var = "result">
            SELECT * FROM usuario
         </sql:query> 
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Recomenda Livros - Recomendar</title>
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
<nav class="navbar navbar-expand-lg navbar-dark">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#">Recomenda Livros</a>

    <!-- Collapse button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Links -->
        <ul class="navbar-nav mr-auto">
            <form class="form-inline"  action="controller" method="POST" name="Home">
                        <input type="hidden" name="tarefa" value="Main">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item ">
                                <a class="nav-link" href="javascript:Home.submit()">Home</a>
                           </li> 
                        </ul>
            </form>
            <li class="nav-item ">
                    <a class="nav-link" href="inserir.jsp">Inserir<span class="sr-only">(current)</span></a>
            </li>
                <form class="form-inline"  action="controller" method="POST" name="meusLivros">
                <input type="hidden" name="tarefa" value="MeusLivros">
            
                <li class="nav-item ">
                      <a class="nav-link" href="javascript:meusLivros.submit()">MeusLivros</a>
               </li> 
            
        </form>
  
        </ul>
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
            <div class="col-md-8 mt-2">
                <div class="card mx-auto">
                    <div class="card-header white-text">
                        <h3><i class="fa fa-book"></i> Recomendar Livro</h3>
                    </div>
                    <div class="card-body">
                       <form action="controller" method="POST">
                            <input type="hidden" name="tarefa" value="Recomendar">
                            <input type="hidden" name="id_livro" value="${param.id_livro}">
                            <div class="form-group">
                                <i class="fa fa-pencil prefix teal-text"></i>&nbsp;<label for="titulo_id">Titulo </label>
                                <input type="text" id="titulo_id" class="form-control" name="titulo" disabled value="${param.titulo}">
                            </div>
                            <div class="form-group">
                                <i class="fa fa-user prefix teal-text"></i>&nbsp;<label for="autor_id">Autor </label>
                                <input type="text" id="autor_id" class="form-control" name="autor" disabled value="${param.autor}">
                            </div>
                            <div class="form-group">
                                <i class="fa fa-check prefix teal-text"></i><label for="genero_id">Gênero</label>
                                <input type="text" id="genero_id" class="form-control" name="genero" disabled value="${param.genero}">
                            </div>
                            <div class="form-group">
                            <label for="sel1">Usuario</label>
                            <select name="codigo_recomendado" class="form-control" id="sel1">
                                <c:forEach var="usuario" items="${result.rows}">
                                    <option value="${usuario.id_usuario}"><c:out value="${usuario.nome}" /></option>
                                </c:forEach>
                            </select>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn teal darken-4"> Enviar </button>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
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
