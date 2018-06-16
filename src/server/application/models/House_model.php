<?php defined('BASEPATH') OR exit('NO direct stcript access allowed');
use QCloud_WeApp_SDK\Mysql\Mysql as DB;
	class House_model extends CI_Model{
		public function get(){
      $pdo = DB::getInstance();
			$sql="select * from house"; 
      $query=$pdo -> prepare($sql);
      $query -> execute();
      return $query -> fetchAll(PDO::FETCH_ASSOC);
   
    }
    public function get_leaves($u_id){
      $pdo = DB::getInstance();
			$sql="SELECT `leaves` FROM `user` WHERE `u_id`=".$u_id.""; 
      $query=$pdo -> prepare($sql);
      $query->execute();
      return $query -> fetchObject();
    }
     public function get_details($h_id){
      $pdo = DB::getInstance();
			$sql="select * from house where house_id=".$h_id.""; 
      $query=$pdo -> prepare($sql);
      $query->execute();
      return $query -> fetchObject();
    }
    public function house_buy($u,$h,$l){
      $pdo = DB::getInstance();
			$sql="UPDATE `user` SET `leaves`=".$l." WHERE `u_id`=".$u.""; 
      $query=$pdo -> prepare($sql);
      $query->execute();
      $sql="INSERT INTO `user_house`(`u_id`, `house_id`) VALUES (".$u.",".$h.")";
       $query=$pdo -> prepare($sql);
      $query->execute();
      // return $query -> fetchObject();
    }
  }
?>