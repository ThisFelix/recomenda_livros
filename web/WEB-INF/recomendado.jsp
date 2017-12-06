<%-- 
    Document   : cadastrado
    Created on : 30/11/2017, 20:33:04
    Author     : Félix
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta Http-Equiv="Cache-Control" Content="no-cache">  
    <meta Http-Equiv="Pragma" Content="no-cache">  
    <meta Http-Equiv="Expires" Content="0">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Recomenda Livros - cadastrado</title>
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
<div class="mt-3 row">           
    <div class="col-md-4 mx-auto"></div>
    <div class="col-md-4 mx-auto align-middle">
        <div class="card mx-auto">
                    <div class="card-header white-text">
                        <h3><i class="fa fa-check"></i> Livro Recomendado Com Sucesso</h3>
                    </div>
                    <div class="card-body">
                    <form class="form-inline"  action="controller" method="POST" name="Home">
                        <input type="hidden" name="tarefa" value="Main">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item ">
                                  Voltar para a <a class="nav-link" href="javascript:Home.submit()">Home</a>
                           </li> 
                        </ul>
                    </form>
                           
                    </div>
        </div>
     </div>
    <div class="col-md-4 mx-auto"></div>
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