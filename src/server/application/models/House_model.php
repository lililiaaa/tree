<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');

class House_model extends CI_Model{
	 
	 public function find_all() {

	 	return ->db->ger('house')->result();
	 }
	 
}
