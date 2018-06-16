<?php defined('BASEPATH') OR exit('NO direct stcript access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

	class Sprite_model extends CI_Model{
	public function get(){
      $pdo = DB::getInstance();
			$sql="select * from sprite"; 
      $query=$pdo -> prepare($sql);
      $query->execute();
      return $query -> fetchAll(PDO::FETCH_ASSOC);
   
    }
     public function get_details($id){
      $pdo = DB::getInstance();
			$sql="select * from sprite where sprite_id=".$id.""; 
      $query=$pdo -> prepare($sql);
      $query->execute();
      return $query -> fetchObject();
    }
    public function sprite_buy($u,$s,$l){
      $pdo = DB::getInstance();
			$sql="UPDATE `user` SET `leaves`=".$l." WHERE 1"; 
      $query=$pdo -> prepare($sql);
      $query->execute();
      $sql="INSERT INTO `user_sprite`(`u_id`, `sprite_id`) VALUES (".$u.",".$s.")";
       $query=$pdo -> prepare($sql);
      $query->execute();
      // return $query -> fetchObject();
    }
	}

?>