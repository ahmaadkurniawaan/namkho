<header id="header" class="header-scroll top-header headrom headerBg" style="background-color:#206BC4;">
    <!-- .navbar -->
    <nav class="navbar navbar-dark">
        <div class="container">
            <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#mainNavbarCollapse">&#9776;</button>
            <a class="navbar-brand" href="index.php"> NAM KHO</a>
            <div class="collapse navbar-toggleable-md  float-lg-right" id="mainNavbarCollapse">
            <ul class="nav navbar-nav">
                    <?php
                    $current_page = basename($_SERVER['PHP_SELF']);
                    
                    $menu_items = array(
                        'index.php' => 'Home',
                        'restaurants.php' => 'Resto',
                        'rekomendasi.php' => 'Rekomendasi',
                        // 'bestseller.php' => 'Best Seller',
                        // 'termurah.php' => 'Termurah',
                        'kategori.php' => 'Kategori',
                        'contact.php' => 'Hubungi Kami'
                    );

                    foreach($menu_items as $page => $label) {
                        $active_class = ($current_page == $page) ? 'active' : '';
                        echo '<li class="nav-item"> 
                                <a class="nav-link '.$active_class.'" href="'.$page.'">'.$label.'
                                    <span class="sr-only">'.($active_class ? '(current)' : '').'</span>
                                </a> 
                              </li>';
                    }
                    
                    if (empty($_SESSION["user_id"])) {
                        echo '<li class="nav-item"><a href="login.php" class="nav-link '.($current_page == 'login.php' ? 'active' : '').'">Login</a> </li>
                              <li class="nav-item"><a href="registration.php" class="nav-link bgGreen '.($current_page == 'registration.php' ? 'active' : '').'">Daftar</a> </li>';
                    } else {
                        echo '<li class="nav-item"><a href="your_orders.php" class="nav-link '.($current_page == 'your_orders.php' ? 'active' : '').'">Pesanan</a> </li>';
                        echo '<li class="nav-item"><a href="logout.php" class="nav-link '.($current_page == 'logout.php' ? 'active' : '').'">Keluar</a> </li>';
                    }
                    ?>
                </ul>

            </div>


        </div>

    </nav>
    <!-- /.navbar -->

</header>