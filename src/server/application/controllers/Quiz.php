<?php defined('BASEPATH') OR exit('No direct script access allowed');

  	class Quiz extends CI_Controller{
  		public function __construct(){
      		parent::__construct(); 
      		$this->load->model('Quiz_model');
    	}

    	//by 陈嘉悦 start

    	// //显示知识问答页面
    	// public function quiz(){
    	// 	$this->load->view();
    	// }

   		//进行知识问答
    	public function get_quiz(){ 
    		$question = $this->Quiz_model->get_all(); //获取题目
    		if($question){
    			//获取成功，返回题目信息$question
    			var_dump($question);
    		}else{
    			echo "获取失败";
    		}
    	}

    	//判断用户是否答对
    	public function judge_user(){
    		$u_id = $this->input->post('u_id');
    		$answer = $this->input->post('answer');
    		$quiz_id = $this->input->post('quiz_id');

    		$result = $this->Quiz_model->judge($quiz_id, $answer); //判断是否答对
    		if($result){
    			//答案正确
    			$react = $this->Quiz_model->correct($u_id); //$u_id对应的用户叶子币数+1
    			if($react){
    				echo "叶子币+1成功";
    			}else{
    				echo "奖励失败";
    			}
    		}else{
    			echo "答案错误";
    		}
    	}

    	//by 陈嘉悦 end
	}

?>