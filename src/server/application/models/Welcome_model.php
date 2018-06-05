<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');

   use QCloud_WeApp_SDK\Mysql\Mysql as DB;

    class Welcome_model extends CI_Model{   
    // by 袁庆龙 start
    
    //查询用户 获得用户信息
    //  返回data数组
    public function user_select($open_id){
        $pdo = DB::getInstance();
        $sql = 'SELECT * FROM `user` where `user`.open_id in ( '.$open_id.')';
        $res = $pdo->query($sql);   
        if($res != 'FALSE'){
            $data = [];
            while($row = $res->fetch(PDO::FETCH_ASSOC)){
                $data[] = $row;
            }
            return $data;
        }else{
            return 'FALSE';
        }
        
        
    }
    // 添加新用户 
    //return 返回受影响的行数
    public function user_set($open_id){
        $pdo = DB::getInstance();
        $sql = 'INSERT INTO user(openid) VALUES('.$open_id.')';
        return $pdo->exec($sql);
    }

    //排行榜
    public function compare_list(){
        $pdo = DB::getInstance();
        $sql = 'SELECT * FROM `user`  ORDER BY `user`.leaves LIMIT(30)';
        $res = $pdo->query($sql);
        foreach ($res->fetch(\PDO::FETCH_ASSOC) as $row ) {
            # code...
        }
    }

    // by 袁庆龙 end

}  
?>