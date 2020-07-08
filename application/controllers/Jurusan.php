<!-- Updated by Rizaluardi-PC -->
<?php

require APPPATH . 'libraries/REST_Controller.php';

class Jurusan extends REST_Controller
{
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Model_Jurusan', 'jrs');
	}

	public function index_get()
	{
		$kode_jurusan = $this->get('kode_jurusan');
		if ($kode_jurusan === null) {
			$data_kode_jurusan = $this->jrs->getDataJurusan();
		} else {

			$data_kode_jurusan = $this->jrs->getDataJurusan($kode_jurusan);
		}
		if ($data_kode_jurusan) {
			$this->response(
				[
					'status' => true,
					'data_person' => $data_kode_jurusan
				],
				REST_Controller::HTTP_OK
			);
		} else {
			$this->response(
				[
					'status' => false,
					'message' => "Data tidak ditemukan"
				],
				REST_Controller::HTTP_BAD_REQUEST
			);
		}
	}
	public function index_post()
	{
		$kode_jurusan = $this->post('kode_jurusan');
		$nama_jurusan = $this->post('nama_jurusan');
		$kode_jenjang_jrs = $this->post('kode_jenjang_jrs');


		$data = [
			'kode_jurusan' => $kode_jurusan,
			'nama_jurusan' => $nama_jurusan,
			'kode_jenjang_jrs' => $kode_jenjang_jrs
		];

		if ($kode_jurusan === null || $nama_jurusan === null || $kode_jenjang_jrs === null) {
			$this->response(
				[
					'status' =>false,
					'message' => 'data yang dikirimkan tidak boleh ada yang kosong'
				],
				REST_Controller::HTTP_BAD_REQUEST
			);
		} else {
			if ($this->jrs->tambahJurusan($data) > 0) {
				$this->response(
					[
						'status' => true,
						'message' => 'data berhasil ditambahkan'
					],
					REST_Controller::HTTP_CREATED
				);
			} else {
				$this->response(
					[
						'status' => false,
						'message' => 'gagal menambahkan data'
					],
					REST_Controller::HTTP_BAD_REQUEST
				);
			}
		}
	}
	public function index_delete()
	{
		$kode_jurusan = $this->delete('kode_jurusan');
		if ($kode_jurusan === null) {
			$this->response(
				[
					'status' => false,
					'message' => 'kode_jurusan tidak ditemukan'
				],
				REST_Controller::HTTP_BAD_REQUEST
			);
		} else {
			if ($this->jrs->hapusJurusan($kode_jurusan) > 0) {
				$this->response(
					[
						'status' => true,
						'kode_jurusan' => $kode_jurusan,
						'message' => 'data jurusan dengan ' . $kode_jurusan . ' berhasil dihapus'
					],
					REST_Controller::HTTP_OK
				);
			} else {
				$this->response(
					[
						'status' => false,
						'message' => 'data jurusan dengan ' . $kode_jurusan . ' tidak ditemukan'
					],
					REST_Controller::HTTP_BAD_REQUEST
				);
			}
		}
	}
	public function index_put()
	{
		$kode_jurusan = $this->put('kode_jurusan');
		$datajrs = [
			'nama_jurusan' => $this->put('nama_jurusan'),
			'kode_jenjang_jrs' => $this->put('kode_jenjang_jrs'),
		];
		if ($kode_jurusan === null) {
			$this->response(
				[
					'status' => false,
					'message' => 'kode_jurusan tidak boleh kosong'
				],
				REST_Controller::HTTP_BAD_REQUEST
			);
		} else {
			if ($this->jrs->ubahJurusan($datajrs, $kode_jurusan) > 0) {
				$this->response(
					[
						'status' => true,
						'message' => 'data jurusan dengan kode_jurusan ' . $kode_jurusan . ' berhasil diupdate'
					],
					REST_Controller::HTTP_OK
				);
			} else {
				$this->response(
					[
						'status' => false,
						'message' => 'data tidak ada yg diupdate'
					],
					REST_Controller::HTTP_BAD_REQUEST
				);
			}
		}
	}
}