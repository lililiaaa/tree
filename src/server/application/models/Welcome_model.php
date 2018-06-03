<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');
class Welcome_model extends CI_Model{

    public function __construct()
    {
        parent::__construct();
        //Do your magic here
        $pdo = new PDO("localhost","cAuth","wxdc3e0648f98f4400");  
    }
    
    // by 袁庆龙 start

    //查找是否存在该用户，不存在则存储该用户
    public function exist_or_storage($u_id,$openid){
        $sql = '';
        $query = $this->db->query($sql);
        return $this->db->affected_rows();
    }  
    
    //查询用户 返回data数组
    public function user_select($open_id){
        $sql = 'SELECT * FROM `user` where `user`.open_id in ( '.$open_id.')';
        $res = $pdo->query($sql);   
        if(res != 'FALSE'){
            $data = [];
            while($row = $res->fetch(\PDO::FETCH_ASSOC)){
                $data[] = $row;
            }
            return $data;
        }else{
            return 'FALSE';
        }
        
        
    }
    // 插入新用户 返回受影响的行数
    public function user_set($open_id){
        $sql = 'INSERT INTO user(openid) VALUES('.$open_id.')';
        return $pdo->exec($sql);
    }


    // by 袁庆龙 end

}  
?>