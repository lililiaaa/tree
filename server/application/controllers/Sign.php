<?php defined('BASEPATH') OR exit('No direct script access allowed');

  	class Sign extends CI_Controller{
    	public function __construct(){
      		parent::__construct(); 
      		$this->load->model('Sign_model');
    	}

    	//显示当前用户的签到天数和叶子币数
    	public function show(){
    		$u_id = $this->input->post('u_id');

    		$result = $this->Sign_model->get_condition($uid);
    		if($result){
    			$arr = [
    				'mark' => $result['mark'],
    				'leaves' => $result['leaves']
    			];
    			echo json_encode($arr);
    		}
    	}

    	//签到成功后叶子币+5
    	public function success(){
    		$u_id = $this->input->post('u_id');
    		$result = $this->Sign_model->succ($uid);
    		if($result){
    			echo "叶子币更新成功";
    		}
    	}
	}
?>