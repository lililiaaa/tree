<?php defined('BASEPATH') OR exit('No direct script access allowed');

	use QCloud_WeApp_SDK\Mysql\Mysql as DB;

	class Sports_model extends CI_Model{

		//修改user表中的运动步数和叶子币数
		public function change_num($u_id, $steps, $leaves){
			$pdo = DB::getInstance();
			$sql = "update user set steps=".$steps.", leaves=leaves+".$leaves." where u_id=".$u_id;
			$pdo->exec($sql);
			$stmt =$pdo->prepare($strSql);
      		$stmt->execute();
		}
	}
?>