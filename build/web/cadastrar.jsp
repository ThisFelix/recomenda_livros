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
    <div class="container"> 
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="card mx-auto mt-2" style="width: 28rem;">
                    <div class="card-header default-color">
                        <h3><i class="fa fa-lock"></i> Cadastro</h3>
                    </div>
                    <div class="card-body">
                <form action="controller" method="post" role="form">
                    <input type="hidden" name="tarefa" value="Cadastrar">
                    <div class="md-form">
                        <i class="fa fa-user prefix grey-text"></i>
                        <input type="text" id="nome" class="form-control" name="nome">
                        <label for="nome">Nome </label>
                    </div>
                    
                     <div class="md-form">
                        <i class="fa fa-envelope prefix grey-text"></i>
                        <input type="text" id="email" class="form-control" name="email">
                        <label for="email">Email </label>
                    </div>
                    
                    <div class="md-form">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input type="password" id="senha" class="form-control" name="senha">
                        <label for="senha">Senha </label>
                    </div>
                    
                    <div class="md-form">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input type="password" id="confirma" class="form-control" name="confirma-senha">
                        <label for="confirma">Confirma </label>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-default">Cadastrar</button>
                    </div>
                    <a href="index.jsp">Voltar</a>
                   </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
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
            