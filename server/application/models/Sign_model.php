<?php defined('BASEPATH') OR exit('No direct script access allowed');

	class Sign_model extends CI_Model{

		//获取用户叶子币数和签到天数
		public function get_condition($uid){
			$sql = "select * from user where u_id=".$u_id;
			$res = $pdo->query($sql);
			if(res != 'FALSE'){
	            $data = [];
	            while($row = $res->fetch(\PDO::FETCH_ASSOC)){
	                $data[] = $row;
	            }
	            return $data;
	        }else{
	            return 'FALSE';
	        }
		}

		//当前用户叶子币+5,天数+1
		public function succ($u_id){
			$sql = "update user set leaves=leaves+5, mark=mark+1 where u_id=".$u_id;
			return $pdo->exec($sql);
		}
	}
?>