<?php defined('BASEPATH') OR exit('No direct script access allowed');

  class Mindfruit extends CI_Controller{
    public function __construct(){
      parent::__construct(); 
      $this->load->model('Mindfruit_model');
    }

    //by 陈嘉悦 start

    //点击心情果实的结果
    public function result(){
      $u_id = $this->input->post('u_id');

      $result = $this->Mindfruit_model->get_result();
      if($result['fruit_id'] == 1){  //假设fruit_id为1的是没中奖
        echo "没中奖";
        $arr = [
          'result' => FALSE,
          'leaf' => 0
        ];
        echo json_encode($arr);
      }else{
        //中奖了，返回$leaf
        $leaf = rand(1,5);
        $query = $this->Mindfruit_model->prize($u_id, $leaf);
        if($query){
          //echo "叶子币更新成功";
          $arr = [
            'result' => TRUE,
            'leaf' => $leaf
          ];
          echo json_encode($arr);
        }else{
          echo "叶子币更新失败";
        }
      }
    }

    //by 陈嘉悦 end
  }

?>