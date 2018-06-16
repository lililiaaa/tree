<?php

defined('BASEPATH') OR exit('No direct script access allowed');

include_once "public/wxBizDataCrypt.php";

class Welcome extends CI_Controller {

    //破解数据
    //params : sessionKey, encryptedData,iv 
    //return : 解密后的原文  (运动步数->json格式)
    public function dataCrack(){
        $appid = 'wxdc3e0648f98f4400';
        $sessionKey = $this->input->get('sessionKey');
        $encryptedData = $this->input->get('encryptedData');
        $iv = $this->input->get('iv');

        $pc = new WXBizDataCrypt($appid,$sessionKey);
        $errCode = $pc->decryptData($encryptedData, $iv, $data);
        if ($errCode == 0) {
            echo $data;
        } else {
            /*    <li>-41001: encodingAesKey 非法</li>
             *    <li>-41003: aes 解密失败</li>
             *    <li>-41004: 解密后得到的buffer非法</li>
             *    <li>-41005: base64加密失败</li>
             *    <li>-41016: base64解密失败</li>
             */
            echo $errCode;

        }
    } 
?>