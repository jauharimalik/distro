-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2016 at 09:21 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hijab`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE IF NOT EXISTS `berita` (
  `berita_id` int(4) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `isi_berita` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `dibaca` int(4) NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `kategori_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`berita_id`, `judul`, `isi_berita`, `tanggal`, `gambar`, `dibaca`, `status`, `kategori_id`, `user_id`) VALUES
(40, 'Muslimah Remaja AS Ajak Non-Muslim Coba Pakai Hijab', 'KAIRO - Seorang muslimah remaja di AS meluncurkan proyek eksperimen di mana wanita Muslim dan non-Muslim diajak untuk menggunakan hijab dan membagikan pengalaman mereka. Proyek ini dilakukan untuk menentang kesalahpahaman mengenai hijab.&lt;br&gt;&lt;br&gt;Penemu proyek tersebut, Amara Majeed (16 tahun), mengatakan Proyek Hijab adalah eksperimen sosial bagi perempuan Muslim dan non-Muslim. â€œCobalah pakai hijab ke sekolah, mall dan tempat publik lainnya. Lihatlah reaksi masyarakat. Apakah mereka membeda-bedakanmu? Bagi pengalamanmu disini,â€ tulis Majeed dalam situs Hijab Project, seperti yang dikutip dari Onislam.net, Kamis (23/1).&lt;br&gt;&lt;br&gt;Sebagai Muslim yang tinggal di AS, Majeed ingin menjembatani celah antara Islam dan kepercayaan lainnya. Ia juga ingin memberikan pesan kesopanan di belakang hijab. â€œJembatan pemahaman harus dibangun di antara Muslim dan non-Muslim,â€ ujar dia.&lt;br&gt;&lt;br&gt;Proyek yang diluncurkan pada Desember lalu telah mendapatkan reaksi global. Ratusan perempuan di dunia mencoba menggunakan hijab di tempat umum. Seorang siswa sekolah Kristen mengatakan bahwa ia merasa terproteksi ketika menggunakan hijab â€œPada awalnya, hijab tak nyaman karena saya terlalu kencang memakainya. Tapi setelah beberapa minggu, menggunakan hijab memberikan proteksi dan kehangatan,â€ tulis gadis tersebut dalam situs Hijab Project.&lt;br&gt;Menurutnya, menggunakan hijab telah mengubah pandangannya terhadap Islam, terutama pada masyarakat yang melarang praktek-praktek Islami.&lt;br&gt;REPUBLIKA.CO.ID,&lt;br&gt;&lt;br&gt;', '2015-01-16 10:16:16', '24011509454.jpg', 19, 'Y', 3, 17),
(42, 'Gerakan Gunakan Hijab di Australia Panen Dukungan Non-Muslim', 'CANBERRA-Sebuah kampanye di media sosial muncul setelah peningkatan tindakan diskriminasi terhadap perempuan muslim di Australia. Gerakan bertagar Women in Solidarity (with) hijab atau #WISH mengajak seluruh perempuan, baik muslim maupun non muslim untuk mengenakan hijab ataupun kerudung.&lt;br&gt;&lt;br&gt;Khususnya untuk merasakan bagaimana mengenakan hijab dan pandangan masyarakat terhadap mereka. Gerakan kebebasan beragama yang diluncurkan 10 hari lalu ini telah menarik 18 ribu &quot;likes&quot; di Facebook.&lt;br&gt;&lt;br&gt;Dikutip dari laman abc.net.au, saat ini terjadi perdebatan mengenai pelarangan burka di masyarakat. Di saat yang sama serangan rasial terhadap perempuan muslim terjadi setiap hari.&lt;br&gt;&lt;br&gt;Gerakan ini sendiri dimotori pengacara bernama Mariam Veiszadeh. Ia sebenarnya seorang pengungsi Afghanistan yang kemudian tinggal di Australia.&lt;br&gt;&lt;br&gt;Ia mengaku respon dari berbagai kalangan luar biasa. Begitu banyak foto-foto menakjubkan, ucap dia, mengenai dukungan memakai hijab.&lt;br&gt;&lt;br&gt;&quot;Tidak hanya perempuan muslim Australia, tapi semua orang menunjukkan sikap dengan foto&amp;nbsp; yang berdampak luas pada masyarakat,&quot; ucap dia dikutip dari abc, Kamis (2/10).&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;', '2015-01-16 11:47:56', '1801150857Picture2.jpg', 21, 'Y', 4, 16),
(43, 'Lydia: Jangan Masalahkan Hijab, Tapi Hormati Muslimah', 'MELBOURNE - Lydia mengaku prihatin saat mendengar insiden islamofobia terjadi di Australia. Belum lagi perkara masalah larangan burka yang kini menjadi perbincangan di Parlemen Australia. Rasa keprihatinan ini menjadi benang merah ketika Lydia memutuskan memeluk Islam. Awalnya, Lydia seperti sebagian warga Australia mengaku geram dengan hal berbau Islam dan Muslim, apalagi soal Muslimah berhijab. &quot;Saya waktu itu berpikir, bagaimana seorang Muslim mengancam nyawa kamni. Saya pikir pula setiap Muslimah itu mengalami penindasan,&quot; kenang dia seperti dilansir news.au.com, Selasa (7/10).&lt;br&gt;&lt;br&gt;Saat itu, Lydia mengaku belum pernah berinteraksi dengan Muslim. Namun, itu tidak menghentikan pandanganya terhadap Islam dan Muslim. Pandangan baru berubah, saat ia mengunjungi Masjid Auburn Gallipoli. &quot;Kesalahpahaman saya hanyut. &lt;br&gt;&lt;br&gt;Ada kesamaan antara Islam dan Kristen. Kami memiliki cerita soal Nabi Adam, Ibrahim, Musa, Nuh, Yesus dan lainnya,&quot; ungkap dia. Sejak kunjungan pertama, Lydia secara rutin menyambangi masjid setiap Sabtu. Setiap menyambangi masjid, ia mengenakan hijab. Ada saja ilmu didapatnya usai mengunjungi masjid. &quot;Ada ayat yang mengatakan ketika seorang Muslim membunuh maka ia membunuh seluruh umat manusia,&quot; kata dia.&lt;br&gt;&lt;br&gt;Sejauh itu, memang belum ada rasa tertarik Lydia untuk lebih mendalami ajaran Islam. Ia masih pada tahapan mengkonfirmasi pertanyaan yang ada dipikirannya. Di luar itu, iapun memikirkan apa yang terjadi apabila dirinya memeluk Islam. Bagaimana orang tua, bagaimana koleganya ketika ia menjadi Muslim. &quot;Ketakutan itu begitu menghantui saya,&quot; ucap dia. Perasaan itu berangsur hanyut. Mulai muncul ketertarikan Lydia mendalami ajaran Islam. Sekelebat, Lydia semakin yakin untuk menjadi Muslim. &quot;Saya telah menimbang konsekuensi dari keputusan saya ini. Saya harus menjalani hidup yang berbeda dari apa yang dijalaninya selama ini,&quot; ucap dia. Alhamdulillah. Usai menjadi Muslim, Lydia segera mengenakan hijab. Baginya, hijab merupakan satu kewajiban seorang Muslimah sebagai wujud tanda komitmen terhadap Islam. Hijab juga bentuk penghormatan Islam terhadap Muslimah. &quot;Tidak benar, Muslimah mengenakan hijab karena suami mereka,&quot; kata dia. Lydia mengaku kesalahpahaman terbesar soal Muslimah adalah soal penindasan. &quot;Kami tidak dipaksa mengenakan hijab. Putusan ini murni dari diri sendiri,&quot; kata dia.&lt;br&gt;&lt;br&gt;Fakta inilah, kata Lydia, yang menjadi dasar pecelehan verbal atau fisik oleh orang asing. Tak terhitung berapa kali, Lydia kerap menerima pelecehan itu.&amp;nbsp; &quot;Lalu muncul ISIS (Negara Islam Irak dan Suriah), saya diancam dan diserang hanya karena ISIS itu bagian dari Islam,&quot; kata dia. Lydia berharap pemerintah Australia bisa melindungi umat Islam bukan mempermasalahkan hijab.&quot;Saya percaya ada banyak kesalahpahaman tentang islam dan Muslim. Mereka yang tidak tahu seharusnya datang kepada saya atau umat Islam. Kami tidak menakutkan banyak orang, kecuali saya tengah marah,&quot; kata dia. &lt;br&gt;&lt;br&gt;SUMBER: REPUBLIKA.CO.ID&lt;br&gt;&lt;br&gt;', '2015-01-18 20:47:17', '1801150847Picture1.jpg', 20, 'Y', 4, 16),
(44, 'Riasan ringan yang tetap memancarkan kesan glamor', 'Less is more. Untuk tampil memukau dalam berbagai kesempatan sehari-hari, all you need is light make up. Nude make up bisa memancarkan pesona diri Anda yang sebenarnya tanpa harus terlihat berlebihan dan berat. &amp;nbsp;Itâ€™s effortless.&lt;br&gt;&lt;ol&gt;&lt;li&gt;Aplikasikan foundation ringan yang menjadi base application dengan kuas atau spons. Baurkan dengan halus agar warnanya terkesan alami seperti kulit.&lt;/li&gt;&lt;li&gt;Untuk mata, aplikasikan eyeshadow warna kulit bershimmer halus sebagai pusat perhatian. Kemudian aplikasikan eyeliner berwarna cokelat atau caramel. Tambahkan maskara untuk mempertegas area mata.&lt;/li&gt;&lt;li&gt;Aplikasikan perona pipi warna emas yang dicampur dengan sedikit warna pink lembut. Anda akan mendapatkan pipi merona tanpa terlihat memakai make up.&lt;/li&gt;&lt;li&gt;Bingkai bibir Anda dengan lip liner senada dengan warna bibir. Kemudian aplikasikan lipstik pink segar agar penampilan tidak terlalu pucat. Agar tidak terlihat kering, tambahkan clear gloss.&lt;/li&gt;&lt;li&gt;Aplikasikan concealer dengan lembut di bagian bawah mata. Tepuk-tepuk agar concealer menutup dengan sempurna tanpa terlihat berbeda warna.&lt;/li&gt;&lt;li&gt;Pulas wajah dengan translucent powder untuk menyempurnakan penampilan.&lt;br&gt;&lt;br&gt;&lt;/li&gt;&lt;/ol&gt;&lt;div&gt;sumber:&amp;nbsp;&lt;a href=&quot;http://blog.elzatta.com/nude-mak&quot; rel=&quot;nofollow&quot; target=&quot;_blank&quot;&gt;http://blog.elzatta.com/nude-mak&lt;/a&gt;&lt;br&gt;&lt;/div&gt;', '2015-01-24 21:34:11', '', 22, 'Y', 2, 17),
(46, 'Fashion hijab Indonesia berlomba-lomba memberikan hasil kreasi yang bisa diterima pasar', 'Bicara hijab di Indonesia dan perkembangannya, tidak bisa dilepas peran HAS COLLECTIONS Charshaf hijab dengan produk jilbab HAS COLLECTIONS Charshaf atau kerudung HAS COLLECTIONS Charshaf, baik scarf/ kerudung segi empat, kerudung pashmina/ pashmina dan kerudung instan/ bergo. Fashion hijab muslimah dikenakan untuk menutup aurat dan sesuai dengan aturan syari. Begitu juga dengan hijab indonesia/ hijab HAS COLLECTIONS Charshaf. Produk hijab HAS COLLECTIONS Charshaf bukan hanya jilbab scarf/ kerudung segi empat, jilbab pashmina/ jilbab pashmina, kerudung instan/ jilbab bergo tetapi juga produk busana muslimah seperti gamis, tunik, busana haji umroh, mukena dan kemeja pria, juga busana sporty series dan hijab anak. Produk hijab HAS COLLECTIONS Charshaf dirancang sesuai dengan syariah Islam, longgar, tidak membentuk lekuk tubuh dan nyaman dikenakan. HAS COLLECTIONS Charshaf hijab Indonesia menyediakan banyak sekali tipe atau desain untuk setiap klasifikasi produknya. Untuk jilbab scarf atau kerudung segi empat dan jilbab pashmina/ jilbab pashmina ada beberapa tipe bahan dan motif yang selalu baru dalam warna-warna yang variatif, untuk kerudung instan atau jilbab bergo selalu ada motif-motif baru yang juga sama dipakai untuk produk gamis, tunik dan hijab anak. Kerudung instan/ jilbab bergo juga tersedia dalam aneka model dalam warna-warna menarik. HAS COLLECTIONS Charshaf hijab Indonesia bertekad agar semua produknya baik itu jilbab HAS COLLECTIONS Charshaf atau kerudung HAS COLLECTIONS Charshaf, jilbab scarf/ kerudung segi empat, kerudung pashmina/ jilbab pashmina dan kerudung instan/ jilbab bergo maupun produk busana seperti gamis, tunik, busana haji umroh juga busana sporty series dan hijab anak diperuntukkan bagi para muslimah yang membutuhkannya sehari-hari. &lt;br&gt;&lt;br&gt;HAS COLLECTIONS Charshaf hijab Indonesia adalah kerudung dan busana muslimah untuk daily wear, sehingga tidak hanya dipakai pada saat hari raya saja. Untuk itu HAS COLLECTIONS Charshaf hijab selalu menomorsatukan kualitas dan kebutuhan para konsumennya serta pasti bisa memenuhi keinginan para konsumennya akan produk hijab Indonesia atau jilbab atau kerudung yang beraneka macam. Menyadari bahwa dalam pasar busana muslim kerudung/ jilbab atau hijab Indonesia demikian maraknya, HAS COLLECTIONS Charshaf hijab perusahaan yang berkembang pesat juga tak luput dari &quot;hingar bingar&quot; pasar busana muslim, baik kerudung, jilbab scarf, jilbab pashmina maupun jilbab bergo. Untuk menghadapi ini HAS COLLECTIONS Charshaf hijab Indonesia selalu memberikan keunikan dan nilai tambah dalam setiap produknya, baik itu busana muslim gamis, tunik atau outer wear, maupun dalam produk jilbab atau scarf/ kerudung segi empat, kerudung selendang/ pashmina dan tentunya di produk kerudung instan/ jilbab bergo. Penampilan produk HAS COLLECTIONS Charshaf HAS COLLECTIONS Charshaf Indonesia selain atraktif, juga banyak pilihan warna yang sesuai untuk semua kalangan, usia muda maupun yang sudah senior. &lt;br&gt;&lt;br&gt;Keadaan seperti ini membuat tim HAS COLLECTIONS Charshaf hijab indonesia lebih bersemangat untuk menciptakan kreasi-kreasi kerudung pashmina HAS COLLECTIONS Charshaf/ jilbab pashmina HAS COLLECTIONS Charshaf, kerudung scarf HAS COLLECTIONS Charshaf/ jilbab scarf HAS COLLECTIONS Charshaf yang lebih keren, sesuai dengan gaya HAS COLLECTIONS Charshaf hijab Indonesia yang simpel dan sesuai untuk gaya hijab sehari-hari. Dengan harga terjangkau semua produk HAS COLLECTIONS Charshaf hijab baik itu busana muslim gamis, tunik atau outer wear, maupun produk jilbab atau scarf/ kerudung segi empat, kerudung pashmina/ jilbab pashmina dan tentunya juga produk kerudung instan/ bergo itu bisa didapat dengan harga terjangkau.&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;b&gt;Tips bisnis fashion hijab&lt;br&gt;&lt;/b&gt;&lt;br&gt;Bisnis fashion hijab indonesia tidak bisa lepas dari yang namanya fashion trend. Begitu juga dengan bisnis fashion hijab indonesia. Bagaimana produk yang diciptakan dalam bisnis fashion hijab indonesia seperti kerudung, jilbab, atau pashmina, jilbab scarf dan jilbab bergo bisa digemari oleh konsumen, harus melihat trend yang akan terjadi. Para desainer, produsen dan pengusaha fashion hijab Indonesia berlomba-lomba memberikan hasil kreasi yang bisa diterima pasar. Kreatifitas adalah hal utama bila ingin bisa ikut berlari dalam bisnis fashion hijab Indonesia. &lt;br&gt;&lt;br&gt;Banyak yang memanfaatkan momentum hari Raya Idul Fitri untuk mempromosikan produk fashion hijab Indonesia seperti jilbab/ kerudung, jilbab scarf, jilbab pashmina maupun jilbab bergo dan produk busana muslim seperti gamis dan tunik, baik berupa diskon harga maupun memperkenalkan produk baru. Tidak demikian dengan HAS COLLECTIONS Charshaf hijab, karena semua produknya seperti jilbab atau scarf/ kerudung segi empat, kerudung selendang/ pashmina dan tentunya juga produk kerudung instan/ jilbab bergo maupun produk gamis, tunik dan outerwearnya selalu rutin dipromosikan karena menyadari bahwa kebutuhan akan busana muslim dan kerudung atau jilbab bergo atau scarf dan pashmina atau selendang tidak terbatas hanya pada saat hari raya saja. &lt;br&gt;&lt;br&gt;Dengan demikian kerudung HAS COLLECTIONS Charshaf, jilbab scarf HAS COLLECTIONS Charshaf, jilbab pashmina atau jilbab selendang HAS COLLECTIONS Charshaf, jilbab bergo HAS COLLECTIONS Charshaf, gamis HAS COLLECTIONS Charshaf dan tunik HAS COLLECTIONS Charshaf maupun mukena HAS COLLECTIONS Charshaf bisa ditemui kapan saja di semua toko HAS COLLECTIONS Charshaf hijab yang tersebar di seluruh Indonesia dan tentunya selalu dalam koleksi yang menarik. Untuk dapat lebih menjangkau para muslimah yang ingin selelau tampil trendy, stylish, cantik dan menarik dengan hijab HAS COLLECTIONS Charshaf atau jilbab HAS COLLECTIONS Charshaf, kerudung HAS COLLECTIONS Charshaf, jilbab scarf HAS COLLECTIONS Charshaf, jilbab selendang atau jilbab pashmina, koleksi HAS COLLECTIONS Charshaf hijab indonesia juga bisa dibeli secara online di HAS COLLECTIONScharshaf.com. Online fashion hijab Indonesia juga sedang marak-maraknya saat ini. Silakan berkunjung ke online shop kami untuk mendapatkan semua produk hijab HAS COLLECTIONS Charshaf dan kebutuhan busana muslimah mulai dari jilbab/ kerudung HAS COLLECTIONS Charshaf, jilbab scarf HAS COLLECTIONS Charshaf, jilbab pashmina/ jilbab selendang HAS COLLECTIONS Charshaf, jilbab bergo HAS COLLECTIONS Charshaf, gamis HAS COLLECTIONS Charshaf dan tunik HAS COLLECTIONS Charshaf maupun mukena HAS COLLECTIONS Charshaf.', '2015-01-25 08:59:05', '2501150956banner01.jpg', 10, 'Y', 4, 17),
(47, 'kontak', '&lt;ul&gt;&lt;li&gt;HAS COLLECTION&amp;nbsp;:&amp;nbsp;&lt;br&gt;&amp;nbsp;JL. Kapin Raya No. 44 Pondok Kelapa, DKI Jakarta, 17146&lt;/li&gt;&lt;li&gt;Email:&amp;nbsp;&lt;a target=&quot;_blank&quot; rel=&quot;nofollow&quot; href=&quot;http://hascollection.ddns.net/hijab/handayndayy@gmail.com&quot;&gt;&amp;nbsp;handayndayy@gmail.com&lt;/a&gt;&lt;/li&gt;&lt;li&gt;&amp;nbsp;Telp : 0813 1033 3603&lt;br&gt;SMS : 0813 1033 3603&lt;/li&gt;&lt;/ul&gt;', '2016-11-24 16:55:06', '', 52, 'Y', 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `berita_kategori`
--

CREATE TABLE IF NOT EXISTS `berita_kategori` (
  `kategori_id` int(3) NOT NULL,
  `kategori_nama` varchar(25) NOT NULL,
  `kategori_desk` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita_kategori`
--

INSERT INTO `berita_kategori` (`kategori_id`, `kategori_nama`, `kategori_desk`) VALUES
(1, 'uncategory', 'Tidak ada dalam kategori'),
(2, 'tutorial', 'tentang tutorial'),
(3, 'Promo', 'Promo Produk'),
(4, 'berita', 'Berita Campur');

-- --------------------------------------------------------

--
-- Table structure for table `cust_users`
--

CREATE TABLE IF NOT EXISTS `cust_users` (
  `cust_id` int(4) NOT NULL,
  `cust_fn` varchar(100) NOT NULL,
  `cust_mail` varchar(100) NOT NULL,
  `cust_pass` varchar(50) NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `tgl_daftar` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cust_users`
--

INSERT INTO `cust_users` (`cust_id`, `cust_fn`, `cust_mail`, `cust_pass`, `status`, `tgl_daftar`) VALUES
(17, 'ika septianingsih', 'test@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'Y', '2016-12-21'),
(18, 'jauhari', 'jauharimalikupil@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'Y', '2016-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` varchar(20) NOT NULL,
  `cust_id` int(4) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kodepos` int(6) NOT NULL,
  `alamat` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `pelunasan` enum('0','1') NOT NULL,
  `dilihat` enum('0','1') NOT NULL,
  `ongkir` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `cust_id`, `nama`, `kota`, `provinsi`, `kodepos`, `alamat`, `phone`, `tgl_pesan`, `status`, `pelunasan`, `dilihat`, `ongkir`) VALUES
('27DE658B', 18, 'jauhari', 'Kabupaten Bangka', 'Bangka Belitung', 17146, 'semarang', '50241', '2016-12-21', 'Menunggu', '0', '0', 0),
('3215D209', 18, 'jauhari', 'Kabupaten Bangli', 'Bali', 25255, 'semarang', '123', '2016-12-21', 'Menunggu', '0', '0', 29580);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `ord_detail_id` int(4) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `produk_id` int(4) NOT NULL,
  `size` varchar(10) NOT NULL,
  `qty` int(3) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`ord_detail_id`, `order_id`, `produk_id`, `size`, `qty`, `total`) VALUES
(54, '27DE658B', 23, 'M', 1, 97000);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(6) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `payment_amount` decimal(7,2) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `itemid` varchar(25) NOT NULL,
  `createdtime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `pembayaran_id` int(3) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `bank` varchar(20) NOT NULL,
  `atas_nama` varchar(50) NOT NULL,
  `rek_cust` varchar(20) NOT NULL,
  `rek_admin` varchar(20) NOT NULL,
  `jml_transfer` varchar(50) NOT NULL,
  `ket` varchar(100) NOT NULL,
  `tgl_transfer` date NOT NULL,
  `dilihat` enum('0','1') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`pembayaran_id`, `order_id`, `bank`, `atas_nama`, `rek_cust`, `rek_admin`, `jml_transfer`, `ket`, `tgl_transfer`, `dilihat`) VALUES
(19, '3215D209', '', '', '', '', '', '', '2016-12-21', '0'),
(20, '3215D209', '', '', '', '', '', '', '2016-12-21', '0'),
(21, '3215D209', '', '', '', '', '', '', '2016-12-21', '0');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `produk_id` int(4) NOT NULL,
  `produk_nama` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `bahan` varchar(100) NOT NULL,
  `ukuran` varchar(10) NOT NULL,
  `warna` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `stok` int(4) NOT NULL,
  `pk_id` int(3) NOT NULL,
  `tgl_entri` date NOT NULL,
  `dilihat` int(4) NOT NULL,
  `berat` int(11) NOT NULL DEFAULT '20'
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `produk_nama`, `image`, `bahan`, `ukuran`, `warna`, `harga`, `stok`, `pk_id`, `tgl_entri`, `dilihat`, `berat`) VALUES
(10, 'Tilda', '1601150400tilda.jpg', 'Temporibus', 'L', 'Consectetur', 73000, 5, 5, '2015-01-16', 14, 20),
(11, 'Savana', '1601150401savana.jpg', 'Consectetur', 'S', ' Aspernatu', 81000, 0, 3, '2015-01-16', 24, 20),
(12, 'Valery', '1601150401Valery.jpg', ' Aspernatu', 'XL', ' Aspernatu', 79000, 5, 5, '2015-01-16', 22, 20),
(13, 'Sister Hood', '1601150402sisterhood.jpg', ' Aspernatu', 'M XL', ' Aspernatu', 69000, 6, 4, '2015-01-16', 12, 20),
(14, 'Aisya Maxi', '1601150402aisya-maxi.jpg', ' Aspernatu', 'S', ' Aspernatu', 90000, 8, 3, '2015-01-16', 149, 20),
(16, 'Brown Flower', '1601150404citra.jpg', ' Aspernatu', 'M L XL', 'Coklat', 84000, 8, 2, '2015-01-16', 64, 20),
(21, 'Pesona Sakura', '170115045616011503581.jpg', 'Wolpeach', 'S M', 'Kuning', 67000, 3, 5, '2015-01-17', 73, 20),
(22, 'Double Hicon Cyan', '18011509271324.jpg', 'Katun Paris', 'S M L', 'Cyan', 65000, 4, 4, '2015-01-18', 53, 20),
(23, 'Zaria M Nafisa', '2301150227Zaria-M-Nafisa-55000.jpg', 'Katun Paris', 'M L', 'Kuning', 97000, 6, 4, '2015-01-22', 185, 20),
(24, 'Batwing M Monica', '2301150229Batwing-M-Monica-129000.jpg', 'Katun', 'M L XL', 'Optional', 84000, 9, 2, '2015-01-23', 128, 20),
(25, 'Benita Tafia', '2301150230Benita-Tafia-55000.jpg', 'Semi Katun', 'M L', 'Ungu', 78000, 6, 2, '2015-01-23', 95, 20),
(26, 'Saifa Farida', '2301150231Saifa-Farida-89000.jpg', 'Wolpeac', 'M L XL', 'Cyan, Yellow', 83000, 8, 4, '2015-01-23', 71, 20);

-- --------------------------------------------------------

--
-- Table structure for table `produk_kategori`
--

CREATE TABLE IF NOT EXISTS `produk_kategori` (
  `pk_id` int(3) NOT NULL,
  `pk_nama` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_kategori`
--

INSERT INTO `produk_kategori` (`pk_id`, `pk_nama`) VALUES
(2, 'jalaba'),
(3, 'khimar'),
(4, 'wolpeace'),
(5, 'persegi-empat');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `level` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `fullname`, `email`, `no_telp`, `level`, `avatar`) VALUES
(16, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'admin@jauharimalik.xyz', '089635023780', 'Sales', '1112161035customer_service.png'),
(17, 'arif', '0ff6c3ace16359e41e37d40b8301d67f', 'Arif Rudianto', 'ariifrd@gmail.com', '089654671510', 'Admin', '2401150858240115094658.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`berita_id`);

--
-- Indexes for table `berita_kategori`
--
ALTER TABLE `berita_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `cust_users`
--
ALTER TABLE `cust_users`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`ord_detail_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`pembayaran_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`);

--
-- Indexes for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `berita_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `berita_kategori`
--
ALTER TABLE `berita_kategori`
  MODIFY `kategori_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cust_users`
--
ALTER TABLE `cust_users`
  MODIFY `cust_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `ord_detail_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `pembayaran_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  MODIFY `pk_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
