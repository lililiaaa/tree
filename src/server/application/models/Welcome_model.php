<?php
defined('BASEPATH') OR exit('NO direct stcript access allowed');

   use QCloud_WeApp_SDK\Mysql\Mysql as DB;

    class Welcome_model extends CI_Model{   
    // by 袁庆龙 start
    public function __construct()
    {
        parent::__construct();
        $pdo = DB::getInstance();
        // $Mysql = [
        //     'host' => 'localhost',
        //     'port' => 3306,
        //     'user' => 'root',
        //     'db'   => 'cAuth',
        //     'pass' => '',
        //     'char' => 'utf8mb4'
        // ];
        // $dsn = "mysql:host=$Mysql['host'];dbname=$Mysql['db'];port=$Mysql['port'];charset=$Mysql['char']";
        // $pdo = $conn = new PDO($dsn,$Mysql['user'],$Mysql['pass']);
    }
    
    //查询用户 返回data数组
    public function user_select($open_id){
        $sql = 'SELECT * FROM `user` where `user`.open_id in ( '.$open_id.')';
        $res = $pdo->query($sql);   
        if($res != 'FALSE'){
            $data = [];
            while($row = $res->fetch(\PDO::FETCH_ASSOC)){
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
        $sql = 'INSERT INTO user(openid) VALUES('.$open_id.')';
        return $pdo->exec($sql);
    }


    // by 袁庆龙 end

}  
?>