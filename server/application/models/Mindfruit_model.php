<?php defined('BASEPATH') OR exit('No direct script access allowed');

	class Mindfruit_model extends CI_Model{

		//获取心情果实的结果（是否中奖）
		public function get_result(){
			$sql = "select * from mind_fruit order by rand() limit 0,1";
			$res = $this->db->query($sql);
			if(res != 'FALSE'){
	            $data = [];
	            while($row = $res->fetch(\PDO::FETCH_ASSOC)){
	                $data[] = $row;
	            }
	            return $data;
	        }else{
	            return 'FALSE';
	        }

		}

		//如果中奖随机加叶子币
		public function prize($u_id, $leaf){
			$sql = "update user set leaves=leaves+".$leaf." where u_id=".$u_id;
			return $pdo->exec($sql);
		}
	}

?>