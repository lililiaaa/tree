<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');

use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class User_model extends CI_Model{
	
	// by 袁庆龙 start

    public function __construct()
    {
        parent::__construct();
        $pdo = DB::getInstance();
	}
	
	//获取用户的 叶子币数，房子数，精灵数
	 //params: openid
	 //http: post 
	 //return: 结果数组 或者 'FALSE'
    public function get_M_H_S($u_id){
		$sql = 'SELECT leaves,COUNT("house_id"),COUNT("sprite_id") FROM `user`
					LEFT JOIN `user_house` on `user_house`.u_id = `user`.u_id
					LEFT JOIN `user_sprite` on `user_sprite`.sprite_id = `user`.u_id 
					WHERE `user`.u_id in ( '. $u_id.' )';
		$res = $pdo->query($sql);
		if($res != 'FALSE'){
            $data = [];
            while($row = $res->fetch(\PDO::FETCH_ASSOC)){
                $data[] = $row;
            }
            return $data;
        }else{
            return 'FALSE';
        }
	}

	// 添加朋友
	//params : $receiver,$sender
	//return 受影响行数
	public function add_fri($receiver,$sender){
		$row = DB::insert('friend', [
			'u_id' => $sender,
			'f_u_id' => $receiver
		]);
		return $row;
	}

	//params : $receiver,$sender
	//return 受影响行数 
	public function del_fri($receiver,$sender){
		$rows = DB::delete('friend', [
			'u_id' => $receiver,
			'f_u_id' =>$sender
		]);
		return 
	}

	// 查找某个好友
	//params: $u_name
	//return 结果数组 或者 [] 数组
	public function search_fri($u_name){
		$rows = DB::select('user', ['name' => $u_name]);
		return $rows;
	}

	//获得用户的所有精灵
	// param ：$u_id
	//return: 结果数组 或者 'FALSE'
    public function get_all_sprite($u_id){
		$sql = 'SELECT * FROM `user_sprite`
				LEFT JOIN `sprite`.sprite_id = `user_sprite`.sprite_id 
				WHERE `user`.u_id in ( '.$u_id.' )';
		$res = $pdo->query($sql);
		if($res != 'FALSE'){
			$data = [];
			while($row = $res->fetch(\PDO::FETCH_ASSOC)){
				$data[] = $row;
			}
			return $data;
		}else{
			return 'FALSE';
		}
	}
	
	// 获得指定精灵的信息
	// params :sprit_id
	//return 结果数组或者 [] 数组
	public function get_one_sprite($sprite_id){
		$rows = DB::select('user', ['name' => $u_name]);
		return $rows;
	}
 
	//  by 袁庆龙 end
	 
}