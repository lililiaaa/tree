<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use \QCloud_WeApp_SDK\Auth\LoginService as LoginService;
use QCloud_WeApp_SDK\Constants as Constants;

class User extends CI_Controller {
    public function __construct(){
        $this->load->model('User_model');
    }

    public function index() {
        $result = LoginService::check();
        if ($result['loginState'] === Constants::S_AUTH) {
            $this->json([
                'code' => 0,
                'data' => $result['userinfo']
            ]);
        } else {
            $this->json([
                'code' => -1,
                'data' => []
            ]);
        }
    }


    public function add_friend(){
        $receiver = $this->input->get('receiver');
        $sender = $this->input->get("sender");
        $res = $this->User_model->add_fri($receiver,$sender);


    }
    {
        # code...
    }
}
