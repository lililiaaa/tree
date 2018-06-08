<?php
	use QCloud_WeApp_SDK\Mysql\Mysql as DB;
	class Sentence_model extends CI_Model{
    public function getdailylist(){
      $pdo = DB::getInstance();
      $sql = 'select count(*) from sentence_table';
      $result = $pdo->query($sql);//提交sql
      $rowsNumber = $result->fetchColumn();//取回结果集中的一个字段
      return $rowsNumber;
		}
    public function getdaylist($val){
      // return DB::select('sentence_table', ['*'],'sentence_id='.$val);
      $db = DB::getInstance();
      $strSql = "select * from sentence_table where sentence_id=".$val;
      $result=$db->query($strSql);
      return $result->fetchAll();
		}
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
    public function get_list5(){
			return DB::select('sentence_table', ['*'],'category_id=5');
		}
    public function get_list6(){
			return DB::select('sentence_table', ['*'],'category_id=6');
		}
    public function get_list7(){
			return DB::select('sentence_table', ['*'],'category_id=7');
		}
    public function get_list8(){
			return DB::select('sentence_table', ['*'],'category_id=8');
		}
    public function search_list($val){
      $db = DB::getInstance();
      $strSql = "select * from sentence_table where sentence_content like '%".$val."%'";
      $result=$db->query($strSql);
      return $result->fetchAll();
		}
    //添加用户
    public function add_user_list($openid,$onickName,$oheadimg){
      $allopenid=DB::select('user_table', ['openid']);//返回一维对象数组
      $onem=array();
      foreach($allopenid as $vol){//遍历对象数组，每次取出一个对象
         $onem[]=$vol->openid;//取出对象中openid的值,$vol['openid']会报错
      }
      if(in_array($openid,$onem)){
        //echo "该用户已存在";
      }
      else{
        DB::insert('user_table', [
          'openid' => $openid,
          'user_headimg'=>$oheadimg,
          'user_name'=>$onickName,
          'user_lmoney'=>0,
          'user_house'=>'http://p0.so.qhimgs1.com/bdr/_240_/t019dc82594b357f4da.jpg',
          'user_pet'=>'http://p2.so.qhimgs1.com/bdr/200_200_/t01f9da8c00bb4c7092.jpg',
          'user_sday'=>0
        ]);
      }
		}
    public function add_publish_list($otextarea,$oleibie,$oauthor,$oopenid){
      $db = DB::getInstance();
      $strSql = "select sentence_content from sentence_table where sentence_content like '%".$otextarea."%'";
      $result=$db->query($strSql);
      if($result->fetchAll()){
        return "句子重复";
      }
      else{
        $pdo = DB::getInstance();
        $sql = "insert into sentence_table (sentence_content,sentence_source,category_id) values (?,?,?)";
        $preObj = $pdo->prepare($sql);
        $res    = $preObj->execute(array($otextarea, $oauthor,$oleibie));
        $lastInsertId = $pdo->lastInsertId();//获取插入后的id
        $ouserid = DB::row('user_table', ['user_id'], 'openid = "'.$oopenid.'"');
        $adduserid= $ouserid->user_id;
        DB::insert('publish_table', [
          'sentence_id' => $lastInsertId,
          'user_id'=> $adduserid
        ]);

        $jifen="select user_integral from user_table where user_id=".$adduserid;
        $rejifen=$pdo->query($jifen);
        $duijifen=$rejifen->fetchAll();
        $jieguo=$duijifen[0][0]+2;
        $jiaer="UPDATE user_table SET user_integral=".$jieguo." WHERE user_id=".$adduserid;
        $pdo->exec($jiaer);
        $stmt =$pdo->prepare($jiaer);
        $stmt->execute(); 
        return  $jieguo;
      }
		}
    public function get_publish_list($oopenid){
      $ouserid = DB::row('user_table', ['user_id'], 'openid = "'.$oopenid.'"');
      $adduserid= $ouserid->user_id;
      $db = DB::getInstance();
      $strSql = "SELECT * FROM sentence_table AS a,publish_table AS b WHERE a.sentence_id=b.sentence_id AND user_id=".$adduserid;
      $result=$db->query($strSql);
      return $result->fetchAll();
		}
    public function add_collection_list($clasnam,$claauto,$oopenid){
      $pdo = DB::getInstance();
      // $strSql = "select sentence_id from sentence_table where sentence_content=".$clasnam;
      $ousersen = DB::row('sentence_table', ['sentence_id'], 'sentence_content = "'.$clasnam.'"');
      $ouseraut = DB::row('user_table', ['user_id'], 'openid = "'.$oopenid.'"');
      $addusersenid= $ousersen->sentence_id;
      $adduserautid= $ouseraut->user_id;
      $num=DB::row('collection_table', ['sentence_id'], 'sentence_id = "'.$addusersenid.'"');
      if($num==null){
         DB::insert('collection_table', [
            'sentence_id' => $addusersenid,
            'user_id'=> $adduserautid
        ]);
        $jifen="select user_integral from user_table where user_id=".$adduserautid;
        $rejifen=$pdo->query($jifen);
        $duijifen=$rejifen->fetchAll();
        $jieguo=$duijifen[0][0]+1;
        $jiaer="UPDATE user_table SET user_integral=".$jieguo." WHERE user_id=".$adduserautid;
        $pdo->exec($jiaer);
        $stmt =$pdo->prepare($jiaer);
        $stmt->execute(); 
        return  $jieguo;
      }
      else{
        return "此句子您已收藏";
      }
    }
    public function getcollection_list($oopenid){
        $ouserid = DB::row('user_table', ['user_id'], 'openid = "'.$oopenid.'"');
        $adduserid= $ouserid->user_id;
        $db = DB::getInstance();
        $strSql = "SELECT * FROM sentence_table AS a,collection_table AS b WHERE a.sentence_id=b.sentence_id AND user_id=".$adduserid;
        $result=$db->query($strSql);
        return $result->fetchAll();
    }
    public function getintegral($oopenid){
      $pdo = DB::getInstance();
      $ouseraut = DB::row('user_table', ['user_id'], 'openid = "'.$oopenid.'"');
      $adduserautid= $ouseraut->user_id;
      $jifen="select user_integral from user_table where user_id=".$adduserautid;
      $rejifen=$pdo->query($jifen);
      $duijifen=$rejifen->fetchAll();
      return $duijifen[0][0];
    }
    public function deletecollection_list($clasnam,$claauto,$oopenid){
      $pdo = DB::getInstance();
      $ousersen = DB::row('sentence_table', ['sentence_id'], 'sentence_content = "'.$clasnam.'"');
      $ouseraut = DB::row('user_table', ['user_id'], 'openid = "'.$oopenid.'"');
      $addusersenid= $ousersen->sentence_id;
      $adduserautid= $ouseraut->user_id;
      $deleterows = DB::delete('collection_table', 'sentence_id = '.$addusersenid.'','user_id = '.$adduserautid);
      return "删除成功";
    }
    public function deletepublication_list($clasnam,$claauto,$oopenid){
      $pdo = DB::getInstance();
      $ousersen = DB::row('sentence_table', ['sentence_id'], 'sentence_content = "'.$clasnam.'"');
      $ouseraut = DB::row('user_table', ['user_id'], 'openid = "'.$oopenid.'"');
      $addusersenid= $ousersen->sentence_id;
      $adduserautid= $ouseraut->user_id;
      $delete_publish_rows = DB::delete('publish_table', 'sentence_id = '.$addusersenid.'','user_id = '.$adduserautid);
      return "删除成功";
    }
	}
?> 