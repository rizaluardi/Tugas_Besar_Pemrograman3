<?php 

class User extends CI_Controller{

	function __construct(){
		parent::__construct();
		$this->load->model('Generate_Model','gm');
	
		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
	}

	function index(){
		$this->load->view('v_admin');
	}

    function get_autocomplete(){
		if (isset($_GET['term'])) {
		  	$result = $this->gm->search_generate($_GET['term']);
		   	if (count($result) > 0) {
		    foreach ($result as $row)
		     	$arr_result[] = array(
					'label' => $row->username,
					'user_id' => $row->id_user
				);
		     	echo json_encode($arr_result);
		   	}
		}
	}

	function tambah_aksi_api(){
		$user_id = $this->input->post('user_id');
		$key = $this->input->post('key');
		$level = $this->input->post('level');
		$ignore_limits = $this->input->post('ignore_limits');
 		$is_private_key = $this->input->post('is_private_key');
		$ip_addresses = $this->input->post('ip_addresses');
		$date_created = $this->input->post('date_created');
		
		
		$data = array(
			'user_id' => $user_id,
			'key' => $key,
			'level' => $level,
			'ignore_limits' => $ignore_limits,
			'is_private_key' => $is_private_key,
			'ip_addresses' => $ip_addresses,
			'date_created' => $date_created
			);
		$this->gm->input_data($data,'api_keys');
		redirect('user');
	}
}