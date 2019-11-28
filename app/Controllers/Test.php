<?php
namespace App\Controllers;

class Test extends BaseController {

    function index(){
		@session_start();
    	echo view("oauth2/api");
    }

}
