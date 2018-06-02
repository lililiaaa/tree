<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use \QCloud_WeApp_SDK\Auth\LoginService as LoginService;
use QCloud_WeApp_SDK\Constants as Constants;

class Vocabulary extends CI_Controller {
  
  public function __construct(){
    parent::__construct();
    $this->load->model("vocabulary_model");
  } 
  // by 袁庆龙 start

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

  // 更新数据库正确单词的数量
  public function update_word_num(){
    // $open_id = $this->input->post('open_id');
    $words = $this->input->post('words_number');
    $result = $this->Welcome_model->update_word($open_id,$words);
    if($result>0){
      echo 'success';
    }else{
      echo 'false';
    }
  }

  // by 袁庆龙 end

}
