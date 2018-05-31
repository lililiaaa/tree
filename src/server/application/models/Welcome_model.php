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
    //查找是否存在该用户，不存在则存储该用户
    public function exist_or_storage(){
        $sql = ''
    }    

   public function curl_get_https($url){
    $curl = curl_init(); // 启动一个CURL会话
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, true);  // 从证书中检查SSL加密算法是否存在
    $tmpInfo = curl_exec($curl);     //返回api的json对象
    //关闭URL请求
    curl_close($curl);
    return $tmpInfo;    //返回json对象
}

?>