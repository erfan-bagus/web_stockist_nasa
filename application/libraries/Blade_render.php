<?php if (!defined('BASEPATH')) exit('No dire	ct script access allowed');
require 'vendor/autoload.php';

use Jenssegers\Blade\Blade;

class Blade_render
{

	public function __construct()
	{
		$CI=&get_instance();

	}

	public function views($view, $data = array())
	{
		$blade = new Blade(APPPATH . 'views', APPPATH . 'cache');
		echo $blade->make($view, $data);


		exit();
	}

}
