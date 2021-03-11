<?php 	
	include 'koneksi.php';
	include 'header.php'; 
?>
	<div class="container">
		<div class="panel-body">
			<h2>SELAMAT DATANG DI HALAMAN UTAMA WEB SPPKU</h2>
		</div>
	</div>

 <div class="container">
	<div class="page-header">
<span><i>CARI SISWA BERDASARKAN NIS</i></span>
	</div>
 <form action="" method="get">
 	<table class="table">
 		<tr>
 			<td>NIS</td>
 			<td>:</td>
 			<td>
 				<input class="form-control" type="text" name="nis">
 			</td>
 			<td>
 				<button class="btn btn-success" type="submit" name="cari">Cari</button>
 			</td>
 		</tr>
 		
 	</table>
 </form>
<?php 
if (isset($_GET['nis']) && $_GET['nis'] != ''){
	$data = $konek->query("SELECT * FROM siswa WHERE nis = '$_GET[nis]'");
	$dta = mysqli_fetch_assoc($data);
	$nis = $dta['nis'];

?>
<div class="panel panel-info">
	<div class="panel-heading">
<h3>biodata siswa</h3>
</div>
<div class="panel panel-body">
	<table class="table table-bordered table-striped">
		<tr>
			<td>NIS</td>
			<td><?= $dta['nis'] ?></td>
		</tr>
		<tr>
			<td>Nama Siswa</td>
			<td><?= $dta['namasiswa'] ?></td>
		</tr>
		<tr>
			<td>Kelas</td>
			<td><?= $dta['kelas'] ?></td>
		</tr>
		<tr>
			<td>Tahun ajaran </td>
			<td><?= $dta['tahunajaran'] ?></td>
		</tr>
	</table>
</div>
</div>

<div class="panel panel-info">
	<div class="panel-heading">
<h3>Tagihan SPP Siswa</h3>
</div>
<div class="panel-body ">
	<table class="table table-bordered table-striped">
<tr>
	<th>NO</th>
	<th>Bulan</th>
	<th>jatuh tempo</th>
	<th>No bayar</th>
	<th>Tanggal Bayar</th>
	<th>Jumlah</th>
	<th>Keterangan</th>
</tr>
<?php 
$sql= mysqli_query($konek ," SELECT * FROM spp WHERE idsiswa = '$dta[idsiswa]' ORDER BY jatuhtempo ASC ");
$i=1;
while($sq = mysqli_fetch_assoc($sql)){
	echo "

		<tr>
			<td>$i</td>
			<td>$sq[bulan]</td>
			<td>$sq[jatuhtempo]</td>
			<td>$sq[nobayar]</td>
			<td>$sq[tglbayar]</td>
			<td>$sq[jumlah]</td>
			<td>$sq[ket]</td>
		</tr>

		";
		$i++;
}
 ?>
</table>
</div>
</div>
<?php 
}
?>
<p style="color: red;">Pembayaran dilakukan dengan cara mencari tagihan siswa berdasarkan NIS </p>
