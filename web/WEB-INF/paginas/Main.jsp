<%-- 
    Document   : Main
    Created on : 07/09/2017, 21:32:51
    Author     : Félix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta Http-Equiv="Cache-Control" Content="no-cache">  
    <meta Http-Equiv="Pragma" Content="no-cache">  
    <meta Http-Equiv="Expires" Content="0">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Recomenda Livros</title>
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
<div class="mt-3 row">           
    <div class="col-md-2 mx-auto"></div>
    <div class="col-md-8 mx-auto">
    <div class="card mx-auto mt-12">
    <div class="card-body">
    <form action="controller" method="GET">
        <input type="hidden" name="tarefa" value="BuscaLivro">
        <div class="input-group add-on">
        <input class="form-control" placeholder="Search" name="filtro" id="srch-term" type="text">
        <div class="input-group-btn">
        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
        </div>
    </div>
    </form>
    </div>
        
    </div>
        <hr>
        <div class="card mx-auto mt-12">
    <div class="card-body">
    <ul class="list-group">
    <c:forEach var="indicacao" items="${indicacao}">  
    
                
    <li class="list-group-item d-flex  align-items-center list-font">
        O usuario &nbsp;<b>${indicacao.nome_recomendador}</b> &nbsp;está te indicando o livro &nbsp;<b>${indicacao.titulo}</b>&nbsp;
        <span class="btn-group">
            <form class="form-inline"  action="controller" method="POST" name="aceitar">
                <input type="hidden" name="tarefa" value="AceitarRecomenda">
                <input type="hidden" name="cod_livro" value="${indicacao.codigo_livro}">
                <input type="hidden" name="cod_recomendado" value="${indicacao.codigo_recomendado}">
                <input type="hidden" name="cod_recomendador" value="${indicacao.codigo_recomendador}">
                <input type="hidden" name="status" value="Aceito">
                <input type="hidden" name="autor" value="${indicacao.autor}">
                <input type="hidden" name="titulo" value="${indicacao.titulo}">
                <input type="hidden" name="genero" value="${indicacao.genero}">
                
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                            <input type="submit" class="btn btn-sm" value="Aceitar">
                        </li> 
                    </ul>
            </form>
  
            <form class="form-inline"  action="controller" method="POST" name="recusar">
                <input type="hidden" name="tarefa" value="AceitarRecomenda">
                <input type="hidden" name="cod_livro" value="${indicacao.codigo_livro}">
                <input type="hidden" name="cod_recomendado" value="${indicacao.codigo_recomendado}">
                <input type="hidden" name="cod_recomendador" value="${indicacao.codigo_recomendador}">
                <input type="hidden" name="status" value="Recusado">
                <input type="hidden" name="autor" value="${indicacao.autor}">
                <input type="hidden" name="titulo" value="${indicacao.titulo}">
                <input type="hidden" name="genero" value="${indicacao.genero}">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                            <input type="submit" class="btn btn-sm" value="Recusar">
                        </li>  
                    </ul>
            </form>
  
        </span>
    </li>
          
        
        
    </c:forEach>
    </ul>
    </div></div>
    </div>
 
    <div class="col-md-2 mx-auto"></div>
</div> 
    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="assets/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="assets/js/mdb.min.js"></script>
</body>
</html>
            