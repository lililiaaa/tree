<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use \QCloud_WeApp_SDK\Auth\LoginService as LoginService;
use QCloud_WeApp_SDK\Constants as Constants;

class User extends CI_Controller {
    //by  袁庆龙 start
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



    //获取指定精灵对话
    // params： sprite_id
    // rerurn :    结果json 或者 FALSE
    public function get_sprite_dialog(){    
        $sprite_id = $this->input->get($sprite_id);
        $res = $this->User_model->sprite_dialog($sprite_id);
        if($res != 'FALSE'){
            return json_encode($res);
        }else{
            echo $res;
        }
    }

    // 获得指定精灵的信息
    // params: sprite_id
    // rerurn :    结果json 或者 data_not_exist
    public function get_sprite(){
        $sprite_id = $this->input->get($sprite_id);
        $res = $this->User_model->get_one_sprite($sprite_id);
        if($res != []){
            return json_encode($res);
        }else{
            echo 'data_not_exist';
        }
    }

    // 获得 用户 的某个精灵信息
    // params: sprite_id
    // rerurn :    结果json 或者 data_not_exist
    public function get_user_sprite(){
        $sprite_id = $this->input->get($sprite_id);
        $res = $this->User_model->sprite_dialog($sprite_id);
        if($res != []){
            return json_encode($res);
        }else{
            echo 'data_not_exist';
        }
    }

    //获取用户所有精灵
    // params:  uid
    // rerurn :    结果json 或者 FALSE
    public function getsprite(){
        $u_id = $this->input->get('uid');
        $res = $this->User_model->get_all_sprite($u_id);
        if($res != 'FALSE'){
            return json_encode($res);
        }else{
            echo $res;
        }

    }

    // 更换用户的默认精灵
    //params: u_id, user_id,using_id
    // return 受影响行数
    public function change_u_sprite(){
        $u_id = $this->input->get('u_id');
        $used_id = $this->input->get('used_id');//更换前的id -》  used_id
        $using_id = $this->input->get('using_id');//更换后的id -》 using_id
        $res = $this->User_model->change_sprite($u_id,$used_id,$using_id);
        if($res>0){
            echo 'success';
        }else{
            echo 'false'；
        }
    }
    
    // 更换用户的默认house
    //params: u_id, user_id,using_id
    // return 受影响行数
    public function change_u_sprite(){
        $u_id = $this->input->get('u_id');
        $used_id = $this->input->get('used_id');//更换前的id -》  used_id
        $using_id = $this->input->get('using_id');//更换后的id -》 using_id
        $res = $this->User_model->change_house($u_id,$used_id,$using_id);
        if($res>0){
            echo 'success';
        }else{
            echo 'false'；
        }
    }


    //获取用户的 叶子币数，房子数，精灵数
    //params: u_id
    // rerurn :    结果json 或者 FALSE
    public function get_u_infor(){
        $u_id = $this->input->get('u_id');
        $res = $this->User_model->get_M_H_S($u_id);
        if($res != 'FALSE'){
            return json_encode($res);
        }else{
            echo $res;
        }
    }

    
   
}
