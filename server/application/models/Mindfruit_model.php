<?php defined('BASEPATH') OR exit('No direct script access allowed');

	use QCloud_WeApp_SDK\Mysql\Mysql as DB;

	class Mindfruit_model extends CI_Model{

		//
		public function get_info($uid){
			$pdo = DB::getInstance();
			$sql = "select * from user where u_id=".$u_id;
			$stmt = $pdo -> prepare($sql);
    		$stmt -> execute();
    		return $stmt -> fetchAll(PDO::FETCH_ASSOC);
		}

		//获取心情果实的结果（是否中奖）
		public function get_result(){
			$pdo = DB::getInstance();
			$sql = "select * from mind_fruit order by rand() limit 0,1";
			$stmt = $pdo -> prepare($sql);
    		$stmt -> execute();
    		return $stmt -> fetchAll(PDO::FETCH_ASSOC);

		}

		//如果中奖随机加叶子币
		public function prize($u_id, $leaf){
			$pdo = DB::getInstance();
			$sql = "update user set leaves=leaves+".$leaf." where u_id=".$u_id;
			$pdo->exec($sql);
			$stmt =$pdo->prepare($strSql);
      		$stmt->execute();
		}
	}

?>