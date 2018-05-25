<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');

class Knowlege_model extends CI_Model{
	 
	 public function find_by_describe_answer($describe,$answer) {

	 	return $this->db->get_where('Knowlege',
	 		array(
	 		"describe"=>$describe;
	 		"answer"=>$answer;
	 	))->row();
	 } 
}