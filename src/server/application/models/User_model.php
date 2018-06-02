<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');

class User_model extends CI_Model{
	 
	 public function find_by_glod($glod) {

	 	return $this->db->get_where('user',
	 		array(
	 		"glod"=>$glod;
	 	))->row();
	 } 

	 //////////签到/////////////////
	  public function update_sign_in_($uid){
		$data=array(
    		'mark'=>++$mark,
    		'leaves'=>$leaves+=15,
		);
		$bool=$this->db->update('user',$data,array('openid'=>$uid));//将数据库.user表里id=3的用户密码给为12345
		return $bool;
	  }
	 
}