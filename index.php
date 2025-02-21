<!DOCTYPE html>
<html lang="en">
<?php
include("connection/connect.php");
error_reporting(0);
session_start();

?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
    <title>NAM KHO</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animsition.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
</head>

<body class="home">

    <!--header starts-->
    <?php include("includes/navbar.php") ?>
    <!-- header end -->

    <!-- banner part starts -->
    <section class="hero">
        <div class="hero-inner">
            <div class="container text-center hero-text font-dark mt-3">
                <h2>SELAMAT DATANG</h2>
                <h2>DI RESTO & CATERING NAMKHO</h2>
                <div class="p-3 steps">
                   <img class="img-fluid" src="images/img/logo.png" alt="logo">
                </div>
                <h4>Menyediakan menu catering yang hemat, nikmat dan praktis untuk segala jenis keperluan acara anda.</h4>


            </div>
        </div>
        <!--end:Hero inner -->
    </section>
    <!-- banner part ends -->

    <!-- Popular block starts -->
    <!-- <section class="popular">
        <div class="container">
            <div class="title text-xs-center m-b-30">
                <h2 class="title">Best Seller in this Month</h2>
                <p class="subTitle">Our top selling dishes this month</p>
            </div>
            <div class="row">

                <?php
                // fetch records from database to display popular first 3 dishes from table
                $query_res = mysqli_query($db, "select * from dishes LIMIT 3");
                while ($r = mysqli_fetch_array($query_res)) {

                    echo ' <div class="col-xs-12 col-sm-6 col-md-4 food-item">
										<div class="food-item-wrap box">
											<div class="figure-wrap bg-image" data-image-src="admin/Res_img/dishes/' . $r['img'] . '">
												<div class="distance"><i class="fa fa-pin"></i>150m</div>
												<div class="review pull-right"><a href="#">367 reviews</a> </div>
											</div>
											<div class="content">
												<h5><a href="dishes.php?res_id=' . $r['rs_id'] . '">' . $r['title'] . '</a></h5>
												<div class="product-name">' . $r['slogan'] . '</div>
												<div class="price-btn-block"> <span class="price">Rp.' . $r['price'] . '</span> <a href="dishes.php?res_id=' . $r['rs_id'] . '" class="btn ctaBtn  pull-right">Order Now</a> </div>
											</div>
											
										</div>
								</div>';
                }


                ?>

            </div>
        </div>
    </section> -->
    <!-- Popular block ends -->


    <!-- FOOTER SECTION ----------------------- -->
    <!-- <?php include("includes/footer.php"); ?> -->
    <!-- FOOTER SECTION END----------------- -->

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
    <script src="js/theme.js"></script>

</body>

</html>