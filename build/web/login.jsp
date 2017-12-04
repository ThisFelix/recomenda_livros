<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Recomenda Livros - Login</title>
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
            <div class="col-md-2"></div>
            <div class="col-md-8 mt-5">
                <div class="card mx-auto " style="width: 28rem;">
                    <div class="card-header red darken-4 white-text">
                        <h3><i class="fa fa-lock"></i> Login:</h3>
                    </div>
                    <div class="card-body">
                        <form action="controller" method="post" role="form">
                            <input type="hidden" name="tarefa" value="Login">
                            <div class="md-form">
                                <i class="fa fa-envelope prefix teal-text"></i>
                                <input type="text" id="email" class="form-control" name="email">
                                <label for="email">Email </label>
                            </div>

                            <div class="md-form">
                                <i class="fa fa-lock prefix teal-text"></i>
                                <input type="password" id="senha" class="form-control" name="senha">
                                <label for="senha">Senha </label>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn teal darken-4">Login</button>
                            </div>
                            <a href="cadastrar.jsp"> Cadastrar </a>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
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
