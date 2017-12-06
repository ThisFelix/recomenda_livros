<%-- 
    Document   : busca
    Created on : Aug 8, 2017, 9:46:41 PM
    Author     : Félix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <div class="col-md-8 mx-auto align-middle">
    <c:forEach var="meusLivros" items="${meusLivros}">
    <div class="card mx-auto align-middle">
    <div class="card-header">
        <h4 class="white-text"><i class="fa fa-search "></i> &nbsp;${meusLivros.titulo}</h4>
    </div>
    <div class="card-body">
        Autor : ${meusLivros.autor}<br>
        Gênero: ${meusLivros.genero}<br>
        Status: ${meusLivros.status}
        <a class="nav-link btn btn-sm btn-edit" href="editar.jsp?id_livro=${meusLivros.id}&status=${meusLivros.status}&autor=${meusLivros.autor}&titulo=${meusLivros.titulo}&genero=${meusLivros.genero}">Editar<span class="sr-only">(current)</span></a>
        <a class="nav-link btn btn-sm btn-recomenda" href="recomendar.jsp?id_livro=${meusLivros.id}&autor=${meusLivros.autor}&genero=${meusLivros.genero}&titulo=${meusLivros.titulo}">Recomendar<span class="sr-only">(current)</span></a>
    </div>
    </div>
    <br>
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
          
       