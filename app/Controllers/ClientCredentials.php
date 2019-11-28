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

class ClientCredentials extends BaseController {


    function index(){
		@session_start();
		$server = new Server();		
        $server->client_credentials();
    }
}
