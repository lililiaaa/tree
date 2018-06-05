<?php defined('BASEPATH') OR exit('No direct script access allowed');

	class Quiz_model extends CI_Model{
		
		//by 陈嘉悦 start

		//获取一道随机题目的信息
		public function get_all(){
			$sql = "select * from quiz order by rand() limit 0,1";
			$res = $this->db->query($sql);
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

		//判断是否答对
		public function judge($quiz_id, $answer){
			$sql = "select * from quiz where quiz_id=".$quiz_id."and right=".$answer;
			$res = $this->db->query($sql);          
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

		//如果答对该用户的叶子币+1
		public function correct($u_id){
			$sql = "update user set leaves=leaves+1, quizes=quizes+1 where u_id=".$u_id;
			return $pdo->exec($sql);
		}
		
		//by 陈嘉悦 end
	}
?>