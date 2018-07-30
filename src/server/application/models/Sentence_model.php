<?php
	use QCloud_WeApp_SDK\Mysql\Mysql as DB;
	class Sentence_model extends CI_Model{
    public function getmyuserinhouselist($ourseid){
       $db = DB::getInstance();
        $strSql = "SELECT housein_img FROM user_house AS a,house_inside AS b WHERE a.house_id=b.house_id AND a.u_id=".$ourseid." and use_status='true'";
        $result=$db->query($strSql);
        return $result->fetchAll();
    }
    //获取精灵列表
    public function getuserpetlist($ourseid){
      $db = DB::getInstance();
      $strSql = "SELECT * FROM user_sprite AS a,sprite AS b WHERE a.sprite_id=b.sprite_id AND a.u_id=".$ourseid." and use_status='true'";
      $result=$db->query($strSql);
      return $result->fetchAll();
    }
     //获取房屋列表
      public function gethouselist($ourseid){
        $db = DB::getInstance();
        $strSql = "SELECT * FROM user_house AS a,house AS b WHERE a.house_id=b.house_id AND a.u_id=".$ourseid;
        $result=$db->query($strSql);
        return $result->fetchAll();
      }
      //获取精灵列表
       public function getpersonlist($ourseid){
        $db = DB::getInstance();
        $strSql = "SELECT * FROM user_sprite AS a,sprite AS b WHERE a.sprite_id=b.sprite_id AND u_id=".$ourseid;
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
    //获取树屋数和精灵数
    public function gethapnum($ouserid){
      $pdo = DB::getInstance();
      $hounum="SELECT COUNT(u_id) FROM user_house where u_id=".$ouserid;
      $petnum="SELECT COUNT(u_id) FROM user_sprite where u_id=".$ouserid;
      $ohounum=$pdo->query($hounum);
      $opetnum=$pdo->query($petnum);
      return array($ohounum->fetch(),$opetnum->fetch());
    }
    //获取房屋图片和精灵图片
    public function gethousepet($ourseid){
      $db = DB::getInstance();
      $strSql = "SELECT img_inside FROM user_house AS a,house AS b WHERE a.house_id=b.house_id AND a.u_id=".$ourseid." AND a.use_status='true'";
      $result=$db->query($strSql);
      $strSql2 = "SELECT img FROM user_sprite AS a,sprite AS b WHERE a.sprite_id=b.sprite_id AND a.u_id=".$ourseid." AND a.use_status='true'";
      $result2=$db->query($strSql2);
      return array($result->fetch(),$result2->fetch());
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
      $mystrSql = "select * from friend where u_id=".$ourseid." and f_u_id=".$adduserautid;
      $myresult=$db->query($mystrSql);
      $toogle= $myresult->fetchAll();
      if($adduserautid==$ourseid){
        return "添加自己";
      }
      else if($toogle){
        return "此人您已添加";
      }
      else{
        DB::insert('friend', [
          'u_id' => $ourseid,
          'f_u_id'=> $adduserautid
        ]);
      }
		}
    // //获取好友列表
    public function getfriend_list($ouserid){//获取好友列表
      $db = DB::getInstance();
      $strSql = "SELECT * FROM friend AS a,user AS b WHERE a.f_u_id=b.u_id AND a.u_id=".$ouserid;
      $result=$db->query($strSql);
      return $result->fetchAll();
		}
    // //获取好友树屋和精灵
     public function houseandpet($oheadimg,$oname,$omoney){//获取好友树屋和精灵
      $ouseraut = DB::row('user', ['u_id'], 'avatarUrl = "'.$oheadimg.'" and name="'.$oname.'" and leaves="'.$omoney.'"');
      $adduserautid= $ouseraut->u_id;

      $db = DB::getInstance();
      $strSql = "SELECT img_inside FROM user_house AS a,house AS b WHERE a.house_id=b.house_id AND a.u_id=".$adduserautid." AND a.use_status='true'";
      $result=$db->query($strSql);
      $strSql2 = "SELECT img FROM user_sprite AS a,sprite AS b WHERE a.sprite_id=b.sprite_id AND a.u_id=".$adduserautid." AND a.use_status='true'";
      $result2=$db->query($strSql2);
      return array($result->fetch(),$result2->fetch());
     }
     //获取好友树屋和精灵个数
     public function getfriendhapnum($oheadimg,$oname,$omoney){
        $ouseraut = DB::row('user', ['u_id'], 'avatarUrl = "'.$oheadimg.'" and name="'.$oname.'" and leaves="'.$omoney.'"');
        $adduserautid= $ouseraut->u_id;

        $pdo = DB::getInstance();
        $hounum="SELECT COUNT(u_id) FROM user_house where u_id=".$adduserautid;
        $petnum="SELECT COUNT(u_id) FROM user_sprite where u_id=".$adduserautid;
        $ohounum=$pdo->query($hounum);
        $opetnum=$pdo->query($petnum);
        return array($ohounum->fetch(),$opetnum->fetch());
     }
    //  //修改叶子币数
      public function modifylmoney($omoney,$ouserid){//修改叶子币数
        $ouseraut = DB::row('user', ['leaves'], 'u_id = "'.$ouserid.'"');
        $addlmoney= $ouseraut->leaves;
        $allmoney=$addlmoney+$omoney;
        $pdo = DB::getInstance();
        $strSql="UPDATE user SET leaves=".$allmoney." WHERE u_id=".$ouserid;
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
      //修改用户房屋
      public function updateuserhouse($ourseid,$housename,$houseimg){
        $pdo = DB::getInstance();
        $strSql="UPDATE user_house SET use_status='false' WHERE u_id=".$ourseid;
        $stmt =$pdo->prepare($strSql);
        $stmt->execute();

        $ohouseid = DB::row('house', ['house_id'], 'house_name = "'.$housename.'" and img_inside="'.$houseimg.'"');
        $addohouseid= $ohouseid->house_id;

        $updataSql="UPDATE user_house SET use_status='true' WHERE u_id=".$ourseid." and house_id=".$addohouseid;
        $pdo->exec($updataSql);
        $upstmt =$pdo->prepare($updataSql);
        $upstmt->execute();
      }
      //修改用户精灵
       public function updateuserpet($ourseid,$housename,$houseimg){
        $pdo = DB::getInstance();
        $strSql="UPDATE user_sprite SET use_status='false' WHERE u_id=".$ourseid;
        $stmt =$pdo->prepare($strSql);
        $stmt->execute();

        $ohouseid = DB::row('sprite', ['sprite_id'], 'sprite_name = "'.$housename.'" and img="'.$houseimg.'"');
        $addohouseid= $ohouseid->sprite_id;

        $updataSql="UPDATE user_sprite SET use_status='true' WHERE u_id=".$ourseid." and sprite_id=".$addohouseid;
        $pdo->exec($updataSql);
        $upstmt =$pdo->prepare($updataSql);
        $upstmt->execute();
       }
       //房屋内部
       public function getuserinhouselist($ourseid){
        $db = DB::getInstance();
        $strSql = "SELECT * FROM user_house AS a,house AS b WHERE a.house_id=b.house_id AND a.u_id=".$ourseid." AND a.use_status='true'";
        $result=$db->query($strSql);
        return array($result->fetch());
       }
  }
?> 