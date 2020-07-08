<!-- Updated by Rizaluardi-PC -->
<?php

class Model_Jurusan extends CI_Model
{
	
	public function getDataJurusan($kode_jurusan = null)
	{
		if ($kode_jurusan === null) {
			$semua_data_jurusan = $this->db->get("jurusan")->result();
			return $semua_data_jurusan;
		} else {
			$data_jurusan_bykode_jurusan = $this->db->get_where('jurusan', ['kode_jurusan' => $kode_jurusan])->result();
			return $data_jurusan_bykode_jurusan;
		}
	}
	public function tambahJurusan($data)
	{
		$this->db->insert('jurusan', $data);
		return $this->db->affected_rows();
	}
	public function hapusJurusan($kode_jurusan)
	{
		$this->db->delete('jurusan', ['kode_jurusan' => $kode_jurusan]);
		return $this->db->affected_rows();
	}
	public function ubahJurusan($data, $kode_jurusan)
	{
		$this->db->update('jurusan', $data, ['kode_jurusan' => $kode_jurusan]);
		return $this->db->affected_rows();
	}
}