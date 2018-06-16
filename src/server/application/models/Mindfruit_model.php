<?php defined('BASEPATH') OR exit('No direct script access allowed');

	use QCloud_WeApp_SDK\Mysql\Mysql as DB;

	class Mindfruit_model extends CI_Model{

		public function get_leaves($u_id){
      $pdo = DB::getInstance();
			$sql="SELECT `user`.leaves,`mind_fruit`.chance FROM `user` LEFT JOIN `mind_fruit` ON `user`.u_id=`mind_fruit`.u_id WHERE `user`.u_id=".$u_id.""; 
      $query=$pdo -> prepare($sql);
      $query->execute();
      return $query -> fetchObject();
    }
    public function ud_chance($u,$c){
      $pdo = DB::getInstance();
			$sql="UPDATE `mind_fruit` SET `chance`=".$c." WHERE `u_id`=".$u.""; 
      $query=$pdo -> prepare($sql);
      $query->execute();
    }
    public function add_leaves($u){
      $pdo = DB::getInstance();
			$sql="UPDATE `user` SET `leaves`=`leaves`+100 WHERE `u_id`=".$u.""; 
      $query=$pdo -> prepare($sql);
      $query->execute();
    	$sql="SELECT `leaves` FROM `user` WHERE `u_id`=".$u.""; 
      $query=$pdo -> prepare($sql);
      $query->execute();
      return $query -> fetchObject();
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