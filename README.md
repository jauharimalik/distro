Distro Online Sederhana
=================
Merupakan aplikasi jualan online berbasis web, dibuat dengan pemrograman web php standar (tanpa menggunakan framework)

###Instalasi
Sangat mudah, jika kamu sudah menunduhnya tinggal ekstrak saja. kemudian letakan didalam folder doc web server kamu.

Buatlah database baru, import database [hijab.sql](https://github.com/jauharimalik/distro/blob/master/hijab.sql)
Kemudian sedikit edit file [config.ini.php] (https://github.com/jauharimalik/distro/blob/master/lib/config.ini.php) yang ada di folder lib/config.php. sesuaikan dengan user dan pass mysql kamu
```php
$host = "host_kamu";
$user = "user_mysql_kamu";
$pass = "pass_mysql_kamu";
$db = "nama_db";
```
