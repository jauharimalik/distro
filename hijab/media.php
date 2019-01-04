<?php
	session_start(); 
	if(empty($_SESSION['cart'])){
		$_SESSION['subtotal'] = 0;
	}
	defined('__NOT_DIRECT') || define('__NOT_DIRECT',1);
	include 'lib/config.php';
	
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="refresh" content="300">
	<title><?php include 'lib/title.php'; ?></title>
	<link rel="shortcut icon" href="assets/img/favico.png">
	<link rel="stylesheet" href="assets/css/carousel.css">
	<link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome/css/font-awesome.min.css">
	<!--<link rel="stylesheet" type="text/css" href="assets/css/AdminLTE.css">-->
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body>	
	<nav class="navbar">
		<div class="navtop">
			<div class="container">
				<div class="navtop-call">Hub: <?php echo $d_telp; ?> / <?php echo $d_bbm; ?></div>
				<div class="navtop-sign">
					<ul>
						<li>
							<?php							
							if (empty($_SESSION['cust'])) {
								echo "<a href=\"sign\" class=\"shopping\">Sign In</a>";
							} else {
								$cust=explode(" ", $_SESSION['cust']);
								echo "Haii, <a href='akun-saya' style='color:#fff'>".$cust[0]."</a> / <a href=\"logout\" class=\"shopping\">Logout</a>";							
							}
							?>
							
						</li>
						<li>
							<a href="cart" class="shopping">Shopping Cart</a>
							<?php
							if(empty($_SESSION['subtotal'])) { 
								$_SESSION['subtotal'] = 0;
								echo "- Rp. 0,-"; 
								
							} else {
								echo "- Rp. ".number_format($_SESSION['subtotal'], 0,',','.').",-"; 
							}

							?>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div>
			<div class="container">
				<div class="navbar-brand">
					<a href="index">
						<img src="assets/img/umil-logo.svg">
					</a>
				</div>
				<div class="navbar-right">
					<ul>
						<li><a href="index">HOME</a></li>
						<li><a href="katalog">PRODUK</a></li>
						<li><a href="cara-belanja">CARA BELANJA</a></li>
						<li><a href="konfirmasi-pembayaran">KONFIRMASI</a></li>
						<li><a href="blog">BLOG</a></li>
						<li><a href="http://localhost/hijab/artikel-47-kontak">CONTACT</a></li>
					</ul>					
				</div>
			</div>
		</div>
	</nav>
	<div class="konten">
		<?php
		include 'content.php';
		?>
	</div>
	
	
	<footer>
		<div class="container clear">
			<div class="info">
				<h3 class="title">Info</h3>
				<ul>
					<li><a href="#">Tentang Kami</a></li>
					<li><a href="cara-belanja">Cara Belanja</a></li>
					<li><a href="cara-pembayaran">Cara Bayar</a></li>
					<li><a href="#">Request</a></li>					
				</ul>
			</div>
			<div class="info">
				<h3 class="title">Akunku</h3>
				<ul>
					<li><a href="akun-profile">Info Akun</a></li>
					<li><a href="akun-saya">Riwayat Pesanan</a></li>
					<li><a href="konfirmasi-pembayaran">Konfirmasi Pembayaran</a></li>			
				</ul>
			</div>			
			<div class="address">
				<div class="col-sm-6 col-md-3 collapsed-block ">
						<div class="module clearfix">
							<h3 class="title">Contact Us</h3>
							<div class="modcontent">
								<ul class="contact-address">
									<li><span class="fa fa-map-marker"></span> <?php echo $c_title;?> : <br> Ruko Sentra Office Blok D No. 35
									JL. Boulevard Grand Galaxy Park,Bekasi </li>
									<li><span class="fa fa-envelope-o"></span> Email: <a href="yugo@vanectro.com"> yugo@vanectro.com</a></li>
									<li><span class="fa fa-phone">&nbsp;</span> Telp : 021 8273 4558<br>  SMS : 0896 3377 6095</li>
								</ul>							
							</div>
						</div>
					</div>
			</div>
		</div>
		<div class="container clear">
			<div class="copy">
				<p><a href="./"></a> &copy; <?php echo date('Y');?> <?php echo $c_title;?> All rights reserved</p>
			</div>
		</div>
	</footer>

	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-584e7c21dc425ee1"></script> 
	<script type="text/javascript" src="//www.vanectro.com/livechat/php/app.php?widget-init.js"></script>

	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/modernizr.custom.86080.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/woocommerce.min.js"></script>
	<script src="assets/js/jquery.nicescroll.min.js"></script>
    <script src="assets/js/jquery.elevatezoom.js"></script>
	<script>
	    $('#zoom_01').elevateZoom({
	    	zoomType: "inner",
			cursor: "crosshair",
			zoomWindowFadeIn: 500,
			zoomWindowFadeOut: 750
		}); 
		$(document).ready( function() {
			$("html").niceScroll();
		});
		var ajaxFilterEnabled = 1;
	</script>
</body>
</html>