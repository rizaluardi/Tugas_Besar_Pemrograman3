<?php 


class Register extends CI_Controller{

	public function __construct(){
		parent::__construct();		
		$this->load->model('m_register');

	}
	function index(){
		$this->load->view('v_register');
	}
	function tambah_aksi(){
		$id_usergroup_user = $this->input->post('id_usergroup_user');
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		$foto = $this->input->post('foto');
 
		$data = array(
			'id_usergroup_user' => $id_usergroup_user,
			'username' => $username,
			'password' => $password,
			'foto' => $foto
			);
		$this->m_register->input_data($data,'user');
		redirect('login');
	}

}