# codeigniter4-oauth2-server
Modify https://github.com/grasses/codeigniter-oauth2-server to run on CodeIgniter4

# Installation

----------------

1.Clone pakcage

> git clone https://github.com/rifahammet/codeigniter4-oauth2-server /path/to/www/root/

2.Config database -> $db['oauth']

> cd codeigniter-oauth2-server

> vim App/config/database.php

config `DSN`, `hostname`, `username`, `password`, `database`

3.Import database

> mysqldump -u root -p > sql/oauth.sql


# Usage

----------------

* Password Credentials

```
class PasswordCredentials extends CI_Controller {
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

* Client Credentials

```
class ClientCredentials extends CI_Controller {
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

* Refresh Token

```
class RefreshToken extends CI_Controller {
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

* Get resource by OAuth2.0 authorize.

```
class Resource extends CI_Controller {
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

* More usage:

for more usage please see: `application/controllers/Test.php`



# Features

----------------

* Support for: `Password Credentials`, `Client Credentials`, `Implicit Grant`, `Authorization Code` grant types.

* Refresh access token

* From access token get resource data

* Support for Mysql, Redis, Mongo


# License

----------------

This library is under the MIT license. For the full copyright and license information, please view the LICENSE file that was distributed with this source code.
