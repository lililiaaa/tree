<?php defined('BASEPATH') OR exit('No direct script access allowed');

  	class Vocabulary extends CI_Controller{
  		public function __construct(){
      		parent::__construct(); 
      		$this->load->model('Vocabulary_model');
    	}

        //by 陈嘉悦 start


   		//进行单词积累
    	public function get_question(){ 
    		$question = $this->Vocabulary_model->get_all();//获取题目

    		if($question){
    			//获取成功，返回题目信息$question
    			$arr = [                              //题目信息，包括:题目，四个选项，题目id
                    'word_id'=>$question['word_id'],
                    'word_content'=>$question['word_content'],
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
            $word_id = $this->input->post('word_id');

    		$result = $this->Vocabulary_model->judge($word_id, $answer);//判断是否答对
    		if($result){
    			//答案正确
    			$react = $this->Vocabulary_model->correct($u_id);//$u_id对应的用户叶子币数+1
    			if($react){
    				//echo "叶子币+1成功";
                    $arr = [
                        'result' => TRUE, //答题结果（正确）
                    
                    ];
                    echo json_encode($arr);
    			}
    		}
    	}
	}

    //by 陈嘉悦 end

?>