<!DOCTYPE html>
<html>
<head>
	
</head>
<style type="text/css">
	body {
       	background: -webkit-linear-gradient(bottom, #7AC1FF, #51AEFF, #51AEFF);
       	height: 100%;
    	margin: 0;
    	background-repeat: no-repeat;
    	background-attachment: fixed;
       
}
	#card {
        background: #fbfbfb;
        border-radius: 8px;
        box-shadow: 1px 2px 8px rgba(0, 0, 0, 0.85);
        height: 240px;
        margin: 13rem auto 8.1rem auto;
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
<body>
	<div id="card">
		
	<div id="card_didalem">

		<form action="<?php echo base_url('login/aksi_login'); ?>" method="post">
		<table>
			<tr>
				<td><input type="text" placeholder="username" name="username"></td>
			</tr>
			<td></td>
			<tr>
				<td><input type="password" placeholder="password" name="password"></td>
			</tr>
			<tr>
				
				<td><div class="tombol"><br><input type="submit" value="Login"></div></td></form>
			</tr>
			<form action="<?php echo base_url('register'); ?>">
			<tr>
				<td><div class="tombol"><br><input type="submit" value="Register" name="Register"></div></td>
			</tr>
	</form>
		</table>
	
</div>
	</div>
</body>
</html>