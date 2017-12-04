<%-- 
    Document   : Main
    Created on : 07/09/2017, 21:32:51
    Author     : Félix
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Gerenciador de Atividades</title>
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
        
            
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ">
                    <a class="nav-link" href="inserir.jsp">Inserir<span class="sr-only">(current)</span></a>
               </li> 
            </ul>
               
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
    <hr>
    <div class="list-group">
    
    </div>
    </div>
    </div>
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
            