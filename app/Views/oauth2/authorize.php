<?php
$action = "/oauth2/Authorize?response_type=".$response_type."&client_id=".$client_id."&redirect_uri=".$redirect_uri."&state=".$state."&scope=".$scope;
?>

<body>
<div style="text-align:center;">
 	<form method="post">
      	<div class="oauth_content" node-type="commonlogin">
        	<p class="oauth_main_info"><a href="http://satualgoritma.com"  target="_blank" class="app_name">The One Algo</a></p>
			<input name="authorized" value="yes" hidden>
			<button>Submit</button>
		</div>
    </form>
    <p><b>Press Button Submit</b></p>
    	
   	</div>
</body>
</html>

