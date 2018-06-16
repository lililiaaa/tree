<?php
	use QCloud_WeApp_SDK\Mysql\Mysql as DB;
	class Sentence_model extends CI_Model{
     //获取房屋列表
      public function gethouselist($ourseid){
        $db = DB::getInstance();
        $strSql = "SELECT * FROM user_house AS a,house AS b WHERE a.house_id=b.house_id AND u_id=".$ourseid;
        $result=$db->query($strSql);
        return $result->fetchAll();
      }
      //获取精灵列表
       public function getpersonlist($ourseid){
        $db = DB::getInstance();
        $strSql = "SELECT * FROM sprite_dialog AS a,sprite AS b WHERE a.sprite_id=b.sprite_id AND dialog_id=".$ourseid;
        $result=$db->query($strSql);
        return $result->fetchAll();
      }
    //获取排行
		public function getlist(){//获取排行
			$db = DB::getInstance();
      $strSql = "select *,(@rowNum:=@rowNum+1) as rowNo from user,(select (@rowNum :=0) ) b order by leaves desc limit 5";
      $result=$db->query($strSql);
      return $result->fetchAll();
		}
    // //获取排行和叶子币
    public function getpaimonlist(){
      $db = DB::getInstance();
      $strSql = "select *,(@rowNum:=@rowNum+1) as rowNo from user,(select (@rowNum :=0) ) b order by leaves desc";
      $result=$db->query($strSql);
      return $result->fetchAll();
    }
    // //获取叶子币和签到天数
    public function getsigninlist($ouserid){//获取叶子币和签到天数
			return DB::select('user', ['*'],'u_id="'.$ouserid.'"');
		}
    // //修改叶子币数和签到天数
    public function modifyuser_list($omoney,$oday,$ouserid){//修改叶子币数和签到天数
			$pdo = DB::getInstance();
      $strSql="UPDATE user SET leaves=".$omoney.",mark=".$oday." WHERE u_id=".$ouserid;
      $pdo->exec($strSql);
      $stmt =$pdo->prepare($strSql);
      $stmt->execute();
		}
    //  //添加好友
    public function addfriendlist($oheadimg,$oname,$omoney,$ourseid){
		  $ouseraut = DB::row('user', ['u_id'], 'avatarUrl = "'.$oheadimg.'" and name="'.$oname.'" and leaves="'.$omoney.'"');
      $adduserautid= $ouseraut->u_id;
			$db = DB::getInstance();
      $mystrSql = "select * from friend where um_id=".$ourseid." and f_u_id=".$adduserautid;
      $myresult=$db->query($mystrSql);
      $toogle= $myresult->fetchAll()!=[];
      if($adduserautid==$ourseid){
        return "添加自己";
      }
      else if($toogle){
        return "此人您已添加";
      }
      else{
        DB::insert('friend', [
          'um_id' => $ourseid,
          'f_u_id'=> $adduserautid
        ]);
      }
		}
    // //获取好友列表
    public function getfriend_list($ouserid){//获取好友列表
      $db = DB::getInstance();
      $strSql = "SELECT * FROM friend AS a,user AS b WHERE a.f_u_id=b.u_id AND um_id=".$ouserid;
      $result=$db->query($strSql);
      return $result->fetchAll();
		}
    // //获取好友树屋和精灵
     public function houseandpet($oheadimg,$oname,$omoney){//获取好友树屋和精灵
      $ouseraut = DB::row('user', ['u_id'], 'avatarUrl = "'.$oheadimg.'" and name="'.$oname.'" and leaves="'.$omoney.'"');
      $adduserautid= $ouseraut->u_id;
      $db = DB::getInstance();
      $strSql = "SELECT * FROM user_house AS a,house AS b WHERE a.house_id=b.house_id AND u_id=".$adduserautid;
      $result=$db->query($strSql);
      return $result->fetchAll();
      // return DB::select('use', ['*'],'u_id="'.$adduserautid.'"');
     }
    //  //修改叶子币数
      public function modifylmoney($omoney,$ouserid){//修改叶子币数
        $ouseraut = DB::row('user', ['u_id','leaves'], 'open_id = "'.$ouserid.'"');
        $adduserautid= $ouseraut->u_id;
        $addlmoney= $ouseraut->leaves;
        $allmoney=$addlmoney+$omoney;
        $pdo = DB::getInstance();
        $strSql="UPDATE user SET leaves=".$allmoney." WHERE u_id=".$adduserautid;
        $pdo->exec($strSql);
        $stmt =$pdo->prepare($strSql);
        $stmt->execute();
      }
      public function add_user_list($openid,$onickName,$oheadimg){
      $allopenid=DB::select('user', ['open_id']);//返回一维对象数组
      $onem=array();
      foreach($allopenid as $vol){//遍历对象数组，每次取出一个对象
         $onem[]=$vol->open_id;//取出对象中openid的值,$vol['openid']会报错
      }
      if(in_array($openid,$onem)){
        $ouid=DB::row('user', ['u_id'], 'open_id = "'.$openid.'"');
        return $ouid->u_id;
      }
      else{
        DB::insert('user', [
          'open_id' => $openid,
          'avatarUrl'=>$oheadimg,  
          'name'=>$onickName,
          'leaves'=>0,
          'mark'=>0
        ]);
        $ouid=DB::row('user', ['u_id'], 'open_id = "'.$openid.'"');
        return $ouid->u_id;
      }
      }
  }
?> 