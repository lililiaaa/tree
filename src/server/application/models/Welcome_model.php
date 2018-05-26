<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');
class Welcome_model extends CI_Model{
    //搜索商品——车，屋子，精灵
    public function search_all($search_word){
        $sql = 'SELECT  * FROM  `car`,`house`,`sprite`
                WHERE `car`.car_name in ('.$search_word.
                ') OR `house`.house_name in ('.$search_word.
                ') OR `sprite`.sprite_name  in ('.$search_word.')';
        $query = $this->db->query($sql);
        return $query->result();
    } 
}

?>