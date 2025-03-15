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
    <title>Menu Rekomendasi</title>
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
                            <h4 class="title">Menu Rekomendasi</h4>
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

                    <div class="row" id="menuContainer"
                        data-isotope='{ "itemSelector": ".food-item", "layoutMode": "fitRows" }'>
                        <div class="col-md-2">
                            <!-- restaurants filter nav starts -->
                            <div class="restaurants-filter pull-left">
                                <nav class="primary pull-left">
                                    <form method="GET" action="" class="mb-4">
                                        <div class="form-group">
                                            <label>Kategori Menu</label>
                                            <select name="jenis" class="form-control">
                                                <option value="">Pilih</option>
                                                <?php
                                                // Query untuk mengambil data kategori menu
                                                $query_kategori = mysqli_query($db, "SELECT * FROM menu_category");
                                                while ($kategori = mysqli_fetch_array($query_kategori)) {
                                                    $selected = (isset($_GET['jenis']) && $_GET['jenis'] == $kategori['m_name']) ? 'selected' : '';
                                                    echo '<option value="'.$kategori['m_name'].'" '.$selected.'>'.$kategori['m_name'].'</option>';
                                                }
                                                ?>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                        <label>Harga (Rp. <span id="hargaValue"><?php echo isset($_GET['harga']) ? number_format($_GET['harga'], 0, ',', '.') : '1000'; ?></span>)</label>
                                        <input type="range" name="harga" class="form-control-range" 
                                            min="1000" max="500000" step="1000" 
                                            value="<?php echo isset($_GET['harga']) ? $_GET['harga'] : '1000'; ?>"
                                            oninput="document.getElementById('hargaValue').innerText = new Intl.NumberFormat('id-ID').format(this.value)">
                                    </div>
                                        <div class="form-check mb-3">
                                            <input class="form-check-input" type="checkbox" name="bestseller" value="y"
                                                <?php echo (isset($_GET['bestseller']) && $_GET['bestseller'] == 'y') ? 'checked' : ''; ?>>
                                            <label class="form-check-label">Best Seller</label>
                                        </div>
                                        <div class="form-check mb-3">
                                            <input class="form-check-input" type="checkbox" name="termurah" value="y"
                                                <?php echo (isset($_GET['termurah']) && $_GET['termurah'] == 'y') ? 'checked' : ''; ?>>
                                            <label class="form-check-label">Termurah</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Cari</button>
                                    </form>
                                </nav>
                            </div>
                            <!-- restaurants filter nav ends -->
                        </div>
                        <div class="col-md-10">
                            <?php
                            // Fungsi untuk menghitung similarity
                            function hitungSimilarity($jenis_input, $harga_input, $jenis_produk, $harga_produk, $max_harga) {
                                // Bobot untuk jenis dan harga (masing-masing 0.5)
                                $bobot_jenis = 0.5;
                                $bobot_harga = 0.5;
                                
                                // Similarity jenis (1 jika sama, 0 jika berbeda)
                                $similarity_jenis = ($jenis_input == $jenis_produk) ? 1 : 0;
                                
                                // Similarity harga
                                $selisih_harga = abs($harga_input - $harga_produk);
                                $similarity_harga = 1 - ($selisih_harga / $max_harga);
                                
                                // Total similarity
                                $total_similarity = ($bobot_jenis * $similarity_jenis) + ($bobot_harga * $similarity_harga);
                                
                                return $total_similarity;
                            }

                            // Ambil input user dari form GET
                            $jenis_input = isset($_GET['jenis']) ? $_GET['jenis'] : '';
                            $harga_input = isset($_GET['harga']) ? (float)$_GET['harga'] : 0;

                            // Query untuk mendapatkan harga maksimum sebagai pembagi
                            $max_query = "SELECT MAX(price) as max_harga FROM dishes";
                            $max_result = mysqli_query($db, $max_query);
                            $max_data = mysqli_fetch_assoc($max_result);
                            $max_harga = $max_data['max_harga'];

                            // Query dasar
                            $sql = "SELECT d.*, mc.m_name as jenis, 
                                    (0.5 * CASE WHEN mc.m_name = '$jenis_input' THEN 1 ELSE 0 END + 
                                    0.5 * (1 - ABS(d.price - $harga_input) / $max_harga)) as similarity 
                                    FROM dishes d 
                                    JOIN menu_category mc ON d.cat_menu_id = mc.m_id 
                                    WHERE 1=1";

                            // Tambahkan filter bestseller dan termurah jika dipilih
                            if(isset($_GET['bestseller']) && $_GET['bestseller'] == 'y') {
                                $sql .= " AND d.bestseller = 'y'";
                            }
                            if(isset($_GET['termurah']) && $_GET['termurah'] == 'y') {
                                $sql .= " AND d.termurah = 'y'";
                            }

                            // Urutkan berdasarkan nilai similarity tertinggi
                            $sql .= " ORDER BY similarity DESC";

                            $query_res = mysqli_query($db, $sql);

                            while ($r = mysqli_fetch_array($query_res)) {
                                $query = mysqli_query($db, "SELECT * FROM menu_category WHERE menu_category.m_id = '".$r['cat_menu_id']."'");
                                $rowss = mysqli_fetch_array($query);
                                
                                // Tampilkan hasil dengan nilai similarity
                                echo '<div class="col-xs-12 col-sm-6 col-md-4 food-item single-restaurant all ' . $rowss['m_id'] . '">
                                <div class="food-item-wrap box">
                                <div class="figure-wrap bg-image" data-image-src="admin/Res_img/dishes/' . $r['img'] . '">
                                    <div class="distance"><i class="fa fa-pin"></i>' . $rowss['m_name'] . ' - ' . number_format($r['similarity'], 2) . '</div>
                                    ' . ($r['similarity'] == 1 ? '<span class="badge bg-danger text-white" style="position: absolute; top: 10px; right: 10px;">Termurah</span>' : '') . '
                                </div>
                                    <div class="content">
                                        <h5><a href="dishes.php?res_id=' . $r['rs_id'] . '">' . $r['title'] . '</a></h5>
                                        <div class="product-name">' . $r['slogan'] . '</div>
                                        <div class="price-btn-block">
                                            <span class="price">Rp.' . number_format($r['price'], 0, ',', '.') . '</span>
                                            <a href="dishes.php?res_id=' . $r['rs_id'] . '" class="btn ctaBtn pull-right" style="font-size:12px;">Pesan Sekarang</a>
                                        </div>
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