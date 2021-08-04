<?php
session_start();
include 'dbconnect.php';
$alert = '';

if(isset($_SESSION['role'])){
	header("location:index.php");
}

if(isset($_POST['btn-daftar'])){
// cek konfirmasi password
  if($_POST['password'] == $_POST['konfirmasipass']){
    //cek apakah email sudah pernah digunakan
    $email = mysqli_real_escape_string($conn,$_POST['email']);
    $password = mysqli_real_escape_string($conn,$_POST['password']);
    $lihat1 = mysqli_query($conn,"select * from user where useremail='$email'");
    $lihat2 = mysqli_num_rows($lihat1);
    $password = password_hash($password, PASSWORD_DEFAULT);
      if($lihat2 < 1){
    //email belum pernah digunakan
        $insert = mysqli_query($conn,"insert into user (useremail,userpassword) values ('$email','$password')");
        //eksekusi query
          if($insert){
              echo "<div class='alert alert-success'>Registrasi Berhasil, silahkan login.</div>
              <meta http-equiv='refresh' content='2; url= login.php'/>  ";
          } else {
              //daftar gagal
              echo "<div class='alert alert-warning'>Registrasi gagal, silakan coba lagi.</div>
              <meta http-equiv='refresh' content='2'>";
          }
      } else {
          //jika email sudah pernah digunakan
          $alert = '<strong><font color="red">Email sudah pernah digunakan!</font></strong>';
          echo '<meta http-equiv="refresh" content="2">';
          }
  } else{
    $alert = '<strong><font color="red">pastikan password sama</font></strong>';
    echo '<meta http-equiv="refresh" content="2" url="registrasi.php">';
    }
};

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registrasi Akun</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-144808195-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	  gtag('config', 'UA-144808195-1');
	</script>
    <script src="jquery.min.js"></script>
	<style>body{background-color:#1a5bbc;}
	@media screen and (max-width: 600px) {
h4{font-size:85%;}
}
.container{
	background-color:#2c3e50;
	width:70%;
	border: 3px white;
	border-style:solid;
	border-radius:30px;
	padding-left:10%;
	padding-right:10%;
	padding-top:3%;
	padding-bottom:2%;
}
.btn{
	width:40%;
}
	</style>
	<link rel="icon" 
      type="image/png" 
      href="favicon.png">
  </head>
  <body>
  <div align="center">
  <img src="assets/img/logo21.png" width="30%" style="margin-top:2%" \>
	<br \><br \>
			<div class="container">
					<div style="color:white">
            <label>Registrasi Akun PARTI</label><br \>
              <label><?php echo $alert ?></label>
					</div>
          <form method="post">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Nama Lengkap" name="nama" autofocus required>
            </div>
            <div class="form-group">
              <input type="email" class="form-control" placeholder="Email" name="email" autofocus required>
            </div>
            <div class="form-group">
              <input type="password" class="form-control" placeholder="Password" name="password" required>
            </div>
            <div class="form-group">
              <input type="password" class="form-control" placeholder="Konfirmasi Password" name="konfirmasipass" required>
            </div>
              <button type="submit" class="btn btn-primary" name="btn-daftar">Registrasi</button>
              <br><a href="login.php">Login</a>
          </form>
			<br \>
      </div>
  </div>
  </body>
</html>
