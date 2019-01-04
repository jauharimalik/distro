<?php
defined('__NOT_DIRECT') || define('__NOT_DIRECT',1);
include 'lib/config.php';
include 'lib/fungsi_seo.php';
include 'lib/addtocart.php';
include 'ongkir/config.php'; 
switch ($_GET['act']) {
	case 'cart':
		$subtotal = 0;$submasa = 0;
		if(empty($_SESSION['cart'])){
			$_SESSION['subtotal'] = 0;$submasa = 0;
			if (empty($_SESSION['ecust'])) {
			header('location:sign');
			} else {header('location:akun-saya');}
		}
		if (isset($_REQUEST['command'])) {		
			if($_REQUEST['command']=='delete' && $_REQUEST['pid']>0){
				remove_product($_REQUEST['pid']);
			}			
			else if($_REQUEST['command']=='update'){
				$max=count($_SESSION['cart']);
				for($i=0;$i<$max;$i++){
					$pid=$_SESSION['cart'][$i]['produkid'];
					$q=intval($_REQUEST['qty'.$pid]);
					if($q>0 && $q<=999){
						$_SESSION['cart'][$i]['qty']=$q;
					}					
				}
			}
		}
		?>
		<div class="shop-cart">
			<div class="container clear">
				<h3 class="title">Keranjang Belanja</h3>
				<div>
					<?php 
					if (!empty($_SESSION['cart'])) {
					?>
					<form name="formcart" class="form" action="" method="post">
						<input type="hidden" name="command">
						<input type="hidden" name="pid">						
						<table class="cart">
							<tr>
								<th colspan="2">PRODUK</th>
								<th>HARGA</th>
								<th>QTY</th>
								<th colspan="2">TOTAL</th>
							</tr>
					<?php								
						if (is_array($_SESSION['cart'])) {
							$max = count($_SESSION['cart']);							
							for ($i=0; $i<$max; $i++) {
								$pid = $_SESSION['cart'][$i]['produkid'];
								$q = $_SESSION['cart'][$i]['qty'];
								$s = $_SESSION['cart'][$i]['size'];

								
								$data = mysql_fetch_array(mysql_query("select * from produk where produk_id = '$pid'"));
								$total = $q * $data['harga'];
								$subtotal += ($q * $data['harga']);
								
								$_SESSION['subtotal'] = $subtotal;										
								$nama_seo = seo_title($data['produk_nama']);
								$masa = $data['berat'];
								$submasa += ($q * $data['berat']);
								?>
							<tr>
								<td width="110px"><img src="upload/produk/thumb/<?php echo $data['image']; ?>"></td>
								<td style="text-align: left">
									<a href="item-<?php echo $data['produk_id']."-".$nama_seo.""; ?>" class="nama"><?php echo $data['produk_nama']; ?></a>
									<p>Ukuran: <?php echo $s; ?></p>
								</td>
								<td>Rp. <?php echo number_format($data['harga'], 0,',','.');?></td>
								<td>
									<div class="qty-block quantity buttons_added">
										<input type="button" value="-" class="minus">
										<input name="qty<?php echo $pid ?>" type="text" step="1" name="quantity" title="Qty" class="input-qty qty" size="1" min="1"  value="<?php echo $q; ?>">
										<input type="button" value="+" class="plus">
									</div>								
									<!--<input type="text" name="qty<?php echo $pid ?>" type="text" value="<?php echo $q; ?>" size="2" style="text-align:center">-->
								</td>
								<td>Rp. <?php echo number_format($total, 0,',','.'); ?></td>
								<td width="11px"><div class="hapus"><a href="javascript:del(<?php echo $pid ?>)" title="Hapus dari keranjang"><i class="fa fa-trash-o"></i></a></div></td>
							</tr>
						<?php									
							}
						?>
							<tr>
								<td colspan="3" style="border-bottom:none">
									<div style="float:left">
										<input type="button" name="update" value="UPDATE CART" onclick="update_cart()" class="buton primary">
									</div>
								</td>
								<td style="border-bottom:none"><div class="pull-right">SUB TOTAL</div></td>
								<td colspan="2" style="border-bottom:none">
									<div class="subtotal">Rp. <?php echo number_format($subtotal, 0,',','.'); ?></div>
								</td>
							</tr>						
						</table>
						<div style="margin-top:30px">
							<div class="cart-proses">
								<input type="button" name="checkout" class="buton primary" value="PROSES BELANJA" onclick="window.location='checkout'">
								<p style="margin-top:20px; font-style: italic; font-size: 90%">*) Harga Sub Total belum termasuk ongkos kirim</p>
							</div>
						</div>
					</form>
					<?php
						} 
					} else {
					//jika tidak ada barang
					?>
					<div class="empty-cart">
						<i class="fa fa-shopping-cart"></i>	
						<h2>Keranjang Belanja Kamu Kosong</h2>
						<p>Silahkan berbelanja, kemudian tambahkan ke cart kamu</p><br>
						<a class="buton primary" href="katalog">Kembali Berbelanja</a>
					</div>					
					<?php 
					} 
					?>							
				</div>
			</div>
		</div>
		<script language="javascript">
			function del(pid){				
				document.formcart.pid.value=pid;
				document.formcart.command.value='delete';
				document.formcart.submit();			
			}
			function update_cart(){
				document.formcart.command.value='update';
				document.formcart.submit();
			}
		</script>
		<?php
		break;
	
	case 'checkout':
		if (empty($_SESSION['ecust'])) {
			header('location:sign');
		} else {?>

		<link href="assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="assets/css/style.css" rel="stylesheet">
			<div class="shop-cart">
				<div class="container clear">
					<h3 class="title">ALAMAT PENGIRIMAN</h3>
					<hr style="border: 0; border-top: 1px solid #eee; margin-bottom: 20px;">
					<div style="width: 75%; margin: 0 auto">
						<form name="formshipping" class="form form-cust" action="detail-order" method="post">
							<input  type="hidden" name="pengirim" id="pengirim" value="55" class="form-control ongkir">
							<label>Nama Lengkap<span class="required">*</span></label>
							<input type="text" name="nama" value="<?php echo $cust[0] ?>" required>
							<label>Provinsi<span class="required">*</span></label>
							<select  name="provinsi" class="form-control provinsi" id="provinsi" required>
							<?php
							$prov = $db->query("SELECT * FROM tbl_provinsi");
							echo'<option>Pilih Provinsi</option>';
							while ($dataprov = $prov->fetch(PDO::FETCH_ASSOC)) {
							echo'<option value="'.$dataprov['provinsi_id'].'">'.$dataprov['provinsi'].'</option>';
							}
							?>
							</select>
							<label>Kota / Kabupaten<span class="required">*</span></label>
							<select  name="kota" class="form-control kota" id="kota" required>
							</select>		
							<label>Kurir <span class="required">*</span></label>
							<select name="kurir" class="form-control kurir" id="kurir" required>
									<option value="">Pilih Ekspedisi</option>
									<option value="jne">JNE</option>
									<option value="pos">POS</option>
									<option value="tiki">TIKI</option>
							</select>	
							<label>Jenis <span class="required">*</span></label>
							<select name="jenis" class="form-control jenis" id="jenis" required>
							</select>							
							<label>Kode Pos<span class="required">*</span></label>
							<input  type="text" pattern="[1-9]{5}" name="kodepos" required>
							<label>Alamat<span class="required">*</span></label>
							<textarea name="alamat" style="height:80px" required></textarea>
							<label>No. Handphone<span class="required">*</span></label>
							<input maxlength="12" type="tel" name="phone" required>
							<input  type="hidden" name="ongkir" id="ongkir" class="form-control ongkir">
							<div style="margin-top:30px">
								<div class="cart-proses">
									<input type="submit" name="billingaddr" class="buton primary" value="LANJUTKAN">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/scripts.js"></script>
    <script src="assets/js/custom.js"></script>			
			<?php
		}
		break;

	case 'detailorder':
		if (empty($_SESSION['ecust'])) {
			header('location:sign');
		} else {
			?>
			<div class="shop-cart">
				<div class="container clear">
					<h3 class="title">DETAIL PEMESANAN</h3>
					<hr style="border: 0; border-top: 1px solid #eee; margin-bottom: 20px;">
					<div style="margin: 0 auto">
						<?php 
						if (isset($_POST['nama'])  && isset($_POST['kota']) && isset($_POST['provinsi']) && isset($_POST['kodepos']) && isset($_POST['alamat'])&& isset($_POST['ongkir'])) {
							?>
						<form name="formshipping" class="form form-cust" action="invoice" method="post">
							<div style="width:50%">
								<label>Dikirim Kepada:</label>
								<label><b style="font-family: 'ProximaNova-Bold', sans-serif;"><?php echo $_POST['nama'] ?></b></label>
								<label><?php echo $_POST['alamat'] ?></label>
								<label><?php $kota2 =  $_POST['kota']; $kota1 = $db->query("SELECT * FROM tbl_kota WHERE kota_id = '$kota2'");$data = $kota1->fetch(PDO::FETCH_ASSOC);$kota=$data['kota']; echo $data['kota']; echo " - ".$_POST['kodepos'] ?></label>
								<label><?php $province = $_POST['provinsi'];$prov = $db->query("SELECT * FROM tbl_provinsi WHERE provinsi_id = '$province'");$data = $prov->fetch(PDO::FETCH_ASSOC);echo $data['provinsi'];?></label>
								
								<label>Nomor Telp : <?php echo $_POST['phone'] ?></label>
								<?php 
								//membuat kode order id
								$kode = strtoupper(substr(uniqid(), 7));
								$kodeord = strtoupper(substr($kota2, 0, 3)).$kode; 
								?>
								<input type="hidden" name="kodeord_" value="<?php echo $kodeord ?>">
							</div>

							<input type="hidden" name="nama_" value="<?php echo $_POST['nama'] ?>">
							<input type="hidden" name="kota_" value="<?php echo $kota ?>">
							<input type="hidden" name="provinsi_" value="<?php echo $data['provinsi'] ?>">
							<input type="hidden" name="kodepos_" value="<?php echo $_POST['kodepos'] ?>">
							<input type="hidden" name="alamat_" value="<?php echo $_POST['alamat'] ?>">
							<input type="hidden" name="phone_" value="<?php echo $_POST['phone'] ?>">
							<input type="hidden" name="ongkir_" value="<?php echo $_POST['ongkir'] ?>">

							<table class="cart" style="margin-top:20px;">
								<tr>
									<th>NO</th>
									<th>PRODUK</th>
									<th>SIZE</th>
									<th>HARGA</th>
									<th>QTY</th>
									<th>TOTAL</th>
								</tr>
								<?php
								$subtotal = 0; $submasa = 0;
								if (!empty($_SESSION['cart'])) {
									
									if (is_array($_SESSION['cart'])) {
										$max = count($_SESSION['cart']);
										$no=1;							
										for ($i=0; $i<$max; $i++) {
											$pid = $_SESSION['cart'][$i]['produkid'];
											$q = $_SESSION['cart'][$i]['qty'];
											$s = $_SESSION['cart'][$i]['size'];											
											
											$data = mysql_fetch_array(mysql_query("select * from produk where produk_id = '$pid'"));
											$total = $q * $data['harga'];
											$subtotal += ($q * $data['harga']);											
																					
											$nama_seo = seo_title($data['produk_nama']);
											$masa = $data['berat'];
											$submasa += ($q * $data['berat']);
											?>
											<tr>
												<td width="auto"><?php echo $no; ?></td>
												<td style="text-align: left; width: 40%"><?php echo strtoupper($data['produk_nama']); ?></td>
												<td><?php echo $s; ?></td>
												<td>Rp. <?php echo number_format($data['harga'], 0,',','.');?></td>
												<td><?php echo $q; ?></td>
												<td>Rp. <?php echo number_format($total, 0,',','.'); ?></td>												
											</tr>
											<?php $no++;								
										}
									} 
								} else {								

									//jika tidak ada barang
									?>
									<tr>
										<td colspan="6">Tidak ada barang</td>
									</tr>						
								<?php 
								} 
								?>	
								<tr>
									<td colspan="5" style="border-bottom:none"><div class="pull-right">SUB TOTAL</div></td>
									<td style="border-bottom:none">
										<div class="subtotal">Rp. <?php echo number_format($subtotal, 0,',','.'); ?></div>
									</td>
								</tr>	
								<tr>
									<td colspan="5" style="border-bottom:none"><div class="pull-right">Ongkir</div></td>
									<td style="border-bottom:none">
									<?php $total_ongkir = ((($submasa/1000)+1)*$_POST['ongkir']);?>
										<div class="ongkir">Rp. <?php echo number_format($total_ongkir, 0,',','.'); ?></div>
									</td>
								</tr>	
								<tr>
									<td colspan="5" style="border-bottom:none"><div class="pull-right">Total</div></td>
									<td style="border-bottom:none">
										<div class="total">Rp. <?php echo number_format(($subtotal+$total_ongkir), 0,',','.'); ?></div>
										<input type="hidden" name="ongkir_" value="<?php echo $total_ongkir; ?>">
									</td>
								</tr>									
								<tr>
									<td colspan="6" style="text-align:right; font-style:italic; border-bottom:none">*) Belum termasuk ongkos kirim</td>
								</tr>					
							</table>
							<div style="margin-top:30px">							
								<div class="cart-proses">
									<input type="submit" name="ordernow" class="buton primary" value="PESAN SEKARANG">
								</div>	
								<div class="cart-proses" style="float:left">
									<a onclick="history.back()" class="buton primary">KEMBALI</a>
								</div>							
							</div>
						</form>
						<?php 
					} else {
						echo "<div class=\"msg msg-warn\" style=\"margin-bottom:120px\">
								<i class=\"fa fa-warning\" style='vertical-align:middle'></i> Anda Belum melakukan pengisian form Alamat Pengiriman
							</div>";
					}
					?>
					</div>
				</div>
			</div>
			<?php
		} //else jika sudah login
		break;

	case 'invoice':
		if (isset($_POST['ordernow'])) {
			$kodeord = $_POST['kodeord_'];
			$custid = $_SESSION['custid'];
			$nama = $_POST['nama_'];
			$kota = $_POST['kota_'];
			$provinsi = $_POST['provinsi_'];
			$kodepos = $_POST['kodepos_'];
			$alamat = $_POST['alamat_'];
			$phone = $_POST['phone_'];
			$ongkir_ = $_POST['ongkir_'];

			mysql_query("insert into orders values('$kodeord', '$custid', '$nama', '$kota', '$provinsi', '$kodepos', '$alamat', '$phone', now(), 'Menunggu', '0', '0','$ongkir_')");
		

			$max=count($_SESSION['cart']);
			for ($i=0; $i<$max; $i++) {
				$pid = $_SESSION['cart'][$i]['produkid'];
				$q = $_SESSION['cart'][$i]['qty'];
				$s = $_SESSION['cart'][$i]['size'];			
				
				$data = mysql_fetch_array(mysql_query("select * from produk where produk_id = '$pid'"));
				$total = $q * $data['harga'];
				$subtotal=0;
				$subtotal += ($q * $data['harga']);
				
			
			mysql_query("insert into order_detail values('', '$kodeord', '$pid', '$s', '$q', '$total')");

			}
			unset($_SESSION['cart']);
			$d = mysql_fetch_array(mysql_query("select * from orders where order_id='$kodeord'"));
			$c = mysql_query("select p.produk_nama, o.size, p.harga, o.qty, o.total from order_detail o, produk p where o.produk_id=p.produk_id and o.order_id='$kodeord'");

		?>
		<div class="shop-cart">
			<form name="formshipping" class="form form-cust" action="konfirmasi-pembayaran" method="post">
			<div class="container clear">
				<h3 class="title">FAKTUR PEMESANAN</h3>
				<hr style="border: 0; border-top: 1px solid #eee; margin-bottom: 20px;">
				<div class="clear">
					<div style="float:left">
						<?php 
							
						?>
						<table class="inv">
							<tr>
								<td colspan="3"><h4>Customer</h4></td>
							</tr>
							<tr>
								<td width="">Nama</td>
								<td>: </td>
								<td><?php echo $d['nama']?></td>
							</tr>
							<tr>
								<td>Kota</td>
								<td>: </td>
								<td><?php echo $d['kota']?></td>
							</tr>
							<tr>
								<td>Provinsi</td>
								<td>: </td>
								<td><?php echo $d['provinsi']?></td>
							</tr>
							<tr>
								<td>Alamat</td>
								<td>: </td>
								<td><?php echo $d['alamat']." ".$d['kodepos']?></td>
							</tr>
							<tr>
								<td>No. Handphone</td>
								<td>: </td>
								<td><?php echo $d['phone']?></td>
							</tr>
						</table>
					</div>
					<div class="clear" style="float:right;text-align:right;">
						<p>Tanggal : <?php echo date('d/m/Y', strtotime($d['tgl_pesan']))?></p>
						<p style="font-size: 16px; font-family: 'ProximaNova-Bold', sans-serif;">No. ID Pemesanan</p>
						<h2><?php echo $d['order_id']?></h2>
					</div>
				</div>
				<div class="clear" style="margin:20px 0;">
					<table class="listprod">
						<tr>
							<th>NO</th>
							<th>PRODUK</th>
							<th>SIZE</th>
							<th>HARGA</th>
							<th>QTY</th>
							<th>TOTAL</th>
						</tr>	
						<?php
						$no=1;
						while ($data = mysql_fetch_array($c)) {
						?>																	
						<tr>
							<td><?php echo $no; ?></td>
							<td style="text-align: left; width:40%;"><?php echo $data['produk_nama']; ?></td>
							<td><?php echo $data['size']; ?></td>
							<td><?php echo "Rp. ".number_format($data['harga'], 0,',','.'); ?></td>
							<td><?php echo $data['qty']; ?></td>
							<td><?php echo "Rp. ".number_format($data['total'], 0,',','.'); ?></td>												
						</tr>	
						<?php
							$no++;
						}
						?>																	

						<tr>
							<td colspan="5"><div class="pull-right">SUB TOTAL</div></td>
							<td>
								<div class="subtotal">
									<?php 
									$sub = mysql_fetch_array(mysql_query("select sum(total) as subtotal from order_detail where order_id='$kodeord' group by order_id"));
									echo "Rp. ".number_format($sub['subtotal'], 0,',','.'); 
									?>
								</div>
							</td>
						</tr>			
						<tr>
							<td colspan="5"><div class="pull-right">Ongkir</div></td>
							<td>
								<div class="subtotal">
									<?php 
									echo "Rp. ".number_format($d['ongkir'], 0,',','.'); 
									?>
								</div>
							</td>
						</tr>		
						<tr>
							<td colspan="5"><div class="pull-right">Total</div></td>
							<td>
								<div class="subtotal">
									<?php 
									echo "Rp. ".number_format(($d['ongkir']+$sub['subtotal']), 0,',','.'); 
									?>
								</div>
							</td>
						</tr>						
					</table>
				</div>
				<p style="text-align:right; font-style:italic; border-bottom:none">*) Belum termasuk ongkos kirim</p>
				<div class="clear">
					<ul style="-webkit-padding-start: 20px;">
						<li>Silahkan lakukan pembayaran ke Bank BNI 0857 8155 0337 a.n HAS Collection<br>atau ke Bank BRI 0857 8155 0337 a.n HAS Collection</li>
						<li>Apabila tidak melakukan pemabayaran selama 2x24 jam, pemesanan dianggap batal</li>
						<li>Jika sudah melakukan pembayaran / transfer, silahkan melakukan konfirmasi pemabayaran <br>dengan memasukan <b>No. ID Pemesanan</b></li>
					</ul>
					<div class="cart-proses">
					<input type="hidden" name="orderid" value="<?php echo $d['order_id']?>">
					<input type="submit" name="confrm2" class="buton primary" value="Konfirmasi Pembayaran">
					</div>
					<button class="buton" onclick="window.print();" style="float:right"><i class="fa fa-print"></i> Print</button>
				</div>
			</div></form>
		</div>
		<?php
		} else {
		?>
		<div class="shop-cart">
			<div class="container clear">
				<h3 class="title">FAKTUR PEMESANAN</h3>
				<hr style="border: 0; border-top: 1px solid #eee; margin-bottom: 20px;">
				<div class="msg msg-warn" style="margin-bottom:120px">
					<i class="fa fa-warning" style="vertical-align:middle"></i> Anda tidak memiliki invoice 
				</div>
			</div>
		</div>
		<?php
		}	
		break;

	case 'konfrmbayar':
		$pesan="";
		if (isset($_REQUEST['orderid'])) {$orderid = $_POST['orderid'];}
		if (isset($_POST['confrm'])) {
			
			$cariid = mysql_query("select order_id from orders where order_id='".$orderid."'");
			if (mysql_num_rows($cariid) != 0) {
				$bank = $_POST['bank'];
				$anpemilik = $_POST['namapemilik'];
				$rekpemilik = $_POST['rekpemilik'];
				$rektujuan = $_POST['rektujuan'];
				$jmltransfer = $_POST['transfer'];
				$ket = $_POST['ket'];

				$q_pembayaran = mysql_query("insert into pembayaran values('', '$orderid', '$bank', '$anpemilik', '$rekpemilik', '$rektujuan', '$jmltransfer', '$ket', now(), '0')");
				if ($q_pembayaran) {
					$pesan = "<div class=\"msg msg-sukses\"><i class=\"fa fa-check-square-o\" style='vertical-align:middle'></i> Terima kasih, pesanan anda akan segera kami proses</div>"; 
				} else {
					$pesan = "<div class=\"msg msg-warn\"><i class=\"fa fa-warning\" style='vertical-align:middle'></i> Oops, Terjadi kesalahan</div>";
				}
				
			} else {
				$pesan = "<div class=\"msg msg-warn\"><i class=\"fa fa-warning\" style='vertical-align:middle'></i> Nomor ID Pemesanan tidak diketahui</div>";
			}
		}
		?>
			<div class="shop-cart">
				<div class="container clear">
					<?php echo $pesan; ?>
					<h3 class="title">KONFIRMASI PEMBAYARAN</h3>
					<hr style="border: 0; border-top: 1px solid #eee; margin-bottom: 20px;">
					<div style="width: 75%; margin: 0 auto">
						<form name="formshipping" class="form form-cust" action="" method="post">
							<label>Nomor ID Pemesanan<span class="required">*</span></label>
							<?php if (isset($orderid)) { ?><input  name="orderid" value="<?php echo $orderid;?>" required disabled><?php }else { ?>	
							<input type="text" name="orderid" value="<?php echo $orderid;?>" required>
							<?php } ?>							
							<label>Nama Bank<span class="required">*</span></label>
							<input type="text" name="bank" required>							
							<label>Atas Nama (a.n)<span class="required">*</span></label>
							<input type="text" name="namapemilik" required>
							<label>No. Rekening</label>
							<input type="text" name="rekpemilik">
							<label>No. Rekening Tujuan</label>
							<select name="rektujuan" required>
								<option value="BNI">BNI (0857 8155 0337 a.n HAS Collection)</option>
								<option value="BRI">BRI (0857 8155 0337 a.n HAS Collection)</option>
							</select>
							<label>Jumlah Transfer (Rp)<span class="required">*</span></label>
							<input type="text" name="transfer" required>
							<label>Keterangan</label>
							<input type="text" name="ket">
							<label style="margin-top:15px;font-size:85%"><b>Note</b>: Jumlah Transfer diisi dengan nominal tanpa titik atau koma, contoh: 265000</label>
							<div style="margin-top:30px">
								<div class="cart-proses">
									<input type="submit" name="confrm" class="buton primary" value="SUBMIT">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		<?php
		break;

	default:
		# code...
		break;
}
?>
