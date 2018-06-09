<?php

// use \PDO;
use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class Vocabulary_model extends CI_Model 
{
  // by 袁庆龙 start

  // 获取单词id，词汇文本和正确、错误选项
  public function get_answer_by_vocabulary(){
    	$pdo = DB::getInstance();
      $sql = 'SELECT  * FROM `word`
              WHERE (word_id >= ((SELECT MAX(word_id) FROM `word`)-(SELECT MIN(word_id) FROM `word`)) * RAND() 
              + (SELECT MIN(word_id) FROM `word`) ) LIMIT 12' ;          
      $sql_p = $pdo->prepare($sql);
      $res = $sql_p->execute(); 
      if($res == 'TRUE'){
        return $res->fetchAll(PDO::FETCH_ASSOC);
      }else{
        return 'FALSE';
      }
  }
  
  //更新正确的单词数量
  // return  受影响行数
  public function update_word($u_id,$words){
    $res = DB::update('user ', ['words' => $words], ['u_id' => $u_id]);
    return $res;
  }

  //by 袁庆龙 end

}