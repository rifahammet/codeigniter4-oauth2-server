# codeigniter4-oauth2-server
Modify https://github.com/grasses/codeigniter-oauth2-server to run on CodeIgniter4

# Installation

----------------

1.Clone pakcage

> git clone https://github.com/rifahammet/codeigniter4-oauth2-server /path/to/www/root/

2.Config database -> $db

> cd codeigniter-oauth2-server

> vim App/config/database.php

config `DSN`, `hostname`, `username`, `password`, `database`

3.Import database

> mysqldump -u root -p > sql/oauth.sql


# Usage

----------------

* Password Credentials

> Class

```
class PasswordCredentials extends BaseController {
    function __construct(){
        @session_start();
        parent::__construct();
        $this->load->library("Server", "server");
        $this->server->password_credentials();	//credentials check here
    }
    function index(){
        //code here
    }
}
```

> Test

```
URL : http://localhost/codeigniter4-oauth2-server/public/PasswordCredentials
Body :
    {
        'grant_type':'password',
        'client_id':'testclient',
        'client_secret':'testpass',
        'username':'user',
        'password':'pass'
    }
Sample Result :                  
    {
        "access_token": "94896dfc5328e2bad262c68b8b002f4b5d267132",
        "expires_in": 3600,
        "token_type": "Bearer",
        "scope": "userinfo file node cloud share",
        "refresh_token": "800da3ce68c22433391d35ff86400316e00ac904"
    }
```

* Client Credentials

> Class

```
class ClientCredentials extends BaseController {
    function __construct(){
        @session_start();
        parent::__construct();
        $this->load->library("Server", "server");
        $this->server->client_credentials(); //credentials check here
    }    
    function index(){
    	//code here
    }
}
```

> Test

```
URL : http://localhost/codeigniter4-oauth2-server/public/ClientCredentials
Body :
    {
        'grant_type':'client_credentials',
        'client_id':'testclient',
        'client_secret':'testpass'
    }
Sample Result :
    {
        "access_token": "d336552ef826311aa4b59af01d8acc93cf798dbe",
        "expires_in": 3600,
        "token_type": "Bearer",
        "scope": "file node userinfo cloud"
    }
```

* Refresh Token

> Class

```    
class RefreshToken extends BaseController {
    function __construct(){
        @session_start();
        parent::__construct();
        $this->load->library("Server", "server");
    }    
    function index(){
        $this->server->refresh_token(); //refresh token
    }
}
```

> Test

```
URL : http://localhost/codeigniter4-oauth2-server/public/RefreshToken
Body :
    {
        'grant_type':'refresh_token',
        'client_id':'testclient',
        'client_secret':'testpass',
        'refresh_token':'800da3ce68c22433391d35ff86400316e00ac904'
    }
Sample Result :
    {
        "access_token": "3c35be2b8a2b72a4161b39c73cbd54add42cc5ca",
        "expires_in": 3600,
        "token_type": "Bearer",
        "scope": "userinfo file node cloud share",
        "refresh_token": "147263c7a428f8ecbe9c3a6e919ca07b17cc10fa"
    }
```

* Get resource by OAuth2.0 authorize.

> Class

```  
class Resource extends BaseController {
    function __construct(){
        @session_start();
        parent::__construct();
        $this->load->library("Server", "server");
    	$this->server->require_scope("userinfo cloud file node");//you can require scope here 
    }
    public function index(){
        //resource api controller
        echo json_encode(array('success' => true, 'message' => 'You accessed my APIs!'));
    }
}
```

> Test

```
URL : http://localhost/codeigniter4-oauth2-server/public/Resource
Auth :
    - Type = OAuth2
    - Access Token = 3c35be2b8a2b72a4161b39c73cbd54add42cc5ca
Body :
    {
        'grant_type':'client_credentials',
        'client_id':'testclient',
        'client_secret':'testpass'
    }
Sample Result :
    {
        "success": true,
        "message": "You accessed my APIs!"
    }
```

# Features

----------------

* Support for: `Password Credentials`, `Client Credentials`, `Implicit Grant`, `Authorization Code` grant types.

* Refresh access token

* From access token get resource data

* Support for Mysql, Redis, Mongo


# License

----------------

This library is under the MIT license. For the full copyright and license information, please view the LICENSE file that was distributed with this source code.
