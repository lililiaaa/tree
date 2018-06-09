<?php defined('BASEPATH') OR exit('No direct script access allowed');

	use QCloud_WeApp_SDK\Mysql\Mysql as DB;

	class Vocabulary_model extends CI_Model{
		
		//by 陈嘉悦 start

		//获取一道随机题目的信息
		public function get_question(){
			$pdo = DB::getInstance();
			$sql = "select * from word order by rand() limit 0,1";
			$stmt = $pdo -> prepare($sql);
    		$stmt -> execute();
    		return $stmt -> fetchAll(PDO::FETCH_ASSOC);
		}

		//判断是否答对
		public function judge($word_id, $answer){
			$pdo = DB::getInstance();
			$sql = "select * from word where word_id=".$word_id."and right=".$answer;
			$stmt = $pdo -> prepare($sql);
    		$stmt -> execute();
    		return $stmt -> fetchAll(PDO::FETCH_ASSOC);
		}

		//如果答对该用户的叶子币+1
		public function correct($u_id){
			$pdo = DB::getInstance();
			$sql = "update user set leaves=leaves+1, words=words+1 where u_id=".$u_id;
			$pdo->exec($sql);
			$stmt =$pdo->prepare($strSql);
      		$stmt->execute();
		}

		//by 陈嘉悦 end

	}
?>