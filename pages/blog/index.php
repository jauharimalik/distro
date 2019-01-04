<?php
defined('__NOT_DIRECT') || define('__NOT_DIRECT',1);
include 'lib/config.php';
include 'lib/fungsi_seo.php';

switch ($_GET['act']) {
	case 'artikel':
	$entri = mysql_query("SELECT * FROM berita where status='Y' ORDER BY berita_id DESC LIMIT 10");
	$artikelpopuler = mysql_query("SELECT * FROM berita ORDER BY dibaca DESC LIMIT 5");
		?>
		<div style="margin-top:90px; padding-top: 60px; padding-bottom: 20px;">
			<div class="container clear">
				<div class="maincol">					
					<?php
					while ($artikel=mysql_fetch_array($entri)) {
						$isi = html_entity_decode($artikel['isi_berita']);
						$headline = substr($isi, 0, 600);
						$headline = substr($isi, 0, strrpos($headline, " "));
						$judul_seo = seo_title($artikel['judul']);
					?>
						<div class="recent">
							<div class="head-title"><h3 class="title"><a href="<?php echo "artikel-$artikel[berita_id]-$judul_seo"?>"><?php echo $artikel['judul']; ?></a></h3><br>
						</div> 
							<hr class="dashed" style="margin-bottom:1px;">
							<span class="tgl" style="padding-left: 20px;"><?php echo date('d F Y', strtotime($artikel['tanggal'])); ?></span>
							<hr class="dashed">
							<p><?php echo $headline."..."; ?></p>
							<hr class="dashed">
						</div>
					<?php
					}
					?>
				
				</div>
				<aside class="sidebar">
					<h3>Berita Populer</h3>
					<ul>
					<?php
					while ($populer=mysql_fetch_array($artikelpopuler)) {
					$judul_seo = seo_title($populer['judul']);
					?>
						<li>
							<h3><a href="<?php echo "artikel-$populer[berita_id]-$judul_seo"?>"><?php echo $populer['judul']; ?></a></h3>
							<span class="tgl"><?php echo date('d F Y', strtotime($populer['tanggal'])); ?></span>
						</li>
					<?php
					}
					?>
					</ul>
				</aside>				
			</div>				
		</div>
		<?php
		break;

	case 'detailartikel':
		$detailartikel = mysql_query("SELECT * FROM berita b, berita_kategori bk, users u 
										WHERE b.kategori_id=bk.kategori_id
										AND b.user_id=u.user_id
										AND berita_id='$_GET[bid]'");
		$d = mysql_fetch_array($detailartikel);
		$tgl = date('l, d F Y - H:i', strtotime($d['tanggal']));
		$isi = html_entity_decode($d['isi_berita']);

		$artikelpopuler = mysql_query("SELECT * FROM berita ORDER BY dibaca DESC LIMIT 5");

		mysql_query("update berita set dibaca=$d[dibaca]+1 where berita_id='$_GET[bid]'");
		?>
		<div style="margin-top:90px; padding-top: 60px; padding-bottom: 50px;">
			<div class="container clear">
				<div class="maincol">
					<h1><?php echo $d['judul'];?></h1>
					<span class="meta"><?php echo $tgl." WIB";?></span>
					<?php
					if ($d['gambar']!="") {
						echo "<img src=\"upload/berita/$d[gambar]\">";
					}
					?>
					<p><?php echo $isi;?></p>
					<small>Kontributor: <em><?php echo $d['fullname']; ?></em></small>
<div id="disqus_thread"></div>
<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
/*
var disqus_config = function () {
this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
*/
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = '//jauharimalik.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<script id="dsq-count-scr" src="//jauharimalik.disqus.com/count.js" async></script>		
				</div>
				<aside class="sidebar">
					<h3>Berita Populer</h3>
					<ul>
					<?php
					while ($populer=mysql_fetch_array($artikelpopuler)) {
					$judul_seo = seo_title($populer['judul']);
					?>
						<li>
							<h3><a href="<?php echo "artikel-$populer[berita_id]-$judul_seo"?>"><?php echo $populer['judul']; ?></a></h3>
							<span class="tgl"><?php echo date('d F Y', strtotime($populer['tanggal'])); ?></span>
						</li>
					<?php
					}
					?>
					</ul>
				</aside>
			</div>
		</div>
		<?php

		break;

	default:
		# code...
		break;
}
?>