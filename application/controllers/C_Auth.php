<?php
defined('BASEPATH') or exit('No direct script access allowed');

class C_auth extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('form_validation');
    }

    public function index()
    {
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email', [
            'required'      => 'Bidang Email wajib diisi',
            'valid_email'   => 'Bidang Email harus berisi alamat email yang valid',
        ]);
        $this->form_validation->set_rules('password', 'Password', 'trim|required', [
            'required'      => 'Bidang Password wajib diisi',
        ]);
        if ($this->form_validation->run() ==  false) {
            $data['title'] = 'User Login';
            $this->load->view('templates/auth_header', $data);
            $this->load->view('auth/V_login');
            $this->load->view('templates/auth_footer');
        } else {
            // ketika sukses
            $this->_login();
        }
    }

    private function _login()
    {
        $email      = $this->input->post('email');
        $password   = $this->input->post('password');

        $user = $this->db->get_where('users', ['email' => $email])->row_array();

        if ($user) {
            if ($user['is_active'] == 1) {
                if (password_verify($password, $user['password'])) {
                    $data = [
                        'email' => $user['email'],
                        'role_id' => $user['role_id']
                    ];
                    $this->session->set_userdata($data);
                    if ($user['role_id'] == 1) {
                        redirect('admin/C_admin');
                    } else {
                        redirect('user/C_user');
                    }
                } else {
                    $this->session->set_flashdata('massage', '<div class="alert alert-danger" role="alert">Password salah</div>');
                    redirect('C_auth');
                }
            } else {
                $this->session->set_flashdata('massage', '<div class="alert alert-danger" role="alert">Email ini belum terverifikasi</div>');
                redirect('C_auth');
            }
        } else {
            $this->session->set_flashdata('massage', '<div class="alert alert-danger" role="alert">Email belum terdaftar</div>');
            redirect('C_auth');
        }
    }

    public function registration()
    {
        $this->form_validation->set_rules('nama', 'Nama', 'required|trim', [
            'required'      => 'Bidang Nama wajib diisi',
        ]);
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[users.email]', [
            'required'      => 'Bidang Email wajib diisi',
            'is_unique'     => 'Email ini udah digunakan',
            'valid_email'   => 'Bidang Email harus berisi alamat email yang valid'
        ]);
        $this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[3]|matches[password2]', [
            'required'      => 'Bidang Password wajib diisi',
            'matches'       => 'Password wajib sama',
            'min_length'    => 'Password min 3 karakter'
        ]);
        $this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');

        if ($this->form_validation->run() ==  false) {
            $data['title'] = 'User Registration';
            $this->load->view('templates/auth_header', $data);
            $this->load->view('auth/V_registration');
            $this->load->view('templates/auth_footer');
        } else {

            $data = [
                'nama'          => htmlspecialchars($this->input->post('nama', true)),
                'email'         => htmlspecialchars($this->input->post('email', true)),
                'gambar'        => 'default.jpg',
                'password'      => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
                'role_id'       => 2,
                'is_active'     => 1,
                'created_date'  => time()
            ];

            $this->db->insert('users', $data);
            $this->session->set_flashdata('massage', '<div class="alert alert-success" role="alert">Selamat! anda berhasil membuat akun. Silahkan login</div>');
            redirect('C_auth');
        }
    }

    public function logout()
    {
        $this->session->unset_userdata('email');
        $this->session->unset_userdata('role_id');
        $this->session->set_flashdata('massage', '<div class="alert alert-success" role="alert">Anda telah logout</div>');
        redirect('C_auth');
    }
}
