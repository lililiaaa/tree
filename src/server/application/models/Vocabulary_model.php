<?php

use QCloud_WeApp_SDK\Mysql\Mysql as DB;
class Vocabulary_model extends CI_Model 
{

// 获取单词id，词汇文本和正确、错误选项
  public function get_answer_by_vocabulary(){
      $sql = 'SELECT  * FROM `word`
              WHERE (user_id >= ((SELECT MAX(user_id) FROM `t_user`)-(SELECT MIN(user_id) FROM `t_user`)) * RAND() 
                + (SELECT MIN(user_id) FROM `t_user`) )LIMIT 12'   ;          
          $query = $this->db->query($sql);
          return $query->result();
  }


}