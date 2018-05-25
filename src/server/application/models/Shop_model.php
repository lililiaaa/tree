<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');

class Shop_model extends CI_Model{
	 
	 public function find_all() {

	 	return ->db->ger('shop')->result();
	 }
	 
}
