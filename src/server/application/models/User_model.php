<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');

use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class User_model extends CI_Model{
	
	// by 袁庆龙 start

	//获取用户的 叶子币数，房子数，精灵数
	 //params: openid
	 //http: post 
	 //return: 结果数组 或者 'FALSE'
    public function get_M_H_S($u_id){
		$pdo = DB::getInstance();
		$sql = 'SELECT leaves,COUNT("house_id"),COUNT("sprite_id") FROM `user`
					LEFT JOIN `user_house` on `user_house`.u_id = `user`.u_id
					LEFT JOIN `user_sprite` on `user_sprite`.u_id = `user`.u_id 
					WHERE `user`.u_id in ( '.$u_id.' )';
		$sql_p = $pdo->prepare($sql);
        $res = $sql_p->execute(); 
		if($res == 'TRUE'){
			return $res->fetchAll(PDO::FETCH_ASSOC);
		}else{
			return 'FALSE';
		} 
	}


	//params : $receiver,$sender
	//return 受影响行数 
	// public function del_fri($receiver,$sender){
	// 	$rows = DB::delete('friend', [
	// 		'u_id' => $receiver,
	// 		'f_u_id' =>$sender
	// 	]);
	// 	return $row;
	// }


	// 获得用户的所有精灵
	// param ：$u_id
	// return: 结果数组 或者 'FALSE'
    public function get_all_sprite($u_id){
		$pdo = DB::getInstance();
		$sql = 'SELECT COUNT(*) FROM `user_sprite`
				LEFT JOIN `sprite`.sprite_id = `user_sprite`.sprite_id 
				WHERE `user`.u_id in ( '.$u_id.' )';
		$sql_p = $pdo->prepare($sql);
		$res = $sql_p->execute();
		if($res == 'TRUE'){
			return $res->fetchAll(PDO::FETCH_ASSOC);
		}else{
			return 'FALSE';
		} 
	}

	//获得用户的所有房子
	// param ：$u_id
	//return: 结果数组 或者 'FALSE'
    public function get_all_sprite($u_id){
		$pdo = DB::getInstance();
		$sql = 'SELECT COUNT(*) FROM `user_house`
				LEFT JOIN `house`.house_id = `user_house`.house_id 
				WHERE `user`.u_id in ( '.$u_id.' )';
		$sql_p = $pdo->prepare($sql);
        $res = $sql_p->execute(); 
		if($res == 'TRUE'){
			return $res->fetchAll(PDO::FETCH_ASSOC);
		}else{
			return 'FALSE';
		}
	}


	// 获取精灵的对话
	// FALSE 或者 数组
	public function sprite_dialog($sprite_id){
		$pdo = DB::getInstance();
		$sql = 'SELECT * FROM `sprite_dialog`  WHERE `sprite_id` IN ('.$sprite_id.')';
		$sql_p = $pdo->prepare($sql);
        $res = $sql_p->execute(); 
		if($res == 'TRUE'){
			return $res->fetchAll(PDO::FETCH_ASSOC);
		}else{
			return 'FALSE';
		}
	}

	// 获得指定精灵的信息
	// params :sprit_id
	//return 结果数组或者 [] 数组
	public function get_one_sprite($sprite_id){
		$rows = DB::select('sprite', ['sprite_id' => $sprite_id]);
		return $rows;
	}

	// 获得指定house的信息
	// params :house_id
	//return 结果数组或者 [] 数组
	public function get_one_house($house_id){
		$rows = DB::select('house', ['house_id' => $house_id]);
		return $rows;
	}


	// 获得用户的某个精灵信息
	// return 数组 或者 FALSE
	public function get_own_sprite($uid,$sprite_id){
		$sql = 'SELECT * FROM `user_sprite` 
				LEFT JOIN `sprite` on `user_sprite`.u_id = `sprite.u_id`';
		$sql_p = $pdo->prepare($sql);
        $res = $sql_p->execute(); 
		if($res == 'TRUE'){
			return $res->fetchAll(PDO::FETCH_ASSOC);
		}else{
			return 'FALSE';
		}
	}	
	
	// 获得用户的某个house信息
	// return 数组 或者 FALSE
	public function get_own_house($uid,$house_id){
		$sql = 'SELECT * FROM `user_sprite` 
				LEFT JOIN `sprite` on `user_sprite`.u_id = `sprite.u_id`';
		$sql_p = $pdo->prepare($sql);
        $res = $sql_p->execute(); 
		if($res == 'TRUE'){
			return $res->fetchAll(PDO::FETCH_ASSOC);
		}else{
			return 'FALSE';
		}
	}

	// 更换精灵
	//return 受影响行数 
    public function change_sprite($u_id,$used_id,$using_id){
        // $rows_1 = DB::update('user_sprite', ['use_status' => 'using'], ['u_id' => $u_id,'sprite_id'=>$using_id]);
		// $rows_2 = DB::update('user_sprite', ['use_status' => 'unuse'], ['u_id' => $u_id,'sprite_id'=>$used_id]);
		$pdo = DB::getInstance();
		$sql = 'UPDATE `user_sprite` AS `us1`,`user_sprite` AS `us2` SET `us1`.use_status = "unuse",`us2`.use_status = "using" 
				WHERE `us1`.u_id = '.$u_id.' AND `us1`.sprite_id = '.$used_id
				.' AND `us2`.u_id = '.$u_id.' AND `us2`.sprite_id = '.$using_id;	
		$sql_p = $pdo->prepare($sql);
		$res = $sql_p->execute();
		$count = $stmt->rowCount();
		return $count; 
	}
	

	// 更换house
	//return 受影响行数 
    public function change_house($u_id,$used_id,$using_id){
        $pdo = DB::getInstance();
		$sql = 'UPDATE `user_house` AS `us1`,`user_house` AS `us2` SET `us1`.use_status = "unuse",`us2`.use_status = "using" 
				WHERE `us1`.u_id = '.$u_id.' AND `us1`.house_id = '.$used_id
				.' AND `us2`.u_id = '.$u_id.' AND `us2`.house_id = '.$using_id;	
		$sql_p = $pdo->prepare($sql);
		$res = $sql_p->execute();
		$count = $stmt->rowCount();
		return $count; 
    }

	// 喂养
	// leaves 减少后的总数量 精灵成长状态
	//return 受影响行数
	public function grow($leaves,$sprite_id,$u_id){
		$pdo = DB::getInstance();
		$sql = 'UPDATE `user_sprite` LEFT JOIN `user` ON `user_sprite`.u_id = `user`.u_id SET leaves='.$leaves.',percent='.$percent.',status='.$status .'
		WHERE `user`.u_id = '.$u_id.' AND `sprite_id` = '.$sprite_id;
		$sql_p = $pdo->prepare($sql);
        $res = $sql_p->execute();
		$count = $stmt->rowCount();
		return $count; 
	}
	
	// 获得指定房子的信息
	// params :sprit_id
	//return 结果数组或者 [] 数组
	public function get_one_sprite($house_id){
		$rows = DB::select('house', ['house_id' => $house_id]);
		return $rows;
	}

	//  by 袁庆龙 end
	 
}