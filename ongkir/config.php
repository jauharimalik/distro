<?php
$DB_host = "localhost";
$DB_user = "admin";
$DB_pass = "admin";
$DB_name = "db_wilayah";

try
{
	$db = new PDO("mysql:host={$DB_host};dbname={$DB_name}",$DB_user,$DB_pass);
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $message)
{
	echo $message->getMessage();
}
?>