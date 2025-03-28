<!DOCTYPE html>
<html lang="en">
<?php
include("../connection/connect.php");
error_reporting(0);
session_start();




if (isset($_POST['submit'])) {

    if (empty($_POST['d_name']) || empty($_POST['cat_name']) || empty($_POST['about']) || $_POST['price'] == '' || $_POST['res_name'] == '') {
        $error = '<div class="alert alert-danger alert-dismissible fade show">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<strong>All fields Must be Fillup!</strong>
				</div>';
    } else {

        $fname =    $_FILES['file']['name'];
        $temp = $_FILES['file']['tmp_name'];
        $fsize = $_FILES['file']['size'];
        $extension = explode('.', $fname);
        $extension = strtolower(end($extension));
        $fnew = uniqid() . '.' . $extension;
        $store = "Res_img/dishes/" . basename($fnew);

        if ($extension == 'jpg' || $extension == 'png' || $extension == 'gif') {
            if ($fsize >= 1000000) {
                $error = '<div class="alert alert-danger alert-dismissible fade show">
										<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<strong>Max Image Size is 1024kb!</strong> Try different Image.
									</div>';
            } else {

                $sql = "INSERT INTO dishes(rs_id,title,cat_menu_id,slogan,price,img,bestseller,termurah) VALUE('" . $_POST['res_name'] . "','" . $_POST['d_name'] . "','" . $_POST['cat_name'] . "','" . $_POST['about'] . "','" . $_POST['price'] . "','" . $fnew . "','" . $_POST['bestseller'] . "','" . $_POST['termurah'] . "')";
                mysqli_query($db, $sql);
                move_uploaded_file($temp, $store);

                $success = '<div class="alert alert-success alert-dismissible fade show">
											    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<strong>Congrass!</strong> New Dish Added Successfully.
											</div>';
            }
        } elseif ($extension == '') {
            $error = '<div class="alert alert-danger alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<strong>select image</strong>
								</div>';
        } else {

            $error = '<div class="alert alert-danger alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<strong>invalid extension!</strong>png, jpg, Gif are accepted.
								</div>';
        }
    }
}

?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Dashboard</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/helper.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

</head>

<body class="fix-header">
    <!-- Preloader - style you can find in spinners.css -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- Main wrapper  -->
    <div id="main-wrapper">
        <!-- start header  -->
        <?php include("includes/header.php"); ?>
        <!-- End header header -->
        <!-- start sidebar -->
        <?php include("includes/sidebar.php"); ?>
        <!-- End Left Sidebar  -->
        <!-- Page wrapper  -->
        <div class="page-wrapper" style="height:1200px;">
            <!-- Bread crumb -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Dashboard</h3>
                </div>
            </div>
            <!-- End Bread crumb -->
            <!-- Container fluid  -->
            <div class="container-fluid">
                <!-- Start Page Content -->


                <?php
                echo $error;
                echo $success;

                ?>




                <div class="col-lg-12">
                    <div class="card card-outline-primary">
                        <div class="card-header" style="background: teal;">
                            <h4 class="m-b-0 text-white">Tambah Menu</h4>
                        </div>
                        <div class="card-body">
                            <form action='' method='post' enctype="multipart/form-data">
                                <div class="form-body">

                                    <hr>
                                    <div class="row p-t-20">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Nama Menu</label>
                                                <input type="text" name="d_name" class="form-control" placeholder="Nama Menu">
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group has-danger">
                                                <label class="control-label">Slogan/Keterangan</label>
                                                <input type="text" name="about" class="form-control form-control-danger" placeholder="slogan/keterangan">
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row p-t-20">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">harga </label>
                                                <input type="text" name="price" class="form-control" placeholder="Rp">
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group has-danger">
                                                <label class="control-label">Gambar</label>
                                                <input type="file" name="file" id="lastName" class="form-control form-control-danger" placeholder="12n">
                                            </div>
                                        </div>
                                    </div>
                                    <!--/row-->

                                    <!--/span-->
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label">Pilih Kategori Menu</label>
                                                <select name="cat_name" class="form-control custom-select" data-placeholder="Pilih Kategori Menu" tabindex="1">
                                                    <option>--Pilih Kategori Menu--</option>
                                                    <?php $ssql = "select * from menu_category";
                                                    $menu = mysqli_query($db, $ssql);
                                                    while ($row = mysqli_fetch_array($menu)) {
                                                        echo ' <option value="' . $row['m_id'] . '">' . $row['m_name'] . '</option>';;
                                                    }

                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label">PIlih Resto</label>
                                                <select name="res_name" class="form-control custom-select" data-placeholder="Choose a Resto" tabindex="1">
                                                    <option>--Pilih Resto--</option>
                                                    <?php $ssql = "select * from restaurant";
                                                    $res = mysqli_query($db, $ssql);
                                                    while ($row = mysqli_fetch_array($res)) {
                                                        echo ' <option value="' . $row['rs_id'] . '">' . $row['title'] . '</option>';;
                                                    }

                                                    ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label">Bestseller</label>
                                                <select name="bestseller" class="form-control custom-select" data-placeholder="Choose a Resto" tabindex="1">
                                                    <option value="t" selected>Tidak</option>
                                                    <option value="y">Ya</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label">Termurah</label>
                                                <select name="termurah" class="form-control custom-select" data-placeholder="Choose a Resto" tabindex="1">
                                                    <option value="t" selected>Tidak</option>
                                                    <option value="y">Ya</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                        </div>
                        <div class="form-actions">
                            <input type="submit" name="submit" class="btn btn-success" value="Save" style="background: rgb(0, 188, 126);">
                            <a href="dashboard.php" class="btn btn-warning">Batal</a>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End PAge Content -->
    </div>

    </div>
    <!-- End Page wrapper  -->
    </div>
    <!-- End Wrapper -->
    <!-- All Jquery -->
    <script src="js/lib/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="js/lib/bootstrap/js/popper.min.js"></script>
    <script src="js/lib/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>

</body>

</html>