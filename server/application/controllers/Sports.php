<?php defined('BASEPATH') OR exit('No direct script access allowed');

    include "demo.php";

  	class Sports extends CI_Controller{
  		public function __construct(){
      		parent::__construct(); 
      		$this->load->model('Sports_model');
    	}

    	public function change(){  //修改user表中的运动步数和叶子币数
    		$u_id = $this->input->post('u_id'); 
    		$steps = $data; //解密后获得 
    		$leaves = $this->input->post('leaves');
    		
    		$result = $this->Sports_model->change_num($u_id, $steps, $leaves);
    		if($result){
    			echo "修改成功";
    		}	
    	}
  	}
 ?>