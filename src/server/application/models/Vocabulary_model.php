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


}