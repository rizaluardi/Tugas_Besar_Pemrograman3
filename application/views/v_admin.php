<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Autocomplete</title>
    <link rel="stylesheet" href="<?php echo base_url().'assets/css/bootstrap.css'?>">
	<link rel="stylesheet" href="<?php echo base_url().'assets/css/jquery-ui.css'?>">
</head>
<body>
	<h1>Login berhasil !</h1>
	<h2>Hai, <?php echo $this->session->userdata("nama"); ?></h2>
	<a href="<?php echo base_url('login/logout'); ?>">Logout</a>


            <div class="container">
		<div class="row">
			<h2>Generate API KEY</h2>
		</div>
		<div class="row">
			<form action="<?php echo base_url(). 'user/tambah_aksi_api'; ?>" method="post">
				 <div class="form-group">
				    <label>Username</label>
				    <input type="text" name="title" class="form-control" id="title" style="width:500px;">
				 </div>
				 <div class="form-group">
				    <label>ID_user</label>
				    <input type="text" name="user_id" class="form-control" placeholder="iduser" style="width:500px;"></textarea>
				 </div>
				<div class="form-group">
					<label>API KEY</label>
					<input type="text" id="tb" name="key" class="form-control" style="width:500px;">
				</div>
					<input type="text" hidden name="level" value="1">
					<input type="text" hidden name="ignore_limits" value="0">
					<input type="text" hidden name="is_private_key" value="0">
					<input type="text" hidden name="ip_addresses" value="0">
					<input type="text" hidden name="date_created" value="1">
    
<script>
function Random() {
        var rnd = Math.floor(Math.random() * 1000000000);
        document.getElementById('tb').value = rnd;
    }
</script>
<input type="submit" name="submit">

			</form>
			<input type="button" value="Generate" onclick="Random();" />
		</div>
	</div>

	<script src="<?php echo base_url().'assets/js/jquery-3.5.1.js'?>" type="text/javascript"></script>
	<script src="<?php echo base_url().'assets/js/bootstrap.js'?>" type="text/javascript"></script>
	<script src="<?php echo base_url().'assets/js/jquery-ui.js'?>" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(){

		    $('#title').autocomplete({
                source: "<?php echo site_url('user/get_autocomplete');?>",
     
                select: function (event, ui) {
                    $('[name="title"]').val(ui.item.label); 
                    $('[name="user_id"]').val(ui.item.user_id); 
                }
            });

		});
	</script>
</body>
</html>