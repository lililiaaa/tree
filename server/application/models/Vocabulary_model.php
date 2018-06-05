<?php defined('BASEPATH') OR exit('No direct script access allowed');

	class Vocabulary_model extends CI_Model{
		
		//by 陈嘉悦 start

		//获取一道随机题目的信息
		public function get_question(){
			$sql = "select * from word order by rand() limit 0,1";
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

		//判断是否答对
		public function judge($word_id, $answer){
			$sql = "select * from word where word_id=".$word_id."and right=".$answer;
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

		//如果答对该用户的叶子币+1
		public function correct($u_id){
			$sql = "update user set leaves=leaves+1, words=words+1 where u_id=".$u_id;
			return $pdo->exec($sql);
		}

		//by 陈嘉悦 end

	}
?>