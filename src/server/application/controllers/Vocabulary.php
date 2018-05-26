<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use \QCloud_WeApp_SDK\Auth\LoginService as LoginService;
use QCloud_WeApp_SDK\Constants as Constants;

class Vocabulary extends CI_Controller {

  // by 袁庆龙 start
  public function __construct(){
    parent::__construct();
    $this->load->model("vocabulary_model");
  } 

  //获取单词id，词汇文本和正确、错误选项
  public function get_vocabulary(){
    $result = $this->vocabulary_model->get_answer_by_vocabulary();
    if(count($result)>0){
      echo json_encode($res);
    }else{
      echo "no data"
    }
    
  }
  // 返回叶子钱币的数量
  

  // https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code
  // 更新数据库正确单词的数量
  public function update_word_num(){
    $open_id = $this->input->post('open_id');
    $words = $this->input->post('words_number');
    $result = $this->Welcome_model->update_word($open_id,$words);
    if($result>0){
      echo 'success';
    }else{
      echo 'false';
    }
  }

  // by 袁庆龙 end



  //检查页面的登录状态
    // public function index() {
    //     $result = LoginService::check();

    //     if ($result['loginState'] === Constants::S_AUTH) {
    //         $this->json([
    //             'code' => 0,
    //             'data' => $result['userinfo']
    //         ]);
    //     } else {
    //         $this->json([
    //             'code' => -1,
    //             'data' => []
    //         ]);
    //     }
    // }
  

}
