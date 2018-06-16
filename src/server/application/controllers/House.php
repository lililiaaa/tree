<?php defined('BASEPATH') OR exit('No direct script access allowed');
	class House extends CI_Controller{
		public function __construct(){
			parent::__construct();
			$this->load->model('House_model');
		}
		public function shop(){
			$query=$this->House_model->get();
      $result=json_encode($query);
      echo $result;
	}
  public function get_details(){
    $h_id=$_GET['id'];
    $query=$this->House_model->get_details($h_id);
    $result=json_encode($query);
    echo $result;
  }
  public function get_leaves(){
    $u_id=$_GET['u_id'];
    $query=$this->House_model->get_leaves($u_id);
    $result=json_encode($query);
    echo $result;
  }
  public function buy(){
    $user_id=$_GET['user_id'];
    $house_id=$_GET['house_id'];
    $leaves=$_GET['leaves'];
    $query=$this->House_model->house_buy($user_id,$house_id,$leaves);
  }
  }
?>