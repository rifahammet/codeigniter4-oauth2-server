<?php namespace App\Controllers;
use App\Libraries\Server;

class Authorize extends BaseController {

    function index(){
		@session_start();
        if(isset($_GET["scope"])) $scope = $_GET["scope"];
        if(isset($_GET["state"])) $state = $_GET["state"];
        if(isset($_GET["client_id"])) $client_id = $_GET["client_id"];
        if(isset($_GET["redirect_uri"])) $redirect_uri = $_GET["redirect_uri"];
        if(isset($_GET["response_type"])) $response_type = $_GET["response_type"];
		
		$server = new Server();	
        if(!isset($_POST["authorized"])){
            $server->check_client_id();
            $data = array(
                "scope" => $scope,
                "state" => $state,
                "client_id" => $client_id,
                "redirect_uri" => $redirect_uri,
                "response_type" => $response_type,
            );
            echo view("oauth2/authorize", $data);
        }else{
            $authorized = $_POST["authorized"];
            if($authorized === "yes"){
                $server->authorize(($authorized === "yes"));
            }else{
                echo "error";
            }
        }
    }

    function token(){
		$server = new Server();	
        $server->authorization_code("yes");
    }
}
