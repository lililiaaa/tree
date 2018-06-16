<?php defined('BASEPATH') OR exit('No direct script access allowed');
	class Sprite extends CI_Controller{
		public function __construct(){
			parent::__construct();
			$this->load->model('Sprite_model');
		}
			public function shop(){
			$query=$this->Sprite_model->get();
      $result=json_encode($query);
      echo $result;
	}
  public function get_details(){
    $id=$_GET['id'];
    // $array = json_decode($id,true);
    $query=$this->Sprite_model->get_details($id);
    $result=json_encode($query);
    echo $result;
  }
  public function buy(){
    $user_id=$_GET['user_id'];
    $sprite_id=$_GET['sprite_id'];
    $leaves=$_GET['leaves'];
    $query=$this->Sprite_model->Sprite_buy($user_id,$sprite_id,$leaves);
  }
	}
?>