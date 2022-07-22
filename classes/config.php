<?php
/**
* @version     1.0.0 Afi Framework $
* @package     Afi Framework
* @copyright   Copyright © 2014 - All rights reserved.
* @license	    GNU/GPL
* @author	    kim
* @author mail kim@afi.cat
* @website	    http://www.afi.cat
*
*/

defined('_Afi') or die('restricted access');

class Configuration {

	public $site        	= 'https://xxx/';
	public $offline     	= 0;
	public $log         	= '/www/foxy.log';
	public $sitename    	= 'Foxy';
	public $description 	= '';
	public $email       	= 'kim@afi.cat';
	public $debug       	= 1;
	public $driver      	= 'mysqli';
	public $host        	= 'localhost';
	public $user        	= '';
	public $pass        	= '';
	public $database    	= '';
	public $dbprefix    	= '';
	public $token_time  	= 300;
	public $template    	= 'mazer';
	public $cookie      	= 30;
	public $admin_mails 	= 1;
	public $inactive    	= 1000;
	public $login_redirect 	= '/index.php?view=home';
	public $show_register 	= 0;
	public $pagination  	= 20;
}
