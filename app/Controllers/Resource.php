<?php namespace App\Controllers;
use App\Libraries\Server;
/**
* @package     oauth2
* @author      xiaocao
* @link        http://homeway.me/
* @copyright   Copyright(c) 2015
* @version     15.6.25
**/
//defined('BASEPATH') OR exit('No direct script access allowed');

class Resource extends BaseController {

    public function index(){
        //resource api controller
		@session_start();
		$server = new Server();
		$server->require_scope("userinfo cloud file node");//you can require scope here 
        echo json_encode(array('success' => true, 'message' => 'You accessed my APIs!'));
    }
}
