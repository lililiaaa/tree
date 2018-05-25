<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function get_glod() {

        $this->load->model('user_model');
        $glod=$this->user_model->find_by_glod();
        echo json_encode($glod); 
    }
    
}


