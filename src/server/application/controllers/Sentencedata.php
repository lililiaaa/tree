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
  //获取叶子币数和签到天数
   public function get_signin_list()
  {
    $openid = $this->input->get('oopenid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->getsigninlist($openid);
    echo json_encode($result);
  }
  //修改叶子币数和签到天数
  public function modify_user_list()
  {
    $omoney= $this->input->get('omoney');
    $oday= $this->input->get('oday');
    $openid = $this->input->get('oopenid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->modifyuser_list($omoney,$oday,$openid);
  }
  //添加好友
  public function add_friend_list()
  {
    $oheadimg= $this->input->get('oheadimg');
    $oname= $this->input->get('oname');
    $omoney= $this->input->get('omoney');
    $openid = $this->input->get('oopenid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->addfriendlist($oheadimg,$oname,$omoney,$openid);
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
    echo json_encode($openid);
  }
  public function get_publish_list()
  {
    $otextarea = $this->input->get('otextarea');
    $oleibie = $this->input->get('oleibie');
    $oauthor = $this->input->get('oauthor');
    $oopenid = $this->input->get('oopenid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->add_publish_list($otextarea,$oleibie,$oauthor,$oopenid);
    echo json_encode($result);
  }
  public function get_publication_list()
  {
    $oopenid = $this->input->get('oopenid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->get_publish_list($oopenid);
    echo json_encode($result);
  }
  public function add_collection_list()
  {
    $clasnam = $this->input->get('clasnam');
    $claauto = $this->input->get('claauto');
    $oopenid = $this->input->get('oopenid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->add_collection_list($clasnam,$claauto,$oopenid);
    echo json_encode($result);
  }
  public function get_collection_list()
  {
    $oopenid = $this->input->get('oopenid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->getcollection_list($oopenid);
    echo json_encode($result);
  }
  public function delete_collection_list()
  {
    $clasnam = $this->input->get('clasnam');
    $claauto = $this->input->get('claauto');
    $oopenid = $this->input->get('oopenid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->deletecollection_list($clasnam,$claauto,$oopenid);
    echo json_encode($result);
  }
  public function delete_publacition_list()
  {
    $clasnam = $this->input->get('clasnam');
    $claauto = $this->input->get('claauto');
    $oopenid = $this->input->get('oopenid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->deletepublication_list($clasnam,$claauto,$oopenid);
    echo json_encode($result);
  }
  public function get_integral()
  {
    $oopenid = $this->input->get('oopenid');
    $this->load->model('sentence_model');
    $result=$this->sentence_model->getintegral($oopenid);
    echo json_encode($result);
  }
}
?>