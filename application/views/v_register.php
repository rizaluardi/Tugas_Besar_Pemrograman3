<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	body {
       background: -webkit-linear-gradient(bottom, #FF5733, #FF957E);
       background-repeat: no-repeat;
}
	#card {
        background: #fbfbfb;
        border-radius: 8px;
        box-shadow: 1px 2px 8px rgba(0, 0, 0, 0.85);
        height: 210px;
        margin: 6rem auto 8.1rem auto;
        width: 329px;
}
	#card_didalem{
		height: 200px;
		width: 200px;
		margin: 4.5rem 5rem;
		position: absolute;

	}
	::-webkit-input-placeholder {
   text-align: center;
}
.tombol{ text-align: center; }


</style>
</head>
<body>
	<div id="card">
		<div id="card_didalem">
	<form action="<?php echo base_url(). 'register/tambah_aksi'; ?>" method="post">
		<table style="margin:20px auto;">
			<tr>
				<input type="text" hidden name="id_usergroup_user" value="1">
				<td><input type="text" placeholder="username" name="username"></td>
			</tr>
			<tr>
				<td><input type="text" placeholder="password" name="password"></td>
			</tr>
			<input type="text" hidden name="foto" value="apaaja.png">
			<tr>
				<td></td>
				<td><div class="tombol"><input type="submit" value="Tambah"></div></td>
			</tr>
		</table>
	</form>
	</div>
	</div>	
</body>
</html>