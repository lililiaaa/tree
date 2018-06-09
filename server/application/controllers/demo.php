<?php

include_once "wxBizDataCrypt.php";


$appid = '';//咱们的微信小程序ID
$sessionKey = $this->input->post('sessionKey');

$encryptedData=$this->input->post('encryptedData');

$iv = $this->input->post('iv');

$pc = new WXBizDataCrypt($appid, $sessionKey);
$errCode = $pc->decryptData($encryptedData, $iv, $data );

if ($errCode == 0) {
    echo($data . "\n");
} else {
    echo($errCode . "\n");
}
