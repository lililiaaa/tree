<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Sentencedata extends CI_Controller {
  //获取排行
  public function get_list()//获取排行
  {
    $this->load->model('sentence_model');
    $result=$this->sentence_model->getlist();
    echo json_encode($result);
  }
  // //获取排行和叶子币
  public function get_paimon_list(){
    $this->load->model('sentence_model');
    $result=$this->sentence_model->getpaimonlist();
    echo json_encode($result);
  }
  // //获取叶子币数和签到天数
   public function get_signin_list()
  {
    $ouserid = $this->input->get('ouserid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->getsigninlist($ouserid);
    echo json_encode($result);
  }
  // //修改叶子币数和签到天数
  public function modify_user_list()
  {
    $omoney= $this->input->get('omoney');
    $oday= $this->input->get('oday');
    $ouserid = $this->input->get('ouserid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->modifyuser_list($omoney,$oday,$ouserid);
  }
  // //添加好友
  public function add_friend_list()
  {
    $oheadimg= $this->input->get('oheadimg');
    $oname= $this->input->get('oname');
    $omoney= $this->input->get('omoney');
    $ourseid = $this->input->get('ourseid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->addfriendlist($oheadimg,$oname,$omoney,$ourseid);
    echo json_encode($result);
  }
  //获取openid添加用户信息
  public function get_user_list()//获取openid添加用户信息
  {
    $onickName=$this->input->get('oonickName');
    $oheadimg=$this->input->get('ooheadimg');
    $code=$this->input->get('oocode');
    $url= 'https://api.weixin.qq.com/sns/jscode2session?appid=wxdc3e0648f98f4400&secret=52a036643e6ecbd16498f7e1736b78c9&js_code='.$code.'&grant_type=authorization_code';
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_HEADER,0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
    $res = curl_exec($ch);
    $json_obj=json_decode($res);
    curl_close($ch);
    $openid = $json_obj->openid;
    $this->load->model('sentence_model');
    $result=$this->sentence_model->add_user_list($openid,$onickName,$oheadimg);
    echo json_encode($result);
  }
  //获取好友列表
  public function get_friend_list()//获取好友列表
  {
    $ouserid = $this->input->get('ouserid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->getfriend_list($ouserid);
    echo json_encode($result);
  }
  // //获取好友树屋和精灵
  public function get_houseandpet(){//获取好友树屋和精灵
    $oheadimg= $this->input->get('headimg');
    $oname= $this->input->get('username');
    $omoney= $this->input->get('usermoney');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->houseandpet($oheadimg,$oname,$omoney);
    echo json_encode($result);
  }
  // //修改叶子币数
  public function modify_lmoney(){
    $omoney= $this->input->get('changenmoney');
    $ouserid = $this->input->get('ouserid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->modifylmoney($omoney,$ouserid);
  }
  //获取房屋列表
  public function get_house_list(){
    $ourseid = $this->input->get('ourseid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->gethouselist($ourseid);
    echo json_encode($result);
  }
  //获取精灵列表
  public function get_person_list(){
    $ourseid = $this->input->get('ourseid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->getpersonlist($ourseid);
    echo json_encode($result);
  }
  // ////由code获取sessionId
  public function get_sessionId(){
    $appid = 'wxdc3e0648f98f4400';
    $appsecret = '52a036643e6ecbd16498f7e1736b78c9';
    $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$appid.'&secret='.$appsecret.'&js_code='.$_GET['code'].'&grant_type=authorization_code';
    $content = file_get_contents($url);
    $content = json_decode($content);
    echo $content->session_key;
  }
  //解密的数据
  public function get_step(){
    $pc = new WXBizDataCrypt($appid, $sessionKey);
    $errCode = $pc->decryptData($encryptedData, $iv, $data );
    if ($errCode == 0) {
    print($data . "\n");
    } else {
    print($errCode . "\n");
    }
  }
}
?>