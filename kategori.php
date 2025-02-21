<!DOCTYPE html>
<html lang="en">
<?php
include 'connection/connect.php';
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
    <title>Menu By Kategori</title>
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
    <?php include 'includes/navbar.php'; ?>
    <!-- header end -->

    <div class="page-wrapper">
        <section class="featured-restaurants">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="title-block pull-left">
                            <h4 class="title">Menu By Kategori</h4>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <!-- restaurants filter nav starts -->
                        <div class="restaurants-filter pull-right">
                            <nav class="primary pull-left">
                                <input type="text" id="searchInput" class="form-control" placeholder="Cari Menu...">
                            </nav>
                        </div>
                        <!-- restaurants filter nav ends -->
                    </div>
                </div>
            </div>
            <!-- Popular block starts -->
            <section class="popular">
                <div class="container">

                <div class="row" id="menuContainer" data-isotope='{ "itemSelector": ".food-item", "layoutMode": "fitRows" }'>
                        <div class="col-md-2">
                            <!-- restaurants filter nav starts -->
                            <div class="restaurants-filter pull-left">
                                <nav class="primary pull-left">
                                    <ul>
                                        <li>
                                            <a href="kategori.php" class="selected filter-link">Semua</a>
                                        </li> <br>
                                        <?php
                                        $res = mysqli_query($db, 'select * from menu_category');
                                        while ($row = mysqli_fetch_array($res)) {
                                            echo '<li><a class="filter-link" href="#" data-filter=".' . $row['m_id'] . '">' . $row['m_name'] . '</a></li><br>';
                                        }
                                        ?>
                                    </ul>
                                </nav>
                            </div>
                            <!-- restaurants filter nav ends -->
                        </div>
                        <div class="col-md-10">
                        <?php
                            $query_res = mysqli_query($db, "SELECT * FROM dishes");
                            while ($r = mysqli_fetch_array($query_res)) {
                                $query = mysqli_query($db, "SELECT * FROM menu_category WHERE menu_category.m_id = '".$r['cat_menu_id']."'");
                                $rowss = mysqli_fetch_array($query);
                                echo '<div class="col-xs-12 col-sm-6 col-md-4 food-item single-restaurant all ' . $rowss['m_id'] . '"> 
                                                                                                                                                                    										<div class="food-item-wrap box">
                                                                                                                                                                    											<div class="figure-wrap bg-image" data-image-src="admin/Res_img/dishes/' .
                                    $r['img'] .
                                    '">
                                                                                                                                                                    												<div class="distance"><i class="fa fa-pin"></i>' .
                                    $rowss['m_name'] .
                                    '</div>
                                                                                                                                                                    												
                                                                                                                                                                    											</div>
                                                                                                                                                                    											<div class="content">
                                                                                                                                                                    												<h5><a href="dishes.php?res_id=' .
                                    $r['rs_id'] .
                                    '">' .
                                    $r['title'] .
                                    '</a></h5>
                                                                                                                                                                    												<div class="product-name">' .
                                    $r['slogan'] .
                                    '</div>
                                                                                                                                                                    												<div class="price-btn-block"> <span class="price">Rp.' .
                                    number_format($r['price'], 0, ',', '.') .
                                    '</span> <a href="dishes.php?res_id=' .
                                    $r['rs_id'] .
                                    '" class="btn ctaBtn  pull-right" style="font-size:12px;">Pesan Sekarang</a> </div>
                                                                                                                                                                    											</div>
                                                                                                                                                                    											
                                                                                                                                                                    										</div>
                                                                                                                                                                    								</div>';
                            }
                            
                            ?>
                        </div>


                    </div>
                </div>
            </section>
            <!-- Popular block ends -->
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
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/headroom.js"></script>
    <script src="js/foodpicky.min.js"></script>

<script>
    $(document).ready(function() {
        // Inisialisasi Isotope
        var $grid = $('.row').isotope({
            itemSelector: '.food-item',
            layoutMode: 'fitRows',
            transitionDuration: '0.6s',
            stagger: 30
        });

        // Filter kategori
        $('.filter-link').on('click', function(e) {
            e.preventDefault();
            var filterValue = $(this).attr('data-filter');
            $grid.isotope({ filter: filterValue });
            
            // Update class selected
            $('.filter-link').removeClass('selected');
            $(this).addClass('selected');
        });

        // Search function
        document.getElementById('searchInput').addEventListener('keyup', function() {
            let searchQuery = this.value.toLowerCase();
            $grid.isotope({
                filter: function() {
                    let title = $(this).find('h5 a').text().toLowerCase();
                    let slogan = $(this).find('.product-name').text().toLowerCase();
                    return title.includes(searchQuery) || slogan.includes(searchQuery);
                }
            });
        });
    });
</script>
</body>

</html>
