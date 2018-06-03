<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	
	//  by 袁庆龙 start
	// public	$app_id = 'wxdc3e0648f98f4400';
	// public	$secret = '3d5b400d1cf6ddf856e671c03c2a08ac';
	public function __construct()
	{
		parent::__construct();
		//Do your magic here
		$this->load->model("Welcome_model");
		
	}

	//http ： get
	//模拟请求
	public function doGet($url)
    {
        //初始化
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL,$url);
        // 执行后不直接打印出来
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        // 跳过证书检查
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        // 不从证书中检查SSL加密算法是否存在
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

        //执行并获取HTML文档内容
        $output = curl_exec($ch);

        //释放curl句柄
        curl_close($ch);
        
        return $output;
	
	}
	
	//代理请求 
	// http: post
	// way:post
	public function askweixin(){
		$code = $this->input->post('code');
		// $app_id = $this->$app_id;
		// $secret = $this->$secret;
		$app_id = 'wxdc3e0648f98f4400';
		$secret = '3d5b400d1cf6ddf856e671c03c2a08ac';
		$url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$app_id.'&secret='.$secret.'&js_code='.$code.'&grant_type=authorization_code';
		$res = $this->doGet($url); 	//获得微信的反馈结果	
		$row = $this->Welcome_model->user_select($res->openid);//查询用户侧是否存在
		if($row != 'FALSE'){ //user中存在记录
			$arr = [
				'uid'=>$row['u_id'],
				'session_key'=>$row['session_key']
			];
			echo json_encode($arr);
		}else{
			$res_set = $this->Welcome_model->user_set($res->openid);
			if($res_set>0){
				$row_2 = $this->Welcome_model->user_select($res->openid);
				$arr = [
					'uid'=>$row_2['u_id'],
					'session_key'=>$row_2['session_key']
				];
				echo json_encode($arr);
			
			}
		}
		
	}
	
	// by 袁庆龙 end
}
