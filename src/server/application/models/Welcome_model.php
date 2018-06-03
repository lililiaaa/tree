<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');
class Welcome_model extends CI_Model{
    // by 袁庆龙 start

    //搜索商品——车，屋子，精灵
    public function search_all($search_word){
        $sql = 'SELECT  * FROM  `car`,`house`,`sprite`
                WHERE `car`.car_name in ('.$search_word.
                ') OR `house`.house_name in ('.$search_word.
                ') OR `sprite`.sprite_name  in ('.$search_word.')';
        $query = $this->db->query($sql);
        return $query->result();
    } 

    //查找是否存在该用户，不存在则存储该用户
    public function exist_or_storage($u_id,$openid){
        $sql = '';
        $query = $this->db->query($sql);
        return $this->db->affected_rows();
    }  
    
    // by 袁庆龙 end

}  
?>