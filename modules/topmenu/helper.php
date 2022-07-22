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

defined('_Afi') or die ('restricted access');

class topmenuHelper
{

	public static function isAdmin()
	{
		$user = factory::getUser();

		if($user->level == 1) { return true; } 

		return false;
	}

}
