<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');

class User_model extends CI_Model{
	 
   public function get_M_H_S(){
     return $this->db->get_where('user');
   }
	 public function find_by_glod($glod) {

	 	return $this->db->get_where('user',
	 		array(
	 		"glod"=>$glod;
	 	))->row();
	 } 
	 
	 
}