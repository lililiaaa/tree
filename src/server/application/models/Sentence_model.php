<?php
	use QCloud_WeApp_SDK\Mysql\Mysql as DB;
	class Sentence_model extends CI_Model{
    //获取排行
		public function getlist(){//获取排行
			$db = DB::getInstance();
      $strSql = "select *,(@rowNum:=@rowNum+1) as rowNo from user_table,(select (@rowNum :=0) ) b order by user_lmoney desc limit 5";
      $result=$db->query($strSql);
      return $result->fetchAll();
		}
    //获取叶子币和签到天数
    public function getsigninlist($openid){//获取叶子币和签到天数
			return DB::select('user_table', ['*'],'openid="'.$openid.'"');
		}
    //修改叶子币数和签到天数
    public function modifyuser_list($omoney,$oday,$openid){//修改叶子币数和签到天数
      $ouseraut = DB::row('user_table', ['user_id'], 'openid = "'.$openid.'"');
      $adduserautid= $ouseraut->user_id;
			$pdo = DB::getInstance();
      $strSql="UPDATE user_table SET user_lmoney=".$omoney.",user_sday=".$oday." WHERE user_id=".$adduserautid;
      $pdo->exec($strSql);
      $stmt =$pdo->prepare($strSql);
      $stmt->execute();
		}
     //添加好友
    public function addfriendlist($oheadimg,$oname,$omoney,$openid){
		  $ouseraut = DB::row('user_table', ['user_id'], 'user_headimg = "'.$oheadimg.'" and user_name="'.$oname.'" and user_lmoney="'.$omoney.'"');
      $adduserautid= $ouseraut->user_id;
      $myidouseraut = DB::row('user_table', ['user_id'], 'openid = "'.$openid.'"');
      $myadduserautid= $myidouseraut->user_id;
			$db = DB::getInstance();
      // $myopenid="select user_id from user_table where openid=".$openid;
      $mystrSql = "select friend_table_id from friend_table where my_id=".$myadduserautid." and feiend_id=".$adduserautid;
      $myresult=$db->query($mystrSql);
      if($myresult){
        return "此人您已添加";
      }
      else{
        DB::insert('friend_table', [
          'my_id' => $myadduserautid,
          'feiend_id'=> $adduserautid
        ]);
      }
		}
?> 