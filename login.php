<!DOCTYPE html>
<html lang="en">
<?php
  include("connection/connect.php");
  error_reporting(0);
  session_start();
  if (isset($_POST['submit'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (!empty($_POST["submit"])) {
      $loginquery = "SELECT * FROM users WHERE username='$username' && password='" . md5($password) . "'";
      $result = mysqli_query($db, $loginquery);
      $row = mysqli_fetch_array($result);
      if (is_array($row)) {
        $_SESSION["random_id"] = rand();
        $_SESSION["user_id"] = $row['u_id'];
        header("refresh:1;url=index.php");
      } else {
        $message = "Invalid Username or Password!";
      }
    }
  }
  ?>


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
    <title>Login Form</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animsition.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
</head>

<body>

    <!--header starts-->
    <?php include("includes/navbar.php") ?>
    <!-- header end -->

    <div class="page-wrapper">
        <div class="breadcrumb">
            <div class="container">
            <span style="color:red;"><?php echo $message; ?></span>
            <span style="color:green;"><?php echo $success; ?></span>
            </div>
        </div>
        <section class="contact-page inner-page">
            <div class="container">
                <div class="row">
                    <!-- REGISTER -->
                    <div class="col-md-12">
                        <div class="widget">
                            <div class="widget-body">
                            <form class="form-container" action="" method="post">
                                <div class="form-group row">
                                <div class="col-sm-10">
                                    <input class="form-control" type="text" placeholder="Username" name="username" />
                                </div>
                                </div>
                                <div class="form-group row">
                                <div class="col-sm-10">
                                    <input class="form-control" type="password" placeholder="Password" name="password" />
                                </div>
                                </div>
                                <div class="form-group row">
                                <div class="col-sm-10">
                                    <button class="btn btn-primary" type="submit" name="submit" value="Login">Login</button>
                                </div>
                                </div>
                            </form>   

                            </div>
                            <div class="regis">Belum punya akun?<a href="registration.php" style="color:#f30;"> Klik untuk buat Akun</a></div>
                            <!-- end: Widget -->
                        </div>
                        <!-- /REGISTER -->
                    </div>
                </div>
        </section>

    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/animsition.min.js"></script>
    <script src="js/bootstrap-slider.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/headroom.js"></script>
    <script src="js/foodpicky.min.js"></script>
</body>

</html>