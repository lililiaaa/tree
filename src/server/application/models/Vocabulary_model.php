<?php

use QCloud_WeApp_SDK\Mysql\Mysql as DB;

class Vocabulary_model extends CI_Model 
{
// 获取单词id，词汇文本和正确、错误选项
  public function get_answer_by_vocabulary(){
      $sql = 'SELECT  * FROM `word`
              WHERE (word_id >= ((SELECT MAX(word_id) FROM `word`)-(SELECT MIN(word_id) FROM `word`)) * RAND() 
                + (SELECT MIN(word_id) FROM `word`) )LIMIT 12' ;          
      $query = $this->db->query($sql);
      return $query->result();
  }

  //更新正确的单词数量
  public function update_word($open_id,$words){
    $res = DB::update('user ', ['words' => '1234567890'], ['open_id' => $open_id]);
    return $this->db->affected_rows();
  }
}