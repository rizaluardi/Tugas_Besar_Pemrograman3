<?php
class Generate_Model extends CI_Model{

	function get_all_generate(){
		$result=$this->db->get('user');
		return $result;
	}

	function search_generate($username){
		$this->db->like('username', $username , 'both');
		$this->db->order_by('username', 'ASC');
		$this->db->limit(10);
		return $this->db->get('user')->result();
	}

	function tampil_data(){
		return $this->db->get('api_keys');
	}

	function input_data($data,$table){
		$this->db->insert($table,$data);
	}
}