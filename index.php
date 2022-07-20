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

session_name('Foxy');
session_start();
define('_Afi', 1);
error_reporting(E_ALL ^ E_NOTICE);
date_default_timezone_set('Europe/Berlin');
define('CWPATH_BASE', dirname(__FILE__) );
define('DS', DIRECTORY_SEPARATOR );

require_once(CWPATH_BASE.DS.'includes/defines.php');
require_once(CWPATH_CLASSES.DS.'factory.php');

$config 	= factory::getConfig();
$app    	= factory::getApplication();
$db    	 	= factory::getDatabase();
$user   	= factory::getUser();
$lang   	= factory::getLanguage();
$html   	= factory::getHtml();
$url    	= factory::getUrl();
$session 	= factory::getSession();
//$settings   = factory::getSettings();
$log 		= factory::getLog();

//$log->lwrite('Init app');

//trigger plugin onRender before the app is ready...
//$app->trigger('onRender', array());

//print_r($_SESSION);
//print_r(get_declared_classes());

//set error level
if($config->debug == 1) {
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
}

//render application
include($app->getView());
include($app->getTemplate());

?>
