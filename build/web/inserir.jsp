<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Recomenda Livros - Inserir</title>
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
<nav class="navbar navbar-expand-lg navbar-dark ">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="">Gerenciador de Atividades</a>

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
                <div class="card mx-auto">
                    <div class="card-header white-text">
                        <h3><i class="fa fa-book"></i> Inserir Livro</h3>
                    </div>
                    <div class="card-body">
                       <form action="controller" method="POST">
                            <input type="hidden" name="tarefa" value="NovoLivro">
                            <div class="form-group">
                                <i class="fa fa-pencil prefix"></i>&nbsp;<label for="titulo_id">Titulo </label>
                                <input type="text" id="titulo_id" class="form-control" name="titulo">
                            </div>
                            <div class="form-group">
                                <i class="fa fa-user prefix "></i>&nbsp;<label for="autor_id">Autor </label>
                                <input type="text" id="autor_id" class="form-control" name="autor">
                            </div>
                            <div class="form-group">
                                <i class="fa fa-check prefix "></i><label for="genero_id">Gênero</label>
                                <input type="text" id="genero_id" class="form-control" name="genero">
                            </div>

                            <div class="form-group">
                            <label for="sel1">Status de Leitura</label>
                            <select name="status_leitura" class="form-control" id="sel1">
                                <option value="2" disabled selected>Escolha uma opção</option>
                                  <option value="1">Lido</option>
                                  <option value="2">Leitura Não Iniciada</option>
                                  <option value="3">Em leitura</option>
                            </select>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn"> Enviar </button>
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
