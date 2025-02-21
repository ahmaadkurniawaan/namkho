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
    <title>Menu Best Seller</title>
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
                    <div class="col-sm-5">
                        <div class="title-block pull-left">
                            <h4 class="title">Menu Best Seller</h4>
                            <small>Skor Pesanan = Jumlah pesanan menu / Jumlah pesanan tertinggi</small> <br>
                            <small>Skor Harga = 1 - (Harga menu / Harga tertinggi)</small> <br>
                            <small>Total Skor = (Skor Pesanan × 0.7) + (Skor Harga × 0.3)</small>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <!-- restaurants filter nav starts -->
                        <div class="restaurants-filter pull-right">
                            <nav class="primary pull-left">
                                <input type="text" id="searchInput" class="form-control"
                                    placeholder="Cari Menu Best Seller...">
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
                        // Query untuk mengambil menu dan data pesanan
                        $query_res = mysqli_query(
                            $db,
                            "SELECT d.*, 
                                (SELECT COUNT(*) FROM users_orders uo WHERE uo.title = d.title) as order_count
                                FROM dishes d 
                                ORDER BY order_count DESC",
                        );
                        
                        $menu_items = [];
                        $max_price = 0;
                        $max_orders = 0;
                        
                        // Cari nilai maksimum untuk normalisasi
                        while ($row = mysqli_fetch_array($query_res)) {
                            $max_price = max($max_price, $row['price']);
                            $max_orders = max($max_orders, $row['order_count']);
                            $menu_items[] = $row;
                        }
                        
                        // Hitung score untuk setiap menu
                        foreach ($menu_items as &$item) {
                            // Normalisasi nilai (0-1)
                            $order_score = $max_orders > 0 ? $item['order_count'] / $max_orders : 0;
                            $price_score = $max_price > 0 ? 1 - $item['price'] / $max_price : 0; // Semakin murah semakin tinggi score
                        
                            // Hitung total score dengan pembobotan
                            $item['total_score'] =
                                $order_score * 0.7 + // Bobot pesanan 70%
                                $price_score * 0.3; // Bobot harga 30%
                        }
                        
                        // Urutkan berdasarkan total score
                        usort($menu_items, function ($a, $b) {
                            return $b['total_score'] <=> $a['total_score'];
                        });
                        
                        // Ambil 6 menu teratas
                        $top_menu_items = array_slice($menu_items, 0, 6);
                        
                        foreach ($top_menu_items as $r) {
                            // Menu dianggap highly recommended jika score > 0.6
                            $highly_recommended = $r['total_score'] > 0.6 ? true : false;
                        
                            $label_style = $highly_recommended ? 'style="position: relative;"' : '';
                            $recommendation_label = $highly_recommended ? '<div style="position: absolute; top: 10px; right: 10px; background-color: #ff0000; color: white; padding: 5px 10px; border-radius: 3px; z-index: 1;">Best Seller</div>' : '';
                        
                            // Tampilkan score dalam persentase
                            $score_percentage = round($r['total_score'] * 100);
                        
                            echo '<div class="col-xs-12 col-sm-6 col-md-4 food-item">
                                    <div class="food-item-wrap box" ' .
                                $label_style .
                                '>
                                        ' .
                                $recommendation_label .
                                '
                                        <div class="figure-wrap bg-image" data-image-src="admin/Res_img/dishes/' .
                                $r['img'] .
                                '">
                                            <div class="distance">
                                                <i class="fa fa-shopping-cart"></i>' .
                                $r['order_count'] .
                                ' terjual
                                                <span class="score">(' .
                                $score_percentage .
                                '% rekomendasi)</span>
                                            </div>
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
    <script src="js/headroom.js"></script>
    <script src="js/foodpicky.min.js"></script>
    <script>
        document.getElementById('searchInput').addEventListener('keyup', function() {
            let searchQuery = this.value.toLowerCase();
            let menuItems = document.getElementsByClassName('food-item');

            for (let item of menuItems) {
                let title = item.querySelector('h5 a').innerText.toLowerCase();
                let slogan = item.querySelector('.product-name').innerText.toLowerCase();

                // Cek apakah judul atau slogan mengandung kata kunci pencarian
                if (title.includes(searchQuery) || slogan.includes(searchQuery)) {
                    item.style.display = '';
                } else {
                    item.style.display = 'none';
                }
            }
        });
    </script>
</body>

</html>
