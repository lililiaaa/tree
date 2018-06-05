<?php defined('BASEPATH') OR exit('No direct script access allowed');

  	class Quiz extends CI_Controller{
  		public function __construct(){
      		parent::__construct(); 
      		$this->load->model('Quiz_model');
    	}

    	//by 陈嘉悦 start

   		//进行知识问答
    	public function get_quiz(){ 
    		$question = $this->Quiz_model->get_all(); //获取题目
    		if($question){
    			//获取成功，返回题目信息$question
    			//var_dump($question);
    			$arr = [
    				'quiz_id'=>$question['quiz_id'],
    				'quiz_content'=>$question['quiz_content'],
    				'right'=>$question['right'],
    				'wrong_1'=>$question['wrong_1'],
    				'wrong_2'=>$question['wrong_2'],
    				'wrong_3'=>$question['wrong_3']
    			];
    			echo json_encode($arr);
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
    				//echo "叶子币+1成功";
    				$arr = [
    					'result' => TRUE,
    		
    				];
    				echo json_encode($arr);
    			}
    		}
    	}

    	//by 陈嘉悦 end
	}

?>