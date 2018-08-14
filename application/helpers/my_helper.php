<?php

if(!function_exists('dd')){
	/**
	 * fungsi debug data return
	 * @param array $data
	 */
	function dd($data=array())
	{
		echo "<pre>";
		var_dump($data);
		exit();
	}
}

if(!function_exists('myjson')){
	/**
	 * fungsi test json
	 * @param array $data
	 */
	function myjson($data=array()){
		header('Content-Type: application/json');
		echo json_encode($data);
		exit();
	}
}

if(! function_exists('assets')){
	/**
	 * @param string $src
	 * @param null $folder
	 * @return string
	 */
	function assets($src='', $folder=null) {
		if($folder){
			return base_url('assets/'.$folder.'/'.$src);
		}else{
			return base_url('assets/'.$src);
		}
	}
}

