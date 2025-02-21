<?php
include("../../../connection/connect.php");
error_reporting(0);
session_start();
mysqli_query($db, "DELETE FROM menu_category WHERE m_id = '" . $_GET['cat_del'] . "'");
header("location:../../add_category_menu.php");
