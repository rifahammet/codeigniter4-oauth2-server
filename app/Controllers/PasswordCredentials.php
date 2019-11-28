<?php namespace App\Controllers;
use App\Libraries\Server;


class PasswordCredentials extends BaseController 
{

    function index(){
		 @session_start();
		$server = new Server();
		$server->password_credentials();
    }
}
