<%-- 
    Document   : busca
    Created on : Aug 8, 2017, 9:46:41 PM
    Author     : Félix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Main_Corretor
    Created on : 07/09/2017, 21:32:51
    Author     : Félix
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Gerenciador de Atividades - Home</title>
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
<nav class="navbar navbar-expand-lg navbar-dark stylish-color">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="#">Gerenciador de Atividades</a>

    <!-- Collapse button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Links -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Inserir<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Corrigir<span class="sr-only">(current)</span></a>
            </li>
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
    <div class="col-md-8 mx-auto align-middle">
    <c:forEach var="atividade" items="${atividade}">
    <div class="card mx-auto align-middle">
    <div class="card-header teal darken-4">
        <h4 class="white-text"><i class="fa fa-search "></i> Resultado - ${atividade.titulo}</h4>
    </div>
    <div class="card-body">
        <h4><p class="text-justify">${atividade.corpo}</p></h4>   
        <h5 class="text-right"><p>Publicado em: ${atividade.data}</p></h5>
    <hr>
    
    <div class="list-group">
      <c:forEach var="corr" items="${correcoes}">
        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
        <div class="d-flex w-100 justify-content-between">
          <h5 class="mb-1">Nota: ${corr.nota}</h5>
          <small></small>
        </div>
        <p class="mb-1">${corr.observacao}</p>
      </a>
    </c:forEach>  
    </div>
    </div>
    </div>
    </c:forEach>
    </div>
    <div class="col-md-2 mx-auto"></div>
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
          
       