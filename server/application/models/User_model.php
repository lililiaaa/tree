<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');

class User_model extends CI_Model{
	
	// by 袁庆龙 start
	
	//获取用户的 叶子币数，房子数，精灵数
	 //params: openid
	 //http: post 
   public function get_M_H_S($u_id){
		$sql = 'SELECT leaves,COUNT("house_id"),COUNT("sprite_id") FROM `user`
					LEFT JOIN `user_house` on `user_house`.u_id = `user`.u_id
					LEFT JOIN `user_sprite` on `user_sprite`.sprite_id = `user`.u_id 
					WHERE `user`.u_id in ( '. $u_id.' )';
		return  $this->db->query($sql)->result();
	}

	//获得用户的所有精灵
	// param ：u_id
    public function get_all_sprite($u_id){
		$sql = 'SELECT * FROM `user_sprite`
				LEFT JOIN `sprite`.sprite_id = `user_sprite`.sprite_id 
				WHERE `user`.u_id in ( '.$u_id.' )';
		return $this->query($sql)->result();
	}
	
	// 获得指定精灵的信息
	// params :sprit_id
	public function get_one_sprite($sprite_id){
		return $this->db->get_where('sprite',array(
			'sprite_id' => $sprite_id
		))->row();
	}

	//  public function find_by_glod($glod) {
	//  	return $this->db->get_where('user',
	//  		array(
	//  		"glod" = >$glod;
	//  	))->row();
	//  } 

	//  by 袁庆龙 end
	 
}