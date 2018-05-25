<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

  public function __construct(){
      parent::__construct();
      $this->load->model("vocabulary_model");
  } 

  // by 袁庆龙 start

  //默认载入
	public function index()
	{
		$this->load->view('welcome_message');
	}

  //搜索功能，
  public function search(){
    $search_words = $this->input->get("search_words");
    
  }

  // by 袁庆龙 end
  
}
