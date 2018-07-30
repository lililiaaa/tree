<?php

use QCloud_WeApp_SDK\Mysql\Mysql as DB;
class Vocabulary_model extends CI_Model 
{
	
	public function get_lisfind_by_describe_answert($start, $limit)
    {
        return DB::select('vocabulary', ['*'], "", "", "limit $start,$limit");
    }

  public function get_answer_by_vocabulary($vocabulary_id)
  {
    return DB::select('answer', ['*'], ['vocabulary_id' => $vocabulary_id]);
  }
	// public function get_vocabulary(){
  //     $pdo = DB::getInstance();
	// 		$sql="select * from vocabulary"; 
  //     $query=$pdo -> prepare($sql);
  //     $query->execute();
  //     return $query -> fetchObject();
   
  //   }
      public function get_user_list($ouserid){//获取叶子币和单词数，对题数
			return DB::select('user', ['*'],'u_id="'.$ouserid.'"');
		}
      public function user_list_words($words,$ouserid){//修改单词数
			$pdo = DB::getInstance();
      $strSql="UPDATE user SET words=".$words." WHERE u_id=".$ouserid;
      $pdo->exec($strSql);
      $stmt =$pdo->prepare($strSql);
      $stmt->execute();
		}
     public function user_list_omoney($omoney,$ouserid){//修改yezi数
			$pdo = DB::getInstance();
      $strSql="UPDATE user SET leaves=".$omoney." WHERE u_id=".$ouserid;
      $pdo->exec($strSql);
      $stmt =$pdo->prepare($strSql);
      $stmt->execute();
		}
     public function user_list_rights($rights,$ouserid){//修改对的单词数
			$pdo = DB::getInstance();
      $strSql="UPDATE user SET quizzes=".$rights." WHERE u_id=".$ouserid;
      $pdo->exec($strSql);
      $stmt =$pdo->prepare($strSql);
      $stmt->execute();
		}
}