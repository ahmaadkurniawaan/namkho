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
    <title>Menu Termurah</title>
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
                            <h4 class="title">Menu Termurah</h4>
                            <small>Skor ditambah dengan: (jumlah pesanan kategori × 0.2)</small> <br>
                            <small>pengguna harus memesan setidaknya 3 kali dari kategori yang sama untuk menu tersebut
                                mendapat label rekomendasi Termurah</small> <br>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <!-- restaurants filter nav starts -->
                        <div class="restaurants-filter pull-right">
                            <nav class="primary pull-left">
                                <input type="text" id="searchInput" class="form-control"
                                    placeholder="Cari Menu Termurah...">
                            </nav>
                        </div>
                        <!-- restaurants filter nav ends -->
                    </div>
                </div>
            </div>
            <!-- Popular block starts -->
            <section class="popular">
                <div class="container">

                    <div class="row" id="menuContainer">
                        <?php
                        // Query untuk mengambil semua menu dan mengurutkan berdasarkan harga terendah
                        $query_res = mysqli_query(
                            $db,
                            "SELECT d.*, m.m_name 
                                                                                   FROM dishes d
                                                                                   LEFT JOIN menu_category m ON d.cat_menu_id = m.m_id
                                                                                   ORDER BY d.price ASC 
                                                                                   LIMIT 6",
                        ); // Tampilkan 6 menu termurah
                        // var_dump($query_res);
                        
                        // Array untuk menyimpan preferensi kategori
                        $category_weights = [];
                        
                        // Hitung bobot kategori berdasarkan riwayat pesanan user (jika ada)
                        if (isset($_SESSION['u_id'])) {
                            $user_id = $_SESSION['u_id'];
                            $history_query = mysqli_query(
                                $db,
                                "SELECT d.cat_menu_id, COUNT(*) as order_count 
                                                                                          FROM users_orders o
                                                                                          JOIN dishes d ON o.d_id = d.title
                                                                                          WHERE o.u_id = $user_id
                                                                                          GROUP BY d.cat_menu_id",
                            );
                        
                            while ($hist = mysqli_fetch_array($history_query)) {
                                $category_weights[$hist['cat_menu_id']] = $hist['order_count'];
                                var_dump($category_weights);
                            }
                        }
                        
                        while ($r = mysqli_fetch_array($query_res)) {
                            // Hitung skor rekomendasi
                            $recommendation_score = 1;
                            if (isset($category_weights[$r['cat_menu_id']])) {
                                $recommendation_score += $category_weights[$r['cat_menu_id']] * 0.2; // Bobot 20% untuk preferensi kategori
                            }
                        
                            // Tambahkan label rekomendasi jika skornya tinggi
                            $recommendation_label = $recommendation_score > 1.5 ? '<span class="badge badge-danger">Termurah</span>' : '';
                        
                            echo '<div class="col-xs-12 col-sm-6 col-md-4 food-item">
                                                                <div class="food-item-wrap box">
                                                                    <div class="figure-wrap bg-image" data-image-src="admin/Res_img/dishes/' .
                                $r['img'] .
                                '">
                                                                        <div class="distance"><i class="fa fa-pin"></i>' .
                                $r['m_name'] .
                                $recommendation_label .
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
                                                                        <div class="price-btn-block"> 
                                                                            <span class="price">Rp.' .
                                number_format($r['price'], 0, ',', '.') .
                                '</span> 
                                                                            <a href="dishes.php?res_id=' .
                                $r['rs_id'] .
                                '" class="btn ctaBtn pull-right">Pesan Sekarang</a> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>';
                        }
                        ?>
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
                                $grid.isotope({
                                    filter: filterValue
                                });

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
