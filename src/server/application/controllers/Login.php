<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use QCloud_WeApp_SDK\Auth\LoginService as LoginService;
use QCloud_WeApp_SDK\Constants as Constants;

class Login extends CI_Controller {
    public function index() {
        $result = LoginService::login();
        if ($result['loginState'] === Constants::S_AUTH) {
            $this->json([
                'code' => 0,
                'data' => $result['userinfo']
            ]);
        } else {
            $this->json([
                'code' => -1,
                'error' => $result['error']
            ]);
        }
    }

    // by 袁庆龙 start
    // https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code

    public function login(){
        $code = $this->input->post('code');
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$appid.'&secret='.$secret.'&js_code='.$code.'&grant_type=authorization_code';
        $result = $this->Welcome_model->curl_get_https($url); //获得返回的字符串    
        $this->session->set_userdata(array(
            '3rd_session' => $result->openid.$result->session_key;
        ));
    }
    //  by 袁庆龙 end
}
